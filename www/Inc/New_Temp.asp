<%
Function Fun_StrAll(strHTML)
	If Instr(strHTML,"{/new:navlist}")>0 Then strHTML=FunNavList(strHTML,"")
	If Instr(strHTML,"{/new:nav}")>0 Then strHTML=FunTypeNav(strHTML)
	If Instr(strHTML,"{/new:content}")>0 Then strHTML=FunListRead(strHTML)
	If Instr(strHTML,"{/new:datefile}")>0 Then strHTML=FunDateFile(strHTML)
	If Instr(strHTML,"{/new:comment}")>0 Then strHTML=FunComment(strHTML)
	If Instr(strHTML,"{/new:link}")>0 Then strHTML=FunLink(strHTML)
	If Instr(strHTML,"{/new:imgstr}")>0 Then strHTML=FunImg(strHTML)
	If Instr(strHTML,"{/new:tagslist}")>0 Then strHTML=FunTags(strHTML)
	If Instr(strHTML,"{new:ad id=")>0 Then strHTML=FunAD(strHTML)
	If Instr(strHTML,"{%")>0 AND Instr(strHTML,"%}")>0 Then strHTML=FunApi(strHTML)
	If Instr(strHTML,"{next}")>0 Then strHTML=FunFor(strHTML)
	If Instr(strHTML,"{end if}")>0 Then strHTML=FunIf(strHTML)
	If New_Gzip=0 Then strHTML=Replace(replace(replace(strHTML,Chr(13),""),Chr(10),""),"	","")
	Fun_StrAll=replace(FunVers(strHtml),"{new:overtime}",OverTime)
End Function
Function caseSort(a)
	Select case lcase(a)
		case "random" caseSort=exe.Random
		case "id" caseSort="{Acc}read.id desc"
		case "time" caseSort="{Acc}read.addtime desc,{Acc}read.id desc"
		case "sort" caseSort="{Acc}read.sort desc,{Acc}read.id desc"
		case "i" caseSort="{Acc}read.i desc,{Acc}read.id desc"
		case "comment" caseSort="{Acc}read.commentnum desc,{Acc}read.id desc"
		Case "top" caseSort="{Acc}read.itop desc,{Acc}read.id desc"
		Case "push" caseSort="{Acc}read.push desc,{Acc}read.id desc"
		Case "toppush" caseSort="{Acc}read.itop desc,{Acc}read.push desc,{Acc}read.id desc"
		case else  caseSort="{Acc}read.id desc"
	End Select
End Function
Function casetype(a)
	Select case lcase(a)
		case "img" casetype="AND {Acc}read.img<>''"
		case "top" casetype="AND {Acc}read.itop=2"
		case "push" casetype="AND {Acc}read.push=1"
		case "imgtop" casetype="AND {Acc}read.img<>'' AND {Acc}read.itop=2"
		case "imgpush" casetype="AND {Acc}read.img<>'' AND {Acc}read.push=1"
		case else  casetype=""
	End Select
End Function
Function casedate(a)
	Select case lcase(a)
		case "year" casedate="AND Year({Acc}read.addtime)="&Year(DATE())
		case "month" casedate="AND Year({Acc}read.addtime)="&Year(DATE())&" AND month({Acc}read.addtime)="&Month(DATE())
		case "day" casedate="AND Year({Acc}read.addtime)="&Year(DATE())&" AND month({Acc}read.addtime)="&Month(DATE())&" AND day({Acc}read.addtime)="&day(DATE())
		case "lmonth" casedate="AND month({Acc}read.addtime)="&Month(DATE())
		case "lday" casedate="AND month({Acc}read.addtime)="&Month(DATE())&" AND day({Acc}read.addtime)="&day(DATE())
		case else  casedate=""
	End Select
End Function
Function casetags(a)
	Select case lcase(a)
		case "i" casetags="i"
		case "id" casetags="id"
		case "ii" casetags="ii"
		case else casetags="id"
	End Select
End Function
Function caselink(a)
	Select case lcase(a)
		case "logo" casetype="AND logo<>''"
		case "ico" casetype="AND ico<>''"
		case else  casetype=""
	End Select
End Function
Function FunHome(str)
	FunHome=Fun_File(Fun_FileLink&str)
	If instr(FunHome,"{new:template src=")>0 Then FunHome=Funtemp(FunHome)
	FunHome=FunAll(FunHome)
	FunHome=replace(FunHome,"{new:navid}",-1)
	FunHome=replace(FunHome,"{new:rootid}",-1)
	FunHome=Fun_StrAll(FunHome)
End Function


Function Funtemp(strHTML) 
exe.RegExp "\{new:template src=([\s\S]*?)\}",strHTML
For Each m In exe.colMatches
la=m.SubMatches(0)
strHTML = replace(strHTML,"{new:template src="&la&"}",Fun_File(Fun_FileLink&la))
Next
set exe.colMatches=nothing
Funtemp=strHTML
If instr(strHTML,"{new:template src=")>0 Then Funtemp=Funtemp(Funtemp) Else Funtemp=Funtemp:Exit Function
End Function

Function FunNavlist(strHTML,str)
Dim vnum,vtype,img,vclass,vid,vtop,link,b
exe.RegExp "{new:"&str&"navlist([\s\S]*?)}([\s\S]*?){/new:"&str&"navlist}",strHTML
For Each m In exe.colMatches
b=""
la=m.SubMatches(0)
lb=m.SubMatches(1)
If instr(la,"num=")>0 Then vtop="TOP "&ArrNum(la,"num",10) Else vtop=""
If instr(la,"id=")>0 Then vid="rootid="&ArrNum(la,"id",0)&" AND " Else vid=""
If instr(la,"type=")>0 Then vtype="property="&Fun_parseArr(la)("type")&" AND " Else vtype="property=0 AND "
If instr(la,"class=")>0 Then vclass="AND address="&ArrNum(la,"class",0) Else vclass=""
linkArray=exe.StrRS("SELECT "&vtop&" id,name,enname,target,img,info,listlink,url,type FROM {Acc}Nav where "&vid&" "&vtype&" display=0 "&vclass&" order by sort desc,id desc","arr")::exe.OverRS()
if not isarray(linkArray) then  vnum=-1  else vnum=ubound(linkArray,2)
for i=0 to vnum
img=linkArray(4,i)
link=GetNav(linkArray(6,i),linkArray(0,i),"",linkArray(2,i),linkArray(1,i),SEO_bak,temtype)
If linkArray(7,i)<>"" AND linkArray(8,i)=2 Then link=linkArray(8,i) Else link=link
If Fun_null(img) Then img=New_nullimg
a=StrGen(lb,str&"navlist:name","["&str&"navlist:name len=","]",linkArray(1,i))
If Instr(a,str&"navlist:id")>0 Then a=replace(a,"["&str&"navlist:id]",linkArray(0,i))
If Instr(a,str&"navlist:enname")>0 Then a=replaceStr(a,"["&str&"navlist:enname]",linkArray(2,i))
If Instr(a,str&"navlist:target")>0 Then a=replaceStr(a,"["&str&"navlist:target]",linkArray(3,i))
If Instr(a,str&"navlist:img")>0 Then a=replaceStr(a,"["&str&"navlist:img]",img)
If Instr(a,str&"navlist:info")>0 Then a=StrGen(a,""&str&"navlist:info","["&str&"navlist:info len=","]",Fun_Html(linkArray(5,i),0))
If Instr(a,str&"navlist:link")>0 Then a=replaceStr(a,"["&str&"navlist:link]",link)
If Instr(a,str&"navlist:down")>0 Then
exe.StrRS "SELECT id FROM {Acc}Nav WHERE property="&linkArray(0,i),"exe"
If exe.RS.bof Then a=replaceStr(a,"["&str&"navlist:down]",false) Else a=replaceStr(a,"["&str&"navlist:down]",true)
exe.OverRS()
End If
b=b&a
next
strHTML=replace(strHTML,"{new:"&str&"navlist"&la&"}"&lb&"{/new:"&str&"navlist}",b)
Next
set exe.colMatches=nothing
FunNavlist=strHTML
If Str="" Then Str=1
If Instr(strHTML,str+1&"navlist")>0 Then FunNavlist=FunNavlist(strHTML,str+1) else Exit Function
End Function

Function FunTypeNav(strHTML)
Dim vid,id,user,enuser,img,link,url
exe.RegExp "{new:nav id=([\s\S]*?)}([\s\S]*?){/new:nav}",strHTML
For Each m In exe.colMatches
la=m.SubMatches(0)
lb=m.SubMatches(1)
exe.StrRS "SELECT id,name,enname,target,img,info,listlink,url,type FROM {Acc}Nav where id="&la&" AND display=0","exe"
id=exe.RS(0)
user=exe.RS(1)
enuser=exe.RS(2)
img=exe.RS(4)
url=exe.RS(8)
link=GetNav(exe.RS(6),id,"",enuser,user,SEO_bak,temtype)
If url<>"" AND exe.RS(8)=2 Then link=url Else link=link
If Fun_null(img) Then img=New_nullimg
a=StrGen(lb,"nav:name","[nav:name len=","]",user)
a=replaceStr(a,"[nav:link]",link)
If Instr(a,"nav:id")>0 Then a=replaceStr(lb,"[nav:id]",id)
If Instr(a,"nav:enname")>0 Then a=replaceStr(a,"[nav:enname]",enuser)
If Instr(a,"nav:target")>0 Then a=replaceStr(a,"[nav:target]",exe.RS(3))
If Instr(a,"nav:img")>0 Then a=replaceStr(a,"[nav:img]",img)
If Instr(a,"nav:info")>0 Then a=StrGen(a,"nav:info","[nav:info len=","]",Fun_Html(exe.RS(5),0))
Exe.OverRS()
strHTML=replace(strHTML,"{new:nav id="&la&"}"&lb&"{/new:nav}",a)
Next
set exe.colMatches=nothing
FunTypeNav=strHTML
END Function

Function FunListRead(strHTML)
Dim vid,Vpx,vmun,vtype,vdate,img,vclass,keys,iclass,noid
exe.RegExp "{new:content([\s\S]*?)}([\s\S]*?){/new:content}",strHTML
For Each m In exe.colMatches
	b=""
	la=m.SubMatches(0)
	lb=m.SubMatches(1)
	If Instr(la,"id=")>0 Then vid="AND {Acc}Read.property in ("&ArrNum(la,"id",1)&")" Else vid=""
	If Instr(la,"order=")>0 Then Vpx=caseSort(Fun_parseArr(la)("order")) Else Vpx="{Acc}read.id desc"
	If Instr(la,"num=")>0 Then vmun=ArrNum(la,"num",10) Else vmun=10
	If Instr(la,"type=")>0 Then vtype=casetype(Fun_parseArr(la)("type")) Else vtype=""
	If Instr(la,"date=")>0 Then vdate=casedate(Fun_parseArr(la)("date")) Else vdate=""
	If Instr(la,"no=")>0 Then noid="AND {Acc}Read.id<>"&Fun_parseArr(la)("no") Else noid=""
	If Instr(la,"s=")>0 Then 
	iclass=Fun_parseArr(la)("s")
	keys=split(iclass,"，")
	num=ubound(keys)
	for i=0 to num
	If i=0 Then vclass=vclass&"AND ({Acc}Read.name like '%"&keys(i)&"%'" Else  vclass=vclass&" or {Acc}Read.name like '%"&keys(i)&"%'"
	If i=num Then vclass=vclass&")"
	next
	else
	vclass=""
	End If
	linkArray=exe.StrRS("SELECT TOP "&vmun&" {Acc}read.id,{Acc}read.dateid,{Acc}read.name,{Acc}read.idesc,{Acc}read.img,{Acc}read.iuser,{Acc}read.link,{Acc}read.i,{Acc}read.addtime,(SELECT count(c.id) FROM {Acc}comment c WHERE c.fileid={Acc}read.id AND c.display=0),{Acc}read.push,{Acc}read.itop,{Acc}read.client,{Acc}Nav.name,{Acc}Nav.infolink,{Acc}Nav.listLink,{Acc}Nav.enname,{Acc}read.info,{Acc}read.title,{Acc}Nav.id,{Acc}Read.tags,{Acc}Read.itop,{Acc}Read.push from {Acc}read,{Acc}Nav WHERE {Acc}Nav.ID={Acc}read.property AND {Acc}read.display=0 "&vdate&" "&vtype&" "&vid&" "&vclass&" "&noid&" order by "&Vpx&"","arr"):exe.OverRS()
	if not isarray(linkArray) then  vnum=-1  else vnum=ubound(linkArray,2)
	for i=0 to vnum
	a=lb
	If Fun_null(linkArray(4,i)) Then img=New_nullimg Else img=linkArray(4,i)
	If Instr(a,"content:id")>0 Then a=replace(a,"[content:id]",linkArray(0,i))
	If Instr(a,"content:strid")>0 Then a=replaceStr(a,"[content:strid]",i)
	If Instr(a,"content:overid")>0 Then a=replaceStr(a,"[content:overid]",vnum)
	If Instr(a,"content:name")>0 Then a=StrGen(a,"content:name","[content:name len=","]",linkArray(2,i))
	If Instr(a,"content:time")>0 Then a=Fun_TypeDate(a,"content:time","[content:time type=","]",linkArray(8,i))
	If Instr(a,"content:desc")>0 Then a=StrGen(a,"content:desc","[content:desc len=","]",linkArray(3,i))
	If Instr(a,"content:img")>0 Then a=replaceStr(a,"[content:img]",img)
	If Instr(a,"content:user")>0 Then a=replaceStr(a,"[content:user]",linkArray(5,i))
	If Instr(a,"content:link")>0 Then a=replaceStr(a,"[content:link]",linkArray(6,i))
	If Instr(a,"content:userlink")>0 Then a=replace(a,"[content:userlink]",GetNav(SEO_author,linkArray(5,i),"",linkArray(16,i),linkArray(13,i),SEO_bak,temtype))
	If Instr(a,"content:i")>0 Then a=replaceStr(a,"[content:i]",linkArray(7,i))
	If Instr(a,"content:commentnum")>0 Then a=replaceStr(a,"[content:commentnum]",linkArray(9,i))
	If Instr(a,"content:push")>0 Then a=replaceStr(a,"[content:push]",linkArray(10,i))
	If Instr(a,"content:top")>0 Then a=replaceStr(a,"[content:top]",linkArray(11,i))
	If Instr(a,"content:client")>0 Then a=replaceStr(a,"[content:client]",Fun_StrKhd(linkArray(12,i)))
	If Instr(a,"content:navname")>0 Then a=StrGen(a,"content:navname","[content:navname len=","]",linkArray(13,i))
	If Instr(a,"content:infolink")>0 Then a=replaceStr(a,"[content:infolink]",GetNav(linkArray(14,i),Getdateid(linkArray(0,i),linkArray(1,i)),"",linkArray(16,i),linkArray(13,i),SEO_bak,temtype))
	If Instr(a,"content:listlink")>0 Then a=replaceStr(a,"[content:listlink]",GetNav(linkArray(15,i),linkArray(19,i),"",linkArray(16,i),linkArray(13,i),SEO_bak,temtype))
	If Instr(a,"content:navenname")>0 Then a=StrGen(a,"content:navenname","[content:navenname len=","]",linkArray(16,i))
	If Instr(a,"content:title")>0 Then a=StrGen(a,"content:title","[content:title len=","]",linkArray(18,i))
	If Instr(a,"content:info")>0 Then a=StrGen(a,"content:info","[content:info len=","]",Fun_Html(linkArray(17,i),0))
	If Instr(a,"content:tags")>0 Then a=replaceStr(a,"[content:tags]",linkArray(20,i))
	If Instr(Strhtml,"read:tagslink")>0 Then
	Dim itags,iitags,ii
	itags=split(linkArray(20,i),"，")
	for ii=0 to ubound(itags)
	iitags=iitags&"<a href="""&GetNav(SEO_Tags,itags(ii),"","","",SEO_bak,temtype)&""" title="""&itags(ii)&" "">"&itags(ii)&"</a> "
	next
	a=replace(a,"[content:tagslink]",iitags)
	End If
	b=b&a
	next
	strHTML=replace(strHTML,"{new:content"&la&"}"&lb&"{/new:content}",b)
Next
set exe.colMatches=nothing
FunListRead=strHTML
END Function

Function FunDateFile(strHTML)
	exe.RegExp "{new:datefile}([\s\S]*?){/new:datefile}",strHTML
	For Each m In exe.colMatches
	b=""
	la=m.SubMatches(0)
	linkArray=exe.StrRS("select year(addtime),month(addtime),count(addtime) from {Acc}read group by month(addtime),year(addtime) order By year(addtime) desc,month(addtime) desc","arr"):exe.OverRS()
	if not isarray(linkArray) then  vnum=-1  else vnum=ubound(linkArray,2)
	for i=0 to vnum
	stra=linkArray(0,i)
	strb=right(100+linkArray(1,i),2)
	a=replace(la,"[datefile:year]",stra)
	a=replace(a,"[datefile:month]",strb)
	a=replace(a,"[datefile:num]",linkArray(2,i))
	a=replace(a,"[datefile:link]",GetNav(SEO_date,stra&strb,"","","",SEO_bak,temtype))
	b=b&a
	next
	strHTML=replaceStr(strHTML,"{new:datefile}"&la&"{/new:datefile}",b)
	next
	set exe.colMatches=nothing
	FunDateFile=strHTML
End Function

Function FunLink(strHTML)
dim stri,strn
	exe.RegExp "{new:link([\s\S]*?)}([\s\S]*?){/new:link}",strHTML
    For Each m In exe.colMatches
	b=""
	la=m.SubMatches(0)
	lb=m.SubMatches(1)
	if instr(la,"num=")>0 Then num=ArrNum(la,"num",10) Else num=10
	if instr(la,"type=")>0 Then stri=caselink(Fun_parseArr(la)("type")) Else stri=""
	If instr(la,"class=")>0 Then strn="AND property="&Fun_parseArr(la)("class") Else strn=""
	linkArray=exe.StrRS("SELECT TOP "&num&" id,name,url,logo,ico,idesc,NoFollow,qq FROM {Acc}Link WHERE display=0 "&stri&" "&strn&" ORDER BY sort desc,id desc","arr"):exe.overRS()
	if not isarray(linkArray) then  vnum=-1  else vnum=ubound(linkArray,2)
	for i=0 to vnum
	a=replaceStr(lb,"[link:name]",linkArray(1,i))
	a=replaceStr(a,"[link:url]",linkArray(2,i))
	If instr(a,"[link:logo]")>0 Then a=replaceStr(a,"[link:logo]",linkArray(3,i))
	If instr(a,"[link:ico]")>0 Then a=replaceStr(a,"[link:ico]",linkArray(4,i))
	If instr(a,"[link:desc]")>0 Then a=StrGen(a,"link:desc","[link:desc len=","]",linkArray(5,i))
	If instr(a,"[link:nofollow]")>0 Then a=replaceStr(a,"[link:nofollow]",linkArray(6,i))
	If instr(a,"[link:qq]")>0 Then a=replaceStr(a,"[link:qq]",linkArray(7,i))
	b=b&a
	next
	strHTML = replace(strHTML,"{new:link"&la&"}"&lb&"{/new:link}",b)
    Next
	SET exe.colMatches=Nothing
	FunLink = strHTML
End Function

Function FunComment(strHTML)
dim strn,vnumi,iclass,classnum,link,linkArray
	linkArray=""
	exe.RegExp "{new:comment([\s\S]*?)}([\s\S]*?){/new:comment}",strHTML
    For Each m In exe.colMatches
	b=""
	la=m.SubMatches(0)
	lb=m.SubMatches(1)
	if instr(la,"num=")>0 Then num="TOP "&ArrNum(la,"num",10) Else num="" End If
	If instr(la,"class=")>0 Then
	classnum=ArrNum(la,"class",0)
	iclass="AND {Acc}Comment.property="&classnum
	Else
	classnum="0"
	iclass=""
	End If
	If instr(la,"id=")>0 Then strn="AND {Acc}Comment.fileid="&ArrNum(la,"id",1) Else strn=""
	If classnum="0" OR Not Fun_Num(classnum) Then 
	linkArray=exe.StrRS("SELECT "&num&" id,reid,name,img,mail,qq,url,tel,idesc,addtime,dateid,fileid,(SELECT count(c.id) FROM {Acc}comment c WHERE c.name={Acc}Comment.name AND c.display=0),client FROM {Acc}Comment WHERE display=0 "&iclass&" ORDER BY addtime desc,id desc","arr")
	Else
	linkArray=exe.StrRS("SELECT "&num&" {Acc}Comment.id,{Acc}Comment.reid,{Acc}Comment.name,{Acc}Comment.img,{Acc}Comment.mail,{Acc}Comment.qq,{Acc}Comment.url,{Acc}Comment.tel,{Acc}Comment.idesc,{Acc}Comment.addtime,{Acc}Comment.dateid,{Acc}Comment.fileid,(SELECT count(c.id) FROM {Acc}comment c WHERE c.name={Acc}Comment.name AND c.display=0),{Acc}Comment.client,{Acc}Nav.infolink,{Acc}Nav.enname,{Acc}Nav.name FROM {Acc}Comment,{Acc}Nav WHERE {Acc}Comment.display=0 "&strn&" "&iclass&" AND (SELECT b.property FROM {Acc}Read b WHERE b.id={Acc}Comment.fileid)={Acc}Nav.id ORDER BY {Acc}Comment.addtime desc,{Acc}Comment.id desc","arr")
	end If
	if not isarray(linkArray) then  vnum=-1  else vnum=ubound(linkArray,2)
	for i=0 to vnum
	vnumi=vnum-i+1
	If classnum<>"0" Then link=GetNav(linkArray(14,i),Getdateid(linkArray(11,i),linkArray(10,i)),"",linkArray(15,i),linkArray(16,i),SEO_bak,temtype) Else link=""
	a=replaceStr(lb,"[comment:name]",linkArray(2,i))
	If instr(a,"comment:id")>0 Then a=replace(a,"[comment:id]",linkArray(0,i))
	If instr(a,"comment:t")>0 Then a=replaceStr(a,"[comment:t]",vnumi)
	If instr(a,"comment:img")>0 Then a=replaceStr(a,"[comment:img]",linkArray(3,i))
	If instr(a,"comment:mail")>0 Then a=replaceStr(a,"[comment:mail]",linkArray(4,i))
	If instr(a,"comment:qq")>0 Then a=replaceStr(a,"[comment:qq]",linkArray(5,i))
	If instr(a,"comment:url")>0 Then a=replaceStr(a,"[comment:url]","/?go="&linkArray(6,i))
	If instr(a,"comment:tel")>0 Then a=replaceStr(a,"[comment:tel]",linkArray(7,i))
	If instr(a,"comment:desc")>0 Then a=StrGen(a,"comment:desc","[comment:desc len=","]",linkArray(8,i))
	If Instr(a,"comment:time")>0 Then a=Fun_TypeDate(a,"comment:time","[comment:time type=","]",linkArray(9,i))
	If Instr(a,"comment:link")>0 Then a=replaceStr(a,"[comment:link]",link)
	If Instr(a,"comment:vip")>0 Then a=replaceStr(a,"[comment:vip]",Fun_StrVip(linkArray(12,i)))
	If Instr(a,"comment:num")>0 Then a=replaceStr(a,"[comment:num]",linkArray(12,i))
	If Instr(a,"comment:client")>0 Then a=replaceStr(a,"[comment:client]",Fun_Strkhd(linkArray(13,i)))
	b=b&a
	next
	strHTML = replace(strHTML,"{new:comment"&la&"}"&lb&"{/new:comment}",b)
    Next
	SET exe.colMatches=Nothing
	FunComment = strHTML 
End Function

Function FunImg(strHTML)
Dim strc,itype
	exe.RegExp "{new:imgstr([\s\S]*?)}([\s\S]*?){/new:imgstr}",strHTML
    Set colMatches = re.Execute(strHTML)
    For Each m In colMatches
	b="":la=m.SubMatches(0):lb=m.SubMatches(1)
	If Instr(la,"id=")=0 Then:FunImg=strHTML:exit Function:End If
	If Instr(la,"type=")>0 Then itype=ArrNum(la,"type",1) Else itype=1
	If itype=1 Then 
	exe.StrRS "SELECT info From {Acc}Read WHERE ID="&Fun_parseArr(la)("id"),"exe"
	ElseIf itype=0 Then 
	exe.StrRS "SELECT info From {Acc}Nav WHERE ID="&Fun_parseArr(la)("id"),"exe"
	End If
	If Not exe.RS.Eof Then str=exe.RS(0) Else str=""
	exe.OverRS()
	str=Fun_StrImg(str,-1)
	If Fun_Null(Str) Then
	stra=split(str,"|"):strc=ubound(stra)
	If Instr(la,"num=")>0 Then strb=Fun_parseArr(la)("num") Else strb=cint(strc)
	If Fun_Null(strb) OR Not Fun_Num(strb) Then strb=-1 Else strb=cint(strb)-1
	If strb>strc Then strb=strc Else strb=strb
	For i=0 to strb:a=replace(lb,"[imgstr:src]",stra(i))
	b=b&a
	next
	Else
	b=""
	End If
	strHTML=replace(strHTML,"{new:imgstr"&la&"}"&lb&"{/new:imgstr}",b)
    Next
	SET exe.colMatches=Nothing
	FunImg=strHTML
End Function

Function FunTags(strHtml)
	dim iorder
	exe.RegExp "{new:tagslist([\s\S]*?)}([\s\S]*?){/new:tagslist}",strHTML
    For Each m In exe.colMatches
	b="":la=m.SubMatches(0):lb=m.SubMatches(1)
	If Instr(la,"num=")>0 Then num=ArrNum(la,"num",10) Else num=10
	If Instr(la,"order=")>0 Then iorder=casetags(Fun_parseArr(la)("order")) Else iorder="id"
	linkArray=exe.StrRS("SELECT TOP "&num&" id,name,i,ii FROM {Acc}Tags ORDER BY "&iorder,"arr")
	if not isarray(linkArray) then  vnum=-1  else vnum=ubound(linkArray,2)
	For i=0 to vnum
	a=replaceStr(lb,"[tagslist:name]",linkArray(1,i))
	a=replaceStr(a,"[tagslist:link]",GetNav(SEO_Tags,linkArray(1,i),"","","",SEO_bak,temtype))
	If Instr(a,"tagslist:id")>0 Then a=replace(a,"[tagslist:id]",linkArray(0,i))
	If Instr(a,"tagslist:i")>0 Then a=replaceStr(a,"[tagslist:i]",linkArray(2,i))
	If Instr(a,"tagslist:ii")>0 Then a=replaceStr(a,"[tagslist:ii]",linkArray(3,i))
	b=b&a
	Next
	strHTML=replace(strHTML,"{new:tagslist"&la&"}"&lb&"{/new:tagslist}",b)
	Next
	SET exe.colMatches=Nothing
	FunTags=strHTML
End Function

Function FunAD(strHTML)
	exe.RegExp "{new:ad id=([\s\S]*?)}",strHTML
    For Each m In exe.colMatches
	la=m.SubMatches(0)
	exe.StrRS "SELECT ID,ad,ad1,strtime,overtime FROM {Acc}AD WHERE display=0 AND Id="&la,"exe"
	If Not exe.RS.bof Then
	If Not Fun_null(exe.RS(4)) Then 
	If datediff("s",exe.RS(4),exe.RS(3))<0 Then str=exe.RS(1) Else str=exe.RS(0)
	Else
	str=exe.RS(1)
	End If
	Else
	Str=""
	End If
	exe.OverRS()
	strHTML = replace(strHTML,"{new:ad id="&la&"}",str)
    Next
	SET exe.colMatches=Nothing
	FunAD=strHTML
End Function

Function FunIf(strHTML)
On Error Resume Next
dim str1,str2,ifa
	exe.RegExp "\{if:([\s\S]*?)}([\s\S]*?)\{end if}",strHTML
    For Each m In exe.colMatches
	la=m.SubMatches(0):lb=m.SubMatches(1)
	Execute "If "&la&" Then ifa=true Else ifa=false"
	Execute "if "&ifa&" then a=true else a=false"
	If instr(lb,"{else}")>0 Then
	str=split(lb,"{else}")
	str1=Str(0)
	str2=Str(1)
	If a Then stra=str1 Else stra=str2
	Else
	If a Then stra=lb Else stra=""
	End If
	strHTML = replace(strHTML,"{if:"&la&"}"&lb&"{end if}",stra)
    Next
	SET exe.colMatches=Nothing
	FunIf = strHTML
End Function

Function FunFor(strHTML)
On Error Resume Next
	exe.RegExp "\{for:([\s\S]*?)\}([\s\S]*?)\{next}",strHTML
    For Each m In exe.colMatches
	la=m.SubMatches(0)
	lb=m.SubMatches(1)
	Execute "for i = 1 to "&la&":a=a&"""&lb&""":next"
	If Err.number<>0 Then a=""
	strHTML = replace(strHTML,"{for:"&la&"}"&lb&"{next}",a)
    Next
	SET exe.colMatches=Nothing
	FunFor = strHTML
End Function

Function FunAll(strHTML)
On Error Resume Next
dim iname,ilogo,iico,ititle,ikeyword,idesc,iurl,islogan,itemp,iicp,imail,iqq,itel,inotice,icopy,istat,ifoot,iaddtime,iuser,ifax,iphone,icompany,iaddress,isupport
exe.StrRS "SELECT name,logo,ico,title,keyword,idesc,url,slogan,icp,mail,qq,tel,notice,copy,stat,foot,addtime,iuser,fax,phone,company,address,support FROM {Acc}set","exe":iname=exe.rs(0):ilogo=exe.rs(1):iico=exe.rs(2):ititle=exe.rs(3):ikeyword=exe.rs(4):idesc=exe.rs(5):iurl=exe.rs(6):islogan=exe.rs(7):iicp=exe.rs(8):imail=exe.rs(9):iqq=exe.rs(10):itel=exe.rs(11):inotice=exe.rs(12):icopy=exe.rs(13):istat=exe.rs(14):ifoot=exe.rs(15):iaddtime=exe.rs(16):iuser=exe.rs(17):ifax=exe.RS(18):iphone=exe.RS(19):icompany=exe.RS(20):iaddress=exe.RS(21):isupport=exe.RS(22):exe.OverRS()
If Fun_Null(iurl) Then iurl=Fun_Dname
If Instr(iurl,"http://")=0 AND Instr(iurl,"https://")=0 Then iurl=SEO_Http&iurl
strHTML=replaceStr(strHTML,"{new:name}",iname)
strHTML=replace(strHTML,"{new:conn}",SEO_conn)
If Instr(strHTML,"{new:logo}")>0 Then strHTML=replaceStr(strHTML,"{new:logo}",ilogo)
If Instr(strHTML,"{new:ico}")>0 Then strHTML=replaceStr(strHTML,"{new:ico}",iico)
strHTML=replaceStr(strHTML,"{new:temp}",New_Temp)
strHTML=replaceStr(strHTML,"{new:root}",New_Root)
strHTML=replaceStr(strHTML,"{new:title}",ititle)
strHTML=replaceStr(strHTML,"{new:keyword}",ikeyword)
strHTML=replaceStr(strHTML,"{new:desc}",idesc)
strHTML=replaceStr(strHTML,"{new:url}",iurl)
strHTML=replaceStr(strHTML,"{new:slogan}",islogan)
strHTML=replaceStr(strHTML,"{new:icp}",iicp)
strHTML=replaceStr(strHTML,"{new:mail}",imail)
strHTML=replaceStr(strHTML,"{new:qq}",iqq)
strHTML=replaceStr(strHTML,"{new:tel}",itel)
strHTML=replaceStr(strHTML,"{new:fax}",ifax)
strHTML=replaceStr(strHTML,"{new:phone}",iphone)
strHTML=replaceStr(strHTML,"{new:company}",icompany)
strHTML=replaceStr(strHTML,"{new:address}",iaddress)
strHTML=replaceStr(strHTML,"{new:support}",isupport)
strHTML=replaceStr(strHTML,"{new:notice}",inotice)
strHTML=replaceStr(strHTML,"{new:copy}",icopy)
strHTML=replaceStr(strHTML,"{new:stat}",istat)
strHTML=replaceStr(strHTML,"{new:foot}",ifoot)
strHTML=replaceStr(strHTML,"{new:user}",iuser)
If Instr(strHTML,"{new:size}")>0 Then strHTML=replace(strHTML,"{new:size}",SEO_size)
If Instr(strHTML,"{new:navconn}")>0 Then strHTML=replace(strHTML,"{new:navconn}",SEO_Nav)
If Instr(strHTML,"{new:addtime}")>0 Then strHTML=replaceStr(strHTML,"{new:addtime}",iaddtime)
If Instr(strHTML,"{new:calendar}")>0 Then strHTML=replace(strHTML,"{new:calendar}",Fun_RL(DATE()))
If Instr(strHTML,"{new:cndate}")>0 Then strHTML=replace(strHTML,"{new:cndate}",Fun_CNDate)
If Instr(strHTML,"{new:gap}")>0 Then  strHTML=replace(strHTML,"{new:gap}",Fun_JSDate(date(),iaddtime)) 
If Instr(strhtml,"{new:client}")>0 Then strHTML=replace(strHTML,"{new:client}",Fun_StrKhd(Fun_AGENT))
If Instr(strHTML,"{new:visit}")>0 Then
dim ivisit
exe.StrRS "select Sum(i) from {Acc}read","exe"
ivisit = Round((exe.RS(0))/10000,2)
exe.OverRS()
If left(ivisit,1) = "." Then ivisit = "0" & ivisit
strHTML=replace(strHTML,"{new:visit}",ivisit)
End If
If Instr(strHtml,"{new:infonum}")>0 Then
exe.StrRS "select Count(id) from {Acc}read","exe"
strHTML=replace(strHTML,"{new:infonum}",exe.RS(0))
exe.OverRS()
End If
If Instr(strHtml,"{new:messagenum}")>0 Then
exe.StrRS "select Count(id) from {Acc}Comment WHERE display=0 AND property=0","exe"
strHTML=replace(strHTML,"{new:messagenum}",exe.RS(0))
exe.OverRS()
End If
If Instr(strHtml,"{new:commentnum}")>0 Then 
exe.StrRS "select Count(id) from {Acc}Comment WHERE display=0 AND property<>0","exe"
strHTML=replace(strHTML,"{new:commentnum}",exe.RS(0))
exe.OverRS()
End If
If Instr(strHtml,"{new:commentall}")>0 Then 
exe.StrRS "select Count(id) from {Acc}Comment WHERE display=0","exe"
strHTML=replace(strHTML,"{new:commentall}",exe.RS(0))
exe.OverRS()
End If
If Instr(strHtml,"{new:tagsnum}")>0 Then
exe.StrRS "select Count(id) from {Acc}Tags WHERE display=0","exe"
strHTML=replace(strHTML,"{new:tagsnum}",exe.RS(0))
exe.OverRS()
End If
If Instr(strHtml,"{new:navnum}")>0 Then
exe.StrRS "select Count(id) from {Acc}Nav WHERE display<2","exe"
strHTML=replace(strHTML,"{new:navnum}",exe.RS(0))
exe.OverRS()
End If
FunAll=strHTML
End Function

Function FunApi(strHTML)
On Error Resume Next
	a=""
	exe.RegExp "{%([\s\S]+?)%}",strHTML
    For Each m In exe.colMatches
	la=m.SubMatches(0)
	Execute "a="&la
	strHTML = replace(strHTML,"{%"&la&"%}",a)
    Next
	SET exe.colMatches=Nothing
	FunApi = strHTML
End Function

function FunNavTop(a)
	a=Replace(a&","&NavRoot(a),",0,","")
	str=""
	exe.StrRS "SELECT property,name,enname,listlink,id FROM [{Acc}Nav] where id in ("&a&") ORDER BY id","r1"
	i=0
	do while not exe.rs.eof
	i=i+1
	If i<>exe.rs.recordcount Then stra=SEO_Nav Else stra=""
	If exe.RS(0)>0 Then 
	str=str&"<a href="""&GetNav(exe.RS(3),exe.RS(4),"",exe.RS(2),exe.RS(1),SEO_Bak,temtype)&""">"&exe.RS(1)&"</a>"&stra
	Else
	str=str&"<a href="""&GetNav(exe.RS(3),exe.RS(4),"",exe.RS(2),exe.RS(1),SEO_Bak,temtype)&""">"&exe.RS(1)&"</a>"&stra
	End If
	exe.rs.movenext
	loop
	exe.OverRS()
	FunNavTop=str
end function


Function FunPage(typeid,page)
If Fun_Null(page) Then Page=1 Else Page=Cint(page)
dim id,user,enuser,img,info,listlink,temp,title,keyword,desc,inum,iinfo,rootid
exe.StrRS "SELECT id,name,enname,img,info,listlink,temp,title,keyword,idesc,rootid FROM {Acc}Nav WHERE type=0 AND display<2 AND id like '"&typeid&"' OR enname like '"&typeid&"'","exe"
IF exe.RS.EOf Then die Fun_404(New_404)
id=exe.RS(0)
user=exe.RS(1)
enuser=exe.RS(2)
img=exe.RS(3)
info=exe.RS(4)
listlink=exe.RS(5)
temp=exe.RS(6)
title=exe.RS(7)
keyword=exe.RS(8)
desc=exe.RS(9)
rootid=exe.RS(10)
exe.OverRS()
If Instr(info,"{new:page}")>0 Then
	info=split(info,"{new:page}")
	inum=ubound(info)
	num=inum+1
	If page<2 Then
		iinfo=info(0)
	ElseIf page>inum Then 
		iinfo=info(inum)
	Else
		iinfo=info(page-1)
	End If
	If page-3>0 then stra=page-3 else stra=1
	if num-page>6-1 then strb=page+6 else strb=num
	a="<div class='pagination'><ul>"
	if page>4 then a=a&"<li><a href='"&GetNav(listlink,id,"",user,enuser,SEO_Bak,temtype)&"'>首页</a></li> "
	For i=stra to strb
	If cint(page)=i Then a=a&"<li class='active'><a>"&i&"</a></li>" Else a=a&"<li><a href='"&GetNav(listlink,id,i,user,enuser,SEO_Bak,temtype)&"'>"&i&"</a></li>"
	Next
	if num-page>6 then a=a&"<li><a href='"&GetNav(listlink,id,num,user,enuser,SEO_Bak,temtype)&"'>尾页</a></li> "
	a=a&"</ul></div>"
	iinfo=iinfo&a
Else
	iinfo=info
End If
If title="" Then title=user
strHTML=Fun_File(Fun_FileLink&temp)
If instr(strHTML,"{new:template src=")>0 Then strHTML=Funtemp(strHTML)
strHTML=FunAll(strHTML)
strHTML=replaceStr(strHTML,"{new:navid}",id)
strHTML=replaceStr(strHTML,"{new:rootid}",rootid)
strHTML=replaceStr(strHTML,"[page:name]",user)
If Instr(strHtml,"new:pagination")>0 Then strHTML=replace(strHTML,"{new:pagination}",page)
If Instr(strHtml,"new:navname")>0 Then strHTML=replaceStr(strHTML,"{new:navname}",user)
If Instr(strHtml,"page:enname")>0 Then strHTML=replaceStr(strHTML,"[page:enname]",enuser)
If Instr(strHtml,"new:navenname")>0 Then strHTML=replaceStr(strHTML,"{new:navenname}",enuser)
If Instr(strHtml,"page:title")>0 Then strHTML=replaceStr(strHTML,"[page:title]",title)
If Instr(strHtml,"new:navtitle")>0 Then strHTML=replaceStr(strHTML,"{new:navtitle}",title)
If Instr(strHtml,"page:img")>0 Then strHTML=replaceStr(strHTML,"[page:img]",img)
strHTML=replaceStr(strHTML,"[page:keyword]",keyword)
If Instr(strHtml,"new:navkeyword")>0 Then strHTML=replaceStr(strHTML,"{new:navkeyword}",keyword)
strHTML=replaceStr(strHTML,"[page:desc]",desc)
If Instr(strHtml,"new:navdesc")>0 Then strHTML=replaceStr(strHTML,"{new:navdesc}",desc)
strHtml=replaceStr(strHTML,"[page:info]",iinfo)
If Instr(strHtml,"{new:crumbs}")>0 Then strHTML=replaceStr(strHtml,"{new:crumbs}",FunNavTop(typeid))
FunPage=Fun_StrAll(strHTML)
End Function



Function FunList(typeid,page)
If Fun_Null(page) Then Page=1 Else Page=Cint(page)
dim file,temp,iuser,ienuser,title,keyword,rootid,desc,link,id,tags
exe.StrRS "SELECT ifile,temp,name,enname,title,keyword,rootid,idesc,listlink,id FROM {Acc}Nav WHERE type=1 AND display<2 AND id like '"&typeid&"' OR enname like '"&typeid&"'","exe"
If exe.RS.Eof Then die Fun_404(New_404)
file=exe.RS(0)
If right(file,1)="," Then file=left(file,len(file)-1)
temp=exe.RS(1)
iuser=exe.RS(2)
ienuser=exe.RS(3)
title=exe.RS(4)
keyword=exe.RS(5)
rootid=exe.RS(6)
desc=exe.RS(7)
link=exe.RS(8)
id=exe.RS(9)
Exe.OverRS()
If Fun_Null(title) Then title=iuser
StrHtml=Fun_File(Fun_FileLink&temp)
If instr(strHTML,"{new:template src=")>0 Then strHTML=Funtemp(strHTML)
strHTML=FunAll(strHTML)
StrHtml=replaceStr(StrHtml,"{new:navname}",iuser)
If instr(strHTML,"new:navenname")>0 Then StrHtml=replaceStr(StrHtml,"{new:navenname}",ienuser)
StrHtml=replaceStr(StrHtml,"{new:navtitle}",title)
StrHtml=replaceStr(StrHtml,"{new:navkeyword}",keyword)
StrHtml=replaceStr(StrHtml,"{new:navdesc}",desc)
StrHtml=replaceStr(StrHtml,"{new:rootid}",rootid)
StrHtml=replaceStr(StrHtml,"{new:navid}",id)
dim Vpx,ii,itags,pagecount,recordcount,img,user,enuser,navid,listlink
	exe.RegExp "{new:list([\s\S]*?)}([\s\S]*?){/new:list}",strHTML
    For Each m In exe.colMatches
	b=""
	la=m.SubMatches(0)
	lb=m.SubMatches(1)
	If Instr(la,"num=")>0 Then num=ArrNum(la,"num",10) Else num=10
	If Instr(la,"order=")>0 Then Vpx=caseSort(Fun_parseArr(la)("order")) Else Vpx="{Acc}read.id desc"
	exe.StrRS "SELECT count({Acc}Read.id) FROM {Acc}Read,{Acc}Nav WHERE {Acc}Read.property={Acc}Nav.id AND {Acc}Read.display=0 AND {Acc}Read.property in ("&file&")","exe":recordcount=exe.RS(0):exe.OverRS()
	If recordcount>cint(num) Then pagecount=0&recordcount/num Else pagecount=1
	If Instr(pagecount,".")=0 AND len(pagecount)>1 Then pagecount=right(pagecount,len(pagecount)-1)
	If Instr(pagecount,".")>0 Then pagecount=split(pagecount,".")(0)+1
	If page>pagecount Then page=pagecount
	If Page<1 Then page=1
	if page=1 then
	linkArray=exe.StrRS("SELECT TOP "&num&" {Acc}Read.id,{Acc}Read.dateid,{Acc}Read.name,{Acc}Read.title,{Acc}Read.tags,{Acc}read.idesc,{Acc}Read.img,{Acc}Read.info,{Acc}read.iuser,{Acc}Read.link,{Acc}Read.i,{Acc}Read.addtime,(SELECT count(b.id) FROM {Acc}Comment b WHERE b.fileid={Acc}Read.id AND b.display=0),{Acc}Read.client,{Acc}Nav.infolink,{Acc}Nav.listlink,{Acc}Nav.name,{Acc}Nav.enname,{Acc}Nav.temp,{Acc}Nav.id FROM {Acc}Read,{Acc}Nav WHERE {Acc}Read.property={Acc}Nav.id AND {Acc}Read.display=0 AND {Acc}Read.property in ("&file&") ORDER BY "&Vpx&"","arr")
	else
	linkArray=exe.StrRS("SELECT TOP "&num&" {Acc}Read.id,{Acc}Read.dateid,{Acc}Read.name,{Acc}Read.title,{Acc}Read.tags,{Acc}read.idesc,{Acc}Read.img,{Acc}Read.info,{Acc}read.iuser,{Acc}Read.link,{Acc}Read.i,{Acc}Read.addtime,(SELECT count(b.id) FROM {Acc}Comment b WHERE b.fileid={Acc}Read.id AND b.display=0),{Acc}Read.client,{Acc}Nav.infolink,{Acc}Nav.listlink,{Acc}Nav.name,{Acc}Nav.enname,{Acc}Nav.temp,{Acc}Nav.id FROM {Acc}Read,{Acc}Nav WHERE {Acc}Read.property={Acc}Nav.id AND {Acc}Read.display=0 AND {Acc}Read.property in ("&file&") AND {Acc}Read.id<(SELECT Min(id) FROM (SELECT TOP "&num*(page-1)&" id FROM {Acc}Read WHERE {Acc}Read.property in ("&file&") AND display=0 ORDER BY id desc) AS T) ORDER BY "&Vpx&"","arr")
	end if
	exe.OverRS()
	if not isarray(linkArray) then  vnum=-1  else vnum=ubound(linkArray,2)
	If vnum=-1 Then
	b="<div class='nullinfo'>暂时没有任何内容！</div>"
	Else
	for ii= 0 to vnum
	enuser=linkArray(17,ii)
	user=linkArray(16,ii)
	navid=linkArray(19,ii)
	listlink=linkArray(15,ii)
	If Fun_Null(linkArray(6,ii)) Then img=New_nullimg Else img=linkArray(6,ii)
	a=StrGen(lb,"list:name","[list:name len=","]",linkArray(2,ii))
	If Instr(a,"list:strid")>0 Then a=replaceStr(a,"[list:strid]",ii)
	If Instr(a,"list:overid")>0 Then a=replaceStr(a,"[list:overid]",vnum)
	If Instr(a,"list:top")>0 Then a=replaceStr(a,"[list:top]",linkArray(20,ii))
	If Instr(a,"list:push")>0 Then a=replaceStr(a,"[list:push]",linkArray(21,ii))	
	If Instr(a,"list:id")>0 Then a=replaceStr(a,"[list:id]",linkArray(0,ii))
	If Instr(a,"list:title")>0 Then a=StrGen(a,"list:title","[list:title len=","]",linkArray(3,ii))
	If Instr(a,"list:tags")>0 Then a=replaceStr(a,"[list:tags]",linkArray(4,ii))
	If Instr(a,"list:tagslink")>0 Then
	itags=split(linkArray(4,ii),"，")
	for i=0 to ubound(itags)
	tags=tags&"<a href="""&GetNav(SEO_Tags,itags(i),"","","",SEO_bak,temtype)&""" title="""&itags(i)&" "">"&itags(i)&"</a> "
	next
	a=replace(a,"[list:tagslink]",tags)
	End If
	If Instr(a,"list:desc")>0 Then a=StrGen(a,"list:desc","[list:desc len=","]",linkArray(5,ii))
	If Instr(a,"list:img")>0 Then a=replaceStr(a,"[list:img]",img)
	If Instr(a,"list:info")>0 Then a=StrGen(a,"list:info","[list:info len=","]",Fun_Html(linkArray(7,ii),0))
	If Instr(a,"list:user")>0 Then a=StrGen(a,"list:user","[list:user len=","]",linkArray(8,ii))
	If Instr(a,"list:link")>0 Then a=replaceStr(a,"[list:link]",linkArray(9,ii))
	If Instr(a,"list:userlink")>0 Then a=replaceStr(a,"[list:userlink]",GetNav(SEO_author,linkArray(8,ii),"",enuser,user,SEO_bak,temtype))
	If Instr(a,"list:i")>0 Then a=replaceStr(a,"[list:i]",linkArray(10,ii))
	If Instr(a,"list:time")>0 Then a=Fun_TypeDate(a,"list:time","[list:time type=","]",linkArray(11,ii))
	If Instr(a,"list:commentnum")>0 Then a=replaceStr(a,"[list:commentnum]",linkArray(12,ii))
	If Instr(a,"list:client")>0 Then a=replaceStr(a,"[list:client]",Fun_Khd(linkArray(13,ii)))
	If Instr(a,"list:navname")>0 Then a=StrGen(a,"list:navname","[list:navname len=","]",linkArray(16,ii))
	If Instr(a,"list:navenname")>0 Then a=StrGen(a,"list:ennavname","[list:ennavname len=","]",linkArray(17,ii))
	If Instr(a,"list:infolink")>0 Then a=replaceStr(a,"[list:infolink]",GetNav(linkArray(14,ii),Getdateid(linkArray(0,ii),linkArray(1,ii)),"",linkArray(17,ii),linkArray(16,ii),SEO_bak,temtype))
	If Instr(a,"list:listlink")>0 Then a=replaceStr(a,"[list:listlink]",GetNav(listlink,navid,"",enuser,user,SEO_bak,temtype))
	b=b&a
	next
	End If
	strHTML=replaceStr(strHTML,"{new:list"&la&"}"&lb&"{/new:list}",b)
	strHTML=replaceStr(strHTML,"{new:recordcount}",recordcount)
	strHTML=replaceStr(strHTML,"{new:pagecount}",pagecount)
	If Instr(strHTML,"{new:pagenum}")>0 Then strHTML=replaceStr(strHTML,"{new:pagenum}",StrPage(2,3,link,typeid,enuser,user,page,pagecount))
	If Instr(strHTML,"{new:pagenum num=")>0 Then 
		Dim pagenum,numi,strup,strdo,istrpage
		pagenum=Fun_PageNum(strHTML)
		istrpage=split(pagenum,"，")
		numi=ubound(istrpage)
		If numi>0 Then
			strup=istrpage(0)
			strdo=istrpage(1)
		Else
			strup=istrpage(0)
			strdo=istrpage(0)
		End If
		strHTML=replace(strHTML,"{new:pagenum num="&pagenum&"}",StrPage(strup,strdo,link,typeid,enuser,user,page,pagecount))
	End If
    Next
	SET exe.colMatches=Nothing
	If Instr(strHtml,"new:pagination")>0 Then strHTML=replace(strHTML,"{new:pagination}",page)
	If Instr(strHtml,"new:crumbs")>0 Then strHTML=replace(strHtml,"{new:crumbs}",FunNavTop(typeid))
	FunList=Fun_StrAll(Strhtml)
End Function

Function StrPage(qa,hb,listlink,navid,NavenUser,NavUser,page,pagecount)
	dim pa,pb,pc,pd,str,pf
	pc=pagecount-page 
	if page-qa>0 then pa=page-qa else pa=1
	if pc>hb-1 then pb=page+hb else pb=pagecount
	if page>3 then str="<li><a href='"&GetNav(listlink,navid,"",NavenUser,NavUser,SEO_bak,temtype)&"'>首页</a></li> " ELSE str=""
	for pd=pa to pb 
	if pd-page=0 then 
	str=str&"<li class='active'><a>"&pd&"</a></li> " 
	else
	If pd=1 Then pf="" Else pf=pd
	str=str&"<li><a href='"&GetNav(listlink,navid,pf,NavenUser,NavUser,SEO_bak,temtype)&"'>"&pd&"</a></li> "
	End if
	next
	if cint(pc)>cint(hb) then str=str&"<li><a href='"&GetNav(listlink,navid,pagecount,NavenUser,NavUser,SEO_bak,temtype)&"'>尾页</a></li>"
	StrPage=str
End Function

Function FunRead(p,page)
If Fun_Null(Page) Then page=1 Else page=cint(page)
dim id,dateid,name,title,keyword,tags,desc,img,info,user,link,numi,addtime,edittime,num,sort,push,top,client,Navid,Navuser,Navenuser,listlink,infolink,retemp,rootid,Navtitle
dim urllink,pi
exe.StrRS "SELECT {Acc}Read.id,{Acc}Read.dateid,{Acc}Read.name,{Acc}Read.title,{Acc}Read.keyword,{Acc}Read.tags,{Acc}read.idesc,{Acc}Read.img,{Acc}Read.info,{Acc}read.iuser,{Acc}Read.link,{Acc}Read.i,{Acc}Read.addtime,{Acc}Read.edittime,(SELECT count(b.id) FROM {Acc}Comment b WHERE b.fileid={Acc}Read.id AND display=0),{Acc}Read.sort,{Acc}Read.push,{Acc}read.itop,{Acc}Read.client,{Acc}Nav.ID,{Acc}Nav.name,{Acc}Nav.enname,{Acc}Nav.listlink,{Acc}Nav.infolink,{Acc}Nav.retemp,{Acc}Nav.rootid,{Acc}Nav.title FROM {Acc}Read,{Acc}Nav WHERE ({Acc}Read.Id like '"&p&"' OR {Acc}Read.DateId like '"&p&"') AND {Acc}Read.property={Acc}Nav.id","exe"
If exe.RS.EOF Then die Fun_404(New_404)
id=exe.RS(0)
dateid=exe.RS(1)
name=exe.RS(2)
title=exe.RS(3)
keyword=exe.RS(4)
tags=exe.RS(5)
desc=exe.rs(6)
img=exe.RS(7)
info=exe.RS(8)
user=exe.RS(9)
link=exe.RS(10)
numi=exe.RS(11)
addtime=exe.RS(12)
edittime=exe.RS(13)
num=exe.RS(14)
sort=exe.RS(15)
push=exe.RS(16)
top=exe.RS(17)
client=exe.RS(18)
Navid=exe.RS(19)
Navuser=exe.RS(20)
Navenuser=exe.RS(21)
listlink=exe.RS(22)
infolink=exe.RS(23)
retemp=exe.RS(24)
rootid=exe.RS(25)
Navtitle=exe.RS(26)
exe.OverRS()
Strhtml=Fun_File(Fun_FileLink&retemp)
If instr(Strhtml,"{new:template src=")>0 Then Strhtml=Funtemp(Strhtml)
Strhtml=FunAll(Strhtml)
Strhtml=replaceStr(Strhtml,"[read:name]",name)
Strhtml=replaceStr(Strhtml,"[read:title]",title)
Strhtml=replaceStr(Strhtml,"[read:keyword]",keyword)
Strhtml=replaceStr(Strhtml,"[read:desc]",desc)
If Instr(StrHtml,"read:top")>0 Then Strhtml=replaceStr(Strhtml,"[read:top]",top)
If Instr(StrHtml,"read:push")>0 Then Strhtml=replaceStr(Strhtml,"[read:push]",push)	
If Instr(strHtml,"new:pagecount")>0 Then strHTML=replace(strHTML,"{new:pagecount}",page)
exe.StrRS "SELECT TOP 1 {Acc}Read.Id,{Acc}Read.dateId,{Acc}Read.name,{Acc}Nav.infolink,{Acc}Nav.name,{Acc}Nav.enname FROM {Acc}read,{Acc}Nav WHERE {Acc}Read.Id>"&id&" AND {Acc}Read.property={Acc}Nav.Id AND {Acc}Read.display=0 ORDER BY {Acc}Read.Id asc","exe"
If Exe.RS.EOF Then
If Instr(StrHtml,"read:next")>0 Then StrHtml=replaceStr(StrHtml,"[read:next]","没有了！")
If Instr(StrHtml,"read:nextname")>0 Then StrHtml=replaceStr(StrHtml,"[read:nextname]","")
If Instr(StrHtml,"read:nextlink")>0 Then StrHtml=replaceStr(StrHtml,"[read:nextlink]","")
Else
dim nextlink:nextlink=GetNav(exe.RS(3),Getdateid(exe.RS(0),exe.RS(1)),"",exe.RS(4),exe.RS(5),SEO_bak,temtype)
If Instr(StrHtml,"read:next")>0 Then StrHtml=replace(StrHtml,"[read:next]","<a class=""next"" href="""&nextlink&""">"&exe.RS(2)&"</a>")
If Instr(StrHtml,"read:nextname")>0 Then StrHtml=replaceStr(StrHtml,"[read:nextname]",exe.RS(2))
If Instr(StrHtml,"read:nextlink")>0 Then StrHtml=replaceStr(StrHtml,"[read:nextlink]",nextlink)
End If
exe.OverRS()
exe.StrRS "SELECT TOP 1 {Acc}Read.Id,{Acc}Read.dateId,{Acc}Read.name,{Acc}Nav.infolink,{Acc}Nav.name,{Acc}Nav.enname FROM {Acc}read,{Acc}Nav WHERE {Acc}Read.Id<"&id&" AND {Acc}Read.property={Acc}Nav.Id AND {Acc}Read.display=0 ORDER BY {Acc}Read.Id desc","exe"
If Exe.RS.EOF Then
If Instr(StrHtml,"read:prev")>0 Then StrHtml=replaceStr(StrHtml,"[read:prev]","没有了！")
If Instr(StrHtml,"read:prevname")>0 Then StrHtml=replaceStr(StrHtml,"[read:prevname]","")
If Instr(StrHtml,"read:prevlink")>0 Then StrHtml=replaceStr(StrHtml,"[read:prevlink]","")
Else
dim prevlink:prevlink=GetNav(exe.RS(3),Getdateid(exe.RS(0),exe.RS(1)),"",exe.RS(4),exe.RS(5),SEO_bak,temtype)
If Instr(StrHtml,"read:prev")>0 Then StrHtml=replaceStr(StrHtml,"[read:prev]","<a class=""prev"" href="""&prevlink&""">"&exe.RS(2)&"</a>")
If Instr(StrHtml,"read:prevname")>0 Then StrHtml=replaceStr(StrHtml,"[read:prevname]",exe.RS(2))
If Instr(StrHtml,"read:prevlink")>0 Then StrHtml=replaceStr(StrHtml,"[read:prevlink]",prevlink)
End If
exe.OverRS()

If Instr(info,"{new:page}")>0 Then
dim inum,iinum,iinfo
	info=split(info,"{new:page}")
	inum=ubound(info)
	iinum=inum+1
	
	If page<2 Then
		iinfo=info(0)
	ElseIf page>inum Then 
		iinfo=info(inum)
	Else
		iinfo=info(page-1)
	End If
	If page-3>0 then stra=page-3 else stra=1
	if iinum-page>6-1 then strb=page+6 else strb=iinum
	a="<div class='pagination'><ul class='post-data hidden-phone'><li><a>共 "&iinum&" 页</a></li></ul><ul>"
	if page>4 then a=a&"<li><a href='"&GetNav(infolink,Getdateid(id,dateid),"",Navuser,Navenuser,SEO_Bak,temtype)&"'>首页</a></li> "
	For i=stra to strb
	If page=i Then 
	a=a&"<li class='active'><a>"&i&"</a></li>" 
	Else 
	If i=1 Then pi="" Else pi=i
	a=a&"<li><a href='"&GetNav(infolink,Getdateid(id,dateid),pi,Navuser,Navenuser,SEO_Bak,temtype)&"'>"&i&"</a></li>"
	End If
	Next
	if iinum-page>6 then a=a&"<li><a href='"&GetNav(infolink,Getdateid(id,dateid),iinum,Navuser,Navenuser,SEO_Bak,temtype)&"'>尾页</a></li> "
	a=a&"</ul></div>"
	iinfo=iinfo&a
Else
	iinfo=info
End If
If Instr(strHtml,"new:pagination")>0 Then strHTML=replace(strHTML,"{new:pagination}",page)
If Instr(strHtml,"{new:crumbs}")>0 Then strHTML=replace(strHtml,"{new:crumbs}",FunNavTop(Navid))
If Instr(Strhtml,"read:id")>0 Then Strhtml=replace(Strhtml,"[read:id]",id)
If Instr(Strhtml,"read:dateid")>0 Then Strhtml=replaceStr(Strhtml,"[read:dateid]",dateid)
If Instr(a,"read:tags")>0 Then Strhtml=replaceStr(Strhtml,"[read:tags]",tags)
	If Instr(Strhtml,"read:tagslink")>0 Then
	Dim itags,iitags
	itags=split(tags,"，")
	for i=0 to ubound(itags)
	iitags=iitags&"<a href="""&GetNav(SEO_Tags,itags(i),"","","",SEO_bak,temtype)&""" title="""&itags(i)&" "">"&itags(i)&"</a> "
	next
	Strhtml=replaceStr(Strhtml,"[read:tagslink]",iitags)
	End If
If Instr(Strhtml,"read:img")>0 Then Strhtml=replaceStr(Strhtml,"[read:img]",img)
Strhtml=replaceStr(Strhtml,"[read:info]",iinfo)
If Instr(Strhtml,"read:user")>0 Then Strhtml=replaceStr(Strhtml,"[read:user]",user)
If Instr(Strhtml,"read:link")>0 Then Strhtml=replaceStr(Strhtml,"[read:link]",link)
If Instr(Strhtml,"read:userlink")>0 Then Strhtml=replaceStr(Strhtml,"[read:userlink]",GetNav(SEO_author,user,"",NavUser,NavenUser,SEO_bak,temtype))
Strhtml=replaceStr(Strhtml,"[read:i]",numi)
If Instr(Strhtml,"read:time")>0 Then Strhtml=Fun_TypeDate(Strhtml,"read:time","[read:time type=","]",addtime)
If Instr(Strhtml,"read:edittime")>0 Then ThenStrhtml=Fun_TypeDate(Strhtml,"read:edittime","[read:edittime type=","]",edittime)
If Instr(Strhtml,"read:commentnum")>0 Then Strhtml=replaceStr(Strhtml,"[read:commentnum]",num)
If Instr(Strhtml,"read:push")>0 Then Strhtml=replaceStr(Strhtml,"[read:push]",push)
If Instr(Strhtml,"read:top")>0 Then Strhtml=replaceStr(Strhtml,"[read:top]",top)
If Instr(Strhtml,"read:client")>0 Then Strhtml=replaceStr(Strhtml,"[read:client]",Fun_StrKhd(client))
If Instr(Strhtml,"read:listlink")>0 Then Strhtml=replaceStr(Strhtml,"[read:listlink]",GetNav(listlink,Navid,"",NavUser,NavenUser,SEO_bak,temtype))
If Instr(Strhtml,"read:infolink")>0 Then Strhtml=replaceStr(Strhtml,"[read:infolink]",GetNav(infolink,Getdateid(id,dateid),"",NavUser,NavenUser,SEO_bak,temtype))
Strhtml=replaceStr(Strhtml,"{new:rootid}",rootid)
Strhtml=replaceStr(Strhtml,"{new:navid}",Navid)
If Instr(Strhtml,"new:navname")>0 Then Strhtml=replaceStr(Strhtml,"{new:navname}",Navuser)
If Instr(Strhtml,"new:navenname")>0 Then Strhtml=replaceStr(Strhtml,"{new:navenname}",Navenuser)
If Instr(Strhtml,"new:navtitle")>0 Then Strhtml=replaceStr(Strhtml,"{new:navtitle}",Navtitle)
FunRead=Fun_StrAll(Strhtml)
End Function

Function FunListAll(sid,page,retemp)
If Fun_Null(page) Or Not Fun_Num(page) Then page=1 Else page=cint(page)
dim bakv,pageapi,strdate
Strhtml=Fun_File(Fun_FileLink&retemp)
If instr(Strhtml,"{new:template src=")>0 Then Strhtml=Funtemp(Strhtml)
If Instr(Strhtml,"{/new:search}")>0 Then
bakv="search"
Strhtml=replace(Strhtml,"{new:navid}",-2)
Strhtml=replace(Strhtml,"{new:rootid}",-2)
If Not Fun_Null(sid) Then  ssid="AND ({Acc}Read.name like '%"&sid&"%' OR {Acc}Read.title like '%"&sid&"%' OR {Acc}Read.info like '%"&sid&"%')" Else ssid=""
stra="搜索"
pageapi=SEO_search
ElseIf Instr(Strhtml,"{/new:tags}")>0 Then
bakv="tags"
Strhtml=replace(Strhtml,"{new:navid}",-3)
Strhtml=replace(Strhtml,"{new:rootid}",-3)
If Not Fun_Null(sid) Then  ssid="AND ({Acc}Read.tags like '%"&sid&"%')" Else ssid=""
stra="标签"
pageapi=SEO_tags
ElseIf Instr(Strhtml,"{/new:date}")>0 Then
bakv="date"
Strhtml=replace(Strhtml,"{new:navid}",-4)
Strhtml=replace(Strhtml,"{new:rootid}",-4)
stra="日期"
pageapi=SEO_date
If len(sid)=8 Then 
strdate=left(sid,4)&"年"&Right(replaceStr(sid,right(sid,2),""),2)&"月"&right(sid,2)&"日"
ssid="AND Year({Acc}Read.addtime)="&left(sid,4)&" AND Month({Acc}Read.addtime)="&Right(replaceStr(sid,right(sid,2),""),2)&" AND day({Acc}Read.addtime)="&right(sid,2)&""
ElseIf len(sid)=6 Then
strdate=left(sid,4)&"年"&right(sid,2)&"月"
ssid="AND (Year({Acc}Read.addtime)="&left(sid,4)&" AND Month({Acc}Read.addtime)="&right(sid,2)&")"
ElseIf Len(sid)=4 Then
strdate=sid&"年"
ssid="AND (Year({Acc}Read.addtime)="&sid&")"
Else
stra="日期格式错误"
ssid=""
sid=""
strdate=""
End If
ElseIf Instr(Strhtml,"{/new:author}")>0 Then
bakv="author"
Strhtml=replaceStr(Strhtml,"{new:navid}","author")
Strhtml=replaceStr(Strhtml,"{new:rootid}","author")
If Not Fun_Null(sid) Then  ssid="AND ({Acc}read.iuser='"&sid&"')" Else ssid=""
stra="作者"
pageapi=SEO_author
End If
If Not Fun_Null(strdate) Then strdate=strdate Else strdate=sid
Strhtml=replace(Strhtml,"{new:navname}",strdate)
If Instr(Strhtml,"new:ennavname")>0 Then Strhtml=replace(Strhtml,"{new:ennavname}",-1)
Strhtml=replace(Strhtml,"{new:navtitle}",strdate)
Strhtml=replace(Strhtml,"{new:navkeyword}",strdate)
Strhtml=replace(Strhtml,"{new:navdesc}",strdate)
Strhtml=FunAll(Strhtml)
dim Vpx,ii,iclass,ssid,iiclass,recordcount,pagecount,itags,img,navid,tags
	exe.RegExp "{new:"&bakv&"([\s\S]*?)}([\s\S]*?){/new:"&bakv&"}",strHTML
    For Each m In exe.colMatches
	b=""
	la=m.SubMatches(0)
	lb=m.SubMatches(1)
	If Instr(la,"num=")>0 Then num=ArrNum(la,"num",10) Else num=10
	If Instr(la,"order=")>0 Then Vpx=caseSort(Fun_parseArr(la)("order")) Else Vpx="{Acc}read.id desc"
	exe.StrRS "SELECT count({Acc}Read.id) FROM {Acc}Read,{Acc}Nav WHERE {Acc}Read.property={Acc}Nav.id AND {Acc}Read.display=0 "&ssid,"exe":recordcount=exe.RS(0):exe.OverRS()
	If recordcount>cint(num) Then pagecount=0&recordcount/num Else pagecount=1
	If Instr(pagecount,".")=0 AND len(pagecount)>1 Then pagecount=right(pagecount,len(pagecount)-1)
	If Instr(pagecount,".")>0 Then pagecount=split(pagecount,".")(0)+1
	If page>pagecount Then page=pagecount
	If Page<1 Then page=1
	if page=1 then
	linkArray=exe.StrRS("SELECT TOP "&num&" {Acc}Read.id,{Acc}Read.dateid,{Acc}Read.name,{Acc}Read.title,{Acc}Read.tags,{Acc}read.idesc,{Acc}Read.img,{Acc}Read.info,{Acc}read.iuser,{Acc}Read.link,{Acc}Read.i,{Acc}Read.addtime,(SELECT count(b.id) FROM {Acc}Comment b WHERE b.fileid={Acc}Read.id AND b.display=0),{Acc}Read.client,{Acc}Nav.infolink,{Acc}Nav.listlink,{Acc}Nav.name,{Acc}Nav.enname,{Acc}Nav.temp,{Acc}Nav.id FROM {Acc}Read,{Acc}Nav WHERE {Acc}Read.property={Acc}Nav.id "&ssid&" AND {Acc}Read.display=0 ORDER BY "&Vpx&"","arr")
	else
	linkArray=exe.StrRS("SELECT TOP "&num&" {Acc}Read.id,{Acc}Read.dateid,{Acc}Read.name,{Acc}Read.title,{Acc}Read.tags,{Acc}read.idesc,{Acc}Read.img,{Acc}Read.info,{Acc}read.iuser,{Acc}Read.link,{Acc}Read.i,{Acc}Read.addtime,(SELECT count(b.id) FROM {Acc}Comment b WHERE b.fileid={Acc}Read.id AND b.display=0),{Acc}Read.client,{Acc}Nav.infolink,{Acc}Nav.listlink,{Acc}Nav.name,{Acc}Nav.enname,{Acc}Nav.temp,{Acc}Nav.id FROM {Acc}Read,{Acc}Nav WHERE {Acc}Read.property={Acc}Nav.id "&ssid&"  AND {Acc}Read.display=0 AND {Acc}Read.id<(SELECT Min(id) FROM (SELECT TOP "&num*(page-1)&" id FROM {Acc}Read WHERE display=0 "&ssid&" ORDER BY id desc) AS T) ORDER BY "&Vpx&"","arr")
	end if
	exe.OverRS()
	if not isarray(linkArray) then  vnum=-1  else vnum=ubound(linkArray,2)
	If vnum=-1 Then
	b="<div class='nullinfo'>"&stra&"<span>「"&sid&"」</span>没有任何内容</div>"
	Else
	for ii= 0 to vnum
	If Fun_Null(linkArray(6,ii)) Then img=New_nullimg Else img=linkArray(6,ii)
	a=Fun_StrCn(lb,bakv&":name","["&bakv&":name len=","]",linkArray(2,ii)&"{%+%}"&sid&"{%+%}"&bakv)
	If Instr(a,bakv&":strid")>0 Then a=replace(a,"["&bakv&":strid]",ii)
	If Instr(a,bakv&":overid")>0 Then a=replace(a,"["&bakv&":overid]",vnum)
	If Instr(a,bakv&":id")>0 Then a=replace(a,"["&bakv&":id]",id)
	If Instr(a,bakv&":title")>0 Then a=Fun_StrCn(a,bakv&":title","["&bakv&":title len=","]",linkArray(3,ii)&"{%+%}"&sid&"{%+%}"&bakv)
	If Instr(a,bakv&":desc")>0 Then a=Fun_StrCn(a,bakv&":desc","["&bakv&":desc len=","]",linkArray(5,ii)&"{%+%}"&sid&"{%+%}"&bakv)
	If Instr(a,bakv&":info")>0 Then a=Fun_StrCn(a,bakv&":info","["&bakv&":info len=","]",linkArray(7,ii)&"{%+%}"&sid&"{%+%}"&bakv)
	If Instr(a,bakv&":tags")>0 Then a=replaceStr(a,"["&bakv&":tags]",linkArray(4,ii))
	If Instr(a,bakv&":tagslink")>0 Then
	itags=split(linkArray(4,ii),"，")
	for i=0 to ubound(itags)
	tags=tags&"<a href="""&GetNav(SEO_Tags,itags(i),"","","",SEO_bak,temtype)&""" title="""&itags(i)&" "">"&itags(i)&"</a> "
	next
	a=replace(a,"["&bakv&":tagslink]",tags)
	End If
	If Instr(a,bakv&":img")>0 Then a=replaceStr(a,"["&bakv&":img]",img)
	If Instr(a,bakv&":user")>0 Then a=ReplaceStr(a,"["&bakv&":user]",linkArray(8,ii))
	If Instr(a,bakv&":link")>0 Then a=replaceStr(a,"["&bakv&":link]",linkArray(9,ii))
	If Instr(a,bakv&":userlink")>0 Then a=replaceStr(a,"["&bakv&":userlink]",GetNav(SEO_author,linkArray(8,ii),"",linkArray(17,ii),linkArray(16,ii),SEO_bak,temtype))
	If Instr(a,bakv&":i")>0 Then a=replaceStr(a,"["&bakv&":i]",linkArray(10,ii))
	If Instr(a,bakv&":time")>0 Then a=Fun_TypeDate(a,bakv&":time","["&bakv&":time type=","]",linkArray(11,ii))
	If Instr(a,bakv&":commentnum")>0 Then a=replaceStr(a,"["&bakv&":commentnum]",linkArray(12,ii))
	If Instr(a,bakv&":client")>0 Then a=replaceStr(a,"["&bakv&":client]",Fun_StrKhd(linkArray(13,ii)))
	If Instr(a,bakv&":navname")>0 Then a=StrGen(a,bakv&":navname","["&bakv&":navname len=","]",linkArray(16,ii))
	If Instr(a,bakv&":ennavname")>0 Then a=StrGen(a,bakv&":ennavname","["&bakv&":ennavname len=","]",linkArray(17,ii))
	If Instr(a,bakv&":infolink")>0 Then a=replaceStr(a,"["&bakv&":infolink]",GetNav(linkArray(14,ii),Getdateid(linkArray(0,ii),linkArray(1,ii)),"",linkArray(17,ii),linkArray(16,ii),SEO_bak,temtype))
	If Instr(a,bakv&":listlink")>0 Then a=replaceStr(a,"["&bakv&":listlink]",GetNav(linkArray(15,ii),navid,"",linkArray(17,ii),linkArray(16,ii),SEO_bak,temtype))
	b=b&a
	next
	End If
	If Fun_Null(sid) Then 
	b="<div class=""nullkey"">没有相关内容</div>"
	strHTML=replace(strHTML,"{new:recordcount}","")
	strHTML=replace(strHTML,"{new:pagecount}","")
	strHTML=replace(strHTML,"{new:pagenum}","")
	If Instr(strHTML,"{new:pagenum num=")>0 Then 
		Dim pagenum
		pagenum=Fun_PageNum(strHTML)
		strHTML=replaceStr(strHTML,"{new:pagenum num="&pagenum&"}","")
	End If
	Else
	strHTML=replace(strHTML,"{new:recordcount}",recordcount)
	strHTML=replace(strHTML,"{new:pagecount}",pagecount)
	If Instr(strHTML,"{new:pagenum}")>0 Then strHTML=replace(strHTML,"{new:pagenum}",StrPage(2,3,pageapi,sid,"","",page,pagecount))
	If Instr(strHTML,"{new:pagenum num=")>0 Then 
		Dim numi,strup,strdo,istrpage
		pagenum=Fun_PageNum(strHTML)
		istrpage=split(pagenum,",")
		numi=ubound(istrpage)
		If numi>0 Then
			strup=istrpage(0)
			strdo=istrpage(1)
		Else
			strup=istrpage(0)
			strdo=istrpage(0)
		End If
		strHTML=replace(strHTML,"{new:pagenum num="&pagenum&"}",StrPage(strup,strdo,pageapi,sid,"","",page,pagecount))
	End If
	End If
	strHTML=replace(strHTML,"{new:"&bakv&""&la&"}"&lb&"{/new:"&bakv&"}",b)
    Next
	SET exe.colMatches=Nothing
	If Instr(strHtml,"new:pagination")>0 Then strHTML=replace(strHTML,"{new:pagination}",page)
	If Instr(strHtml,"{new:crumbs}")>0 Then strHTML=replace(strHtml,"{new:crumbs}",stra)
	FunListAll=Fun_StrAll(Strhtml)
End Function
%>