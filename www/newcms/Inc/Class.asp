<!--#include file="../../Inc/New_Data.asp" -->
<!--#include file="../../Inc/New_Temp.asp" -->
<!--#include file="../../Inc/New_Function.asp" -->
<!--#include file="Config.asp" -->
<%
If New_On=2 Then die Fun_404("<META http-equiv=""refresh"" content=""0;URL="&New_Root&"/install/"">")
Login()
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
Response.AddHeader "Pragma", "No-Cache" 
Dim nickname,touxiang
exe.StrRS "SELECT nickname,img FROM {Acc}user WHERE name='"&Fun_Cookie("%user%161008#")&"'","exe"
If Not exe.RS.Eof Then
nickname=exe.RS(0)
touxiang=exe.RS(1)
End If
exe.OverRS()
If Fun_Null(touxiang) Then touxiang=New_Root&"/File/img/user.png"

dim Read_Num,MRead_Num,NavRead_Num,Nav_Num,message_Num,Comment_Num,Smessage_Num,SComment_Num,Link_Num,MLink_Num,author_Num,user_Num,AD_Num,ADq_Num,Tags_Num,MTags_Num
Function HomeStr()
exe.StrRS "SELECT count(id) FROM {Acc}read","exe":Read_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}Read WHERE Year(addtime)="&YEAR(DATE())&" AND month(addtime)="&Month(DATE())&"","exe":MRead_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}Nav WHERE type=1","exe":NavRead_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}Nav","exe":Nav_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}Comment WHERE property=0","exe":message_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}Comment WHERE property<>0","exe":Comment_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}Comment WHERE property=0 AND display=2","exe":Smessage_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}Comment WHERE property<>0 AND display=2","exe":SComment_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}Link","exe":Link_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}Link WHERE Year(addtime)="&YEAR(DATE())&" AND month(addtime)="&Month(DATE())&"","exe":MLink_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}User","exe":user_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}User WHERE power=1","exe":author_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}AD","exe":AD_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}AD WHERE strtime>overtime","exe":ADq_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}Tags","exe":Tags_Num=exe.RS(0):exe.OverRS()
exe.StrRS "SELECT count(id) FROM {Acc}Tags WHERE Year(addtime)="&YEAR(DATE())&" AND month(addtime)="&Month(DATE())&"","exe":MTags_Num=exe.RS(0):exe.OverRS()
End Function

Sub EditKeys()
If Fun_GetId("keys","get") Then
If len(Fun_GetId("Inc_keys","post"))<>24 OR left(Fun_GetId("Inc_keys","post"),6)<>"NEWCMS" Then InfoStr Inc_200,Inc_title,"激活密匙错误！","back"
a=Fun_File(New_Root&"/inc/New_Config.asp")
a=reInfo(a,"Inc_keys=","'",Fun_GetId("Inc_keys","post"))
Fun_FeText New_Root&"/inc/New_Config.asp",a
InfoStr Inc_200,Inc_title,"激活密匙修改成功！",Inc_Index
End If
End Sub

Function FunOK(a)
on error resume next
dim fso,jpeg,JMail
If a="fso" Then 
set fso=Server.CreateObject ("Scripting.FileSystemObject"):If Err Then Funok = "×" else Funok = "√":set fso=nothing
End if
If a="jpeg" Then
set Jpeg=server.createobject("persits.jpeg"):if err.number<>0 then Funok = "×" else Funok = "√":Set Jpeg=Nothing
End If
If a="jmail" Then
Set JMail=Server.CreateObject("JMail.Message"):If JMail Is Nothing  Then Funok = "×" else Funok = "√":Set JMail=Nothing
End If
End Function

Function FunType(a)
If a=0 Then 
FunType="单篇"
ElseIf a=1 Then
FunType="内容"
ElseIf a=2 Then
FunType="链接"
Else
FunType="未知"
End If
End Function


function Inc_NavSEl(a,b,c,d,e,f)
Dim RS,imglist,Category_Img,i,p,ii
If d=0 then p="" Else d=1
imglist=",2.,3.,4.,5.,6.,7.,8.,9.,10.,11."
Category_Img=split(imglist,",") '设置分类前图标
	if a=0 then
	echo "<label class=""Nav"" for=""Nav"" style=""width: 100%;"">"&vbCrLf
	echo "<select name=""Nav"" style=""width: 100%;"">"&vbCrLf
	If c-c = 0 Then echo "<option value=""0|0|0"">"&e&"</option>"&vbCrLf
	end if
	SET RS=server.CreateObject(New_RS_NAME)
	If f=1 Then ii="AND type=1"
	set RS = exe.Conn.execute("SELECT id,name,property,type,fileid FROM "&New_NewAcc&"Nav where property="&a&" "&ii&" "&p&" order by sort desc")
	do while not rs.eof
			    echo "<option value="""&rs(0)&"|"&rs(3)&"|"&rs(4)&""" "
			    If cint(c)=cint(RS(0)) OR f=1 AND cint(c)=cint(RS(0)) then echo "selected=""selected"""
			    echo ">"
		 	    for i=0 to b-1:echo("&nbsp;&nbsp;&nbsp;&nbsp;"):next
			    if b<=ubound(Category_Img) then echo(""&Category_Img(b)&"") else echo("||") end if
			 echo(rs(1))
			 echo "</option>"  & vbCrLf
			 call Inc_NavSEl(rs(0),b+1,c,d,e,f)
	rs.movenext:loop:rs.close:set rs=nothing
	if a=0 then echo("</select>")&vbCrLf
	if a=0 then echo("</label>")
end function

Function Inc_StrTime(i)
Inc_StrTime = right(Year(i),2) & right("00"&Month(i),2) & right("00"&Day(i),2) & right("00"&Hour(i),2) & right("00"&Minute(i),2) & right("00"&Second(i),2)
End Function

Function Inc_NavList(a,b)
Dim RS,i,e,f,imglist,Category_Img,display
imglist=",2.,3.,4.,5.,6.,7.,8.,9.,10.,11.,12."
Category_Img=split(imglist,",") '设置分类前图标
SET RS=server.CreateObject(New_RS_NAME)
set RS = exe.Conn.execute("SELECT id,name,property,type,display,sort,addtime,listlink,enname,url,address FROM "&New_NewAcc&"Nav where property="&a&" order by sort desc,id desc"):do while not rs.eof
If RS(4)=0 Then
display = "<span style=""color:#46B11F;""><a href=""?type=none&id="&rs(0)&"""><font color='#69aa46'>显示</font></a></span>" 
elseIf RS(4)=1 Then
display = "<span style='color: #FF0000;'><a href=""?type=block&id="&rs(0)&"""><font color='#FF0000'>隐藏</font></a></span>"
Else
display = "<span style='color: #FF0000;'><a href=""?type=block&id="&rs(0)&"""><font color='#FF0000'>禁用</font></a></span>"
end If
echo "<tr>"&vbCrLf	
echo "<td class=""center""><input type=""checkbox"" name=""id"" value="""&rs(0)&""" class=""ace"" /><span class=""lbl""></span></td>"
echo "<td>"&rs(0)&"</td>"
for i=0 to b-1:e=e&"&nbsp;&nbsp;&nbsp;&nbsp;":next:if b<=ubound(Category_Img) then f=""&Category_Img(b)&"" else f="∟" end if						
echo "<td><a href="""&Inc_Column&RS(0)&""">"&e&f&RS(1)&"</a></td>"&vbCrLf	
echo "<td class=""hidden-480"">"&RS(5)&"</td>"&vbCrLf	
echo "<td>"&FunType(RS(3))&"</td>"
echo "<td>"&RS(10)&"</td>"
echo "<td class=""hidden-480"">"&display&"</td>"&vbCrLf	
echo "<td class=""hidden-480"">"&RS(6)&"</td>"&vbCrLf
echo "<td>"&vbCrLf                                       
echo "<div class=""action-buttons"">"&vbCrLf
echo "<a class=""blue"" href="""&GetNav(RS(7),RS(0),"",RS(8),RS(1),SEO_Bak,"")&""" target=""_blank"" title=""查看""><i class=""icon-zoom-in bigger-130""></i></a>"&vbCrLf
echo "<a class=""green"" href="""&Inc_Column&RS(0)&""" title=""编辑""><i class=""icon-pencil bigger-130""></i></a>"&vbCrLf
echo "<a class=""red"" href=""?del="&RS(0)&""" onclick=""return confirm('请注意，删除后不可恢复！\n\n您真的确定要删除此条数据吗?\n\n删除后栏目下内容、子导航将会同时会被清空，建议禁用栏目，不建议删除！')"" class=""tooltip-error"" data-rel=""tooltip"" title=""删除""><i class=""icon-trash bigger-130""></i></a>"&vbCrLf
echo "</div>"&vbCrLf
echo "</td>"&vbCrLf
echo "</tr>"&vbCrLf
call Inc_NavList(rs(0),b+1)
e=""
rs.movenext:loop:rs.close:set rs=nothing
End Function

'//更新所有栏目递归ID
Function NavTopId(a)
	Dim RS
	SET RS=server.CreateObject(New_RS_NAME)
	a=Replace(a,",0,","")
	RS.open("SELECT property,id,ifile FROM "&New_NewAcc&"Nav WHERE id IN ("&a&")"),exe.Conn,3,3
	do while not rs.eof
	Str=NavDownId(RS(1))
	If Right(Str,1)="," Then Str=left(Str,len(Str)-1)
	RS(2)=Str
	RS.update
	rs.movenext
	loop
	RS.Close
	set RS=Nothing
End Function
'//更新获取顶级id
Function NavRootid(a)
exe.StrRS "SELECT property,id FROM {Acc}Nav where id="&a,"exe"
If exe.RS(0)=0 Then num=exe.RS(1):Exit Function
NavRootid exe.RS(0)
NavRootid=num
End Function
Function StrNavRoot(a)
i=a
Str=NavRootid(a)
If Str="" Then Str=0
exe.StrRS "UPDATE {Acc}Nav SET rootid="&str&" WHERE id="&i,"exe"
End Function

'//获得栏目上一级ID
function NavTop(a)
	Dim rs
	SET RS=server.CreateObject(New_RS_NAME)
	set RS = exe.Conn.execute("SELECT property FROM "&New_NewAcc&"Nav where id="&a&"")
	If RS.EOF OR RS(0)=0 Then NavTop=-1 Else NavTop=RS(0)
	rs.close:set rs=nothing
end function
'//获得栏目下级所有ID
function NavDownId(a)
	Dim rs3,b,c
	SET RS3=server.CreateObject(New_RS_NAME)
	set RS3=exe.Conn.execute("SELECT id FROM "&New_NewAcc&"Nav where property="&a&" order by id asc")
	do while not rs3.eof
	c=c&NavDownId(RS3(0))
	rs3.movenext:loop
	rs3.close:set rs3=nothing
	NavDownId=a&","&c
end function

'//添加标签
Function Addtags(a)
exe.StrRS "SELECT TOP 1 * FROM {Acc}Tags WHERE name='"&a&"'","r3"
If Not exe.RS.eof Then
exe.RS("ii")=exe.RS("ii")+1
Else
exe.rs.addnew
exe.rs("addtime") = Now()
exe.rs("name") = a
exe.rs("ii")=1
If Fun_Num(Fun_GetId("stri","post")) AND Not Fun_Null(Fun_GetId("stri","post")) Then exe.rs("i")=Fun_GetId("stri","post") Else exe.rs("i")=0
End If
exe.rs.update
exe.OverRS()
end function

'//添加标签判断循环
Function StrTags(a)
Dim tagsadd,i
a=Replace(Replace(trim(a),",","，")," ","，")
If Fun_Null(a) Then exit Function
If instr(a,"，")>0 then
tagsadd=split(a,"，")
for i = 0 to ubound(tagsadd)
AddTags tagsadd(i)
next
Else
AddTags a
End If
End function

' AddData({Acc}link,user|user)
Function AddData(a,c)
	dim d,e,i,f
	exe.StrRS "SELECT TOP 1 * FROM "&a&"","r3"
	exe.rs.addnew
	If instr(c,",")=0 Then exit Function
	d=split(c,",")
	for i=0 to ubound(d)
	If Instr(d(i),"|")>0 Then
	f=split(d(i),"|")
	exe.rs(f(0))=f(1)
	Else
	exe.rs(d(i))=Fun_GetId(d(i),"post")
	End If
	next
	exe.rs.update
	exe.OverRS()
End Function

Function EditData(a,b,c)
	dim d,e,i,f
	exe.StrRS "SELECT * FROM "&a&" WHERE ID="&b&"","r3"
	If instr(c,",")=0 Then exit Function
	d=split(c,",")
	for i=0 to ubound(d)
	If Instr(d(i),"|")>0 Then
	f=split(d(i),"|")
	exe.rs(f(0))=f(1)
	Else
	exe.rs(d(i))=Fun_GetId(d(i),"post")
	End If
	next
	exe.rs.update
	exe.OverRS()
End Function

Function DelData(a,b)
exe.StrRS "DELETE FROM "&a&" WHERE id IN ("&b&")","exe"
End Function

Function ReadInfo(a)
Dim Str,i,Stra
Str=split(a,",")
for i=0 to ubound(Str)
If Instr(Str(i),"|")>0 Then
Stra=split(Str(i),"|")
Execute Stra(0)&"="""&Stra(1)&""""
Else
Execute Str(i)&"="""&Fun_GETID(Str(i),"get")&""""
End If
Next
End Function

Function ReadData(a,b,c)
dim d,i,f
If b="" Then b="" Else b="where id="&b
exe.StrRS "select * from "&a&" "&b&"","exe"
If exe.RS.EOF Then InfoStr Inc_200,Inc_title,"参数错误！",Inc_Login
d=split(c,",")
	for i=0 to ubound(d)
	If Instr(d(i),"|")>0 Then
	f=split(d(i),"|")
	Execute f(0)&"=exe.rs("""&f(1)&""")"
	Else
	Execute d(i)&"=exe.rs("""&d(i)&""")"
	End If
	next
	exe.OverRS()
End Function

'获取模板文件、模板目录
Function Fun_FileList(a,b,c)
'On Error Resume Next
  Dim fso, f, f1, fc, s,i,p
  Set fso = CreateObject("Scripting.FileSystemObject")
  If c=0 Then p=New_Temp&New_Tempf Else p=""
  Set f = fso.GetFolder(Server.MapPath(New_Root&New_Tempfile&p&"/"))
  If Err Then Exit Function
  If c=0 Then 
  Set fc = f.Files 
  ElseIf c=1 Then 
  Set fc = f.Subfolders
  End If
  echo "<label class="""&a&""" for="""&a&""" style=""width: 100%;"">"
  echo "<select id="""&a&""" name="""&a&""" style=""width: 100%;"">"
  If c=0 Then
  echo "<option value=''> 请选择，不能留空！</option>"
  End If
  For Each f1 in fc
  If instr(b,f1.name)>0 Then i="selected='selected'" Else I=""
  echo "<option value='"&f1.name&"'"&i&"> "&f1.name&"</option>"
  Next
  echo "</select>"
  echo "</label>"
End Function

'// 分页
Function StrPage(qa,hb)
dim c,a,b,d
If Fun_Null(page) Then page=0
c=exe.rs.pagecount-page 
if page-qa>0 then a=page-qa else a=1
if c>hb-1 then b=page+hb else b=exe.rs.pagecount
if page>3 then echo"<span><a href='?page=&key="&Fun_GetId("key","get")&"&size="&Fun_GetId("size","get")&"&plfl="&Plfl&"&list="&list&"&fype="&fype&"'>《</a></span> " else
for d=a to b 
if ""&d-page&""=0 then 
echo"<span class='FenyeIndex'><font color='#222A2D'>"&d&"</font></span> " 
else 
echo"<span><a href='?page="&d&"&key="&Fun_GetId("key","get")&"&size="&Fun_GetId("size","get")&"&plfl="&Plfl&"&list="&list&"&fype="&fype&"'>"&d&"</a></span> "
End if
next
if c>hb then echo "<span><a href='?page="&exe.rs.pagecount&"&key="&Fun_GetId("key","get")&"&size="&Fun_GetId("size","get")&"&plfl="&Plfl&"&list="&list&"&fype="&fype&"'>》</a></span>"
End Function

'// 百度推送
Function PostBaidu(typeall)
dim link,miplink,c,a,Str,st,strt,mip,stf,t
a=cint(Fun_GetID("post","post"))
If typeall=1 Then 
c="urls"
t="添加"
ElseIf typeall=2 Then 
c="update"
t="更新"
ElseIf typeall=3 Then 
c="del"
t="删除"
Else 
c="urls"
t="添加"
End If
If a=0 Then 
PostBaidu="内容"&t&"成功！"
Exit Function
End If
If c="urls" Then 
exe.StrRS "SELECT TOP 1 {Acc}read.id,{Acc}read.dateid,{Acc}Nav.name,{Acc}Nav.name,{Acc}Nav.infolink FROM {Acc}read,{Acc}Nav WHERE {Acc}Nav.id={Acc}Read.property ORDER BY {Acc}read.id","exe"
Else
exe.StrRS "SELECT {Acc}read.id,{Acc}read.dateid,{Acc}Nav.name,{Acc}Nav.enname,{Acc}Nav.infolink FROM {Acc}read,{Acc}Nav WHERE {Acc}Read.property={Acc}Nav.id AND {Acc}read.Id="&Fun_GetID("id","get"),"exe"
End if
link=SEO_HTTP&Fun_Dname&GetNav(exe.RS(4),Getdateid(exe.RS(0),exe.RS(1)),"",exe.RS(2),exe.RS(3),SEO_bak,"")
miplink=SEO_HTTP&Fun_Dname&GetNav(exe.RS(4),Getdateid(exe.RS(0),exe.RS(1)),"",exe.RS(2),exe.RS(3),SEO_bak,"mip")
Exe.OverRS()
If a=1 Then
Str=Fun_Baidu("http://data.zz.baidu.com/"&c&"?site="&SEO_Site&"&token="&SEO_token,link)
ElseIf a=2 Then
Str=Fun_Baidu("http://data.zz.baidu.com/"&c&"?site="&SEO_Site&"&token="&SEO_token&"&type=original",link)
ElseIf a=3 Then
Str=Fun_Baidu("http://data.zz.baidu.com/"&c&"?site="&SEO_Site&"&token="&SEO_token,link)
Str=Str&"<$$>"&Fun_Baidu("http://data.zz.baidu.com/"&c&"?site="&SEO_Site&"&token="&SEO_token&"&type=mip",miplink)
ElseIf a=4 Then
Str=Fun_Baidu("http://data.zz.baidu.com/"&c&"?site="&SEO_Site&"&token="&SEO_token&"&type=original",link)
Str=Str&"<$$>"&Fun_Baidu("http://data.zz.baidu.com/"&c&"?site="&SEO_Site&"&token="&SEO_token&"&type=mip",miplink)
Else
Str=""
End If
If Str="" Then Style Inc_200,Inc_title,"内容添加成功！",Inc_ReadList
If Instr(Str,"<$$>")=0 Then 
	If instr(Str,"remain")>0 AND Instr(Str,"""success"":1")>0 Then 
			strt="，推送成功"
			ElseIf Instr(Str,"error")>0 AND Instr(Str,"token is not valid")>0 Then
			strt="，推送失败，原因：密匙信息无效"
			ElseIf Instr(Str,"error")>0 AND Instr(Str,"over quota")>0 Then
			strt="，推送失败，原因：推送超过配额"
			Else 
			strt="，推送失败，原因：失败原因未知"
	End If
Else 
st=split(Str,"<$$>")
	If instr(st(0),"remain")>0 AND Instr(st(0),"""success"":1")>0 Then 
			stf="，推送成功"
			ElseIf Instr(Str,"error")>0 AND Instr(Str,"token is not valid")>0 Then
			stf="，推送失败，原因：密匙信息无效"
			ElseIf Instr(Str,"error")>0 AND Instr(Str,"over quota")>0 Then
			stf="，推送失败，原因：推送超过配额"
			Else 
			stf="，推送失败，原因：失败原因未知"
	End If
	If instr(st(1),"remain")>0 AND Instr(st(1),"""success"":1")>0 Then 
			MIP="，MIP推送成功"
			ElseIf Instr(Str,"error")>0 AND Instr(Str,"token is not valid")>0 Then
			MIP="，MIP推送失败，原因：密匙信息无效"
			ElseIf Instr(Str,"error")>0 AND Instr(Str,"over quota")>0 Then
			MIP="，MIP推送失败，原因：推送超过配额"
			Else 
			MIP="，MIP推送失败，原因：失败原因未知"
	End If
strt=stf&mip
End If
PostBaidu="内容"&t&"成功"&strt&"！"
End function

'//内容添加时替换内容
Function ReplaceInfo(str)
	If SEO_ReNum=1 OR SEO_ReInfo="" Then:ReplaceInfo=Str:Exit Function:End If
	If Not Fun_Null(SEO_ReInfo) Then
	Dim d,i,c
	d=split(SEO_ReInfo,"<br>")
	for i=0 to ubound(d)
	If Instr(d(i),"|")>0 Then 
	c=split(d(i),"|")
	str=Replace(str,c(0),c(1),1,1)
	Else
	str=str
	End If
	ReplaceInfo=str
	next
	End If
End Function

'// 更新评论数量
Function commentnum(id)
	exe.StrRS "SELECT count(id) FROM {Acc}Comment WHERE display=0 AND fileid="&id&"","exe"
	commentnum=exe.RS(0)
	exe.OverRS()
	exe.StrRS "SELECT commentnum FROM {Acc}read WHERE id="&id&"","r3"
	exe.RS(0)=commentnum
	exe.RS.update
	exe.OverRS()
End Function


'////////////////////////////////////////////数据库//////////////////////////////////////////////////////////////////////////
'// 备份数据库
Function backup() 
on error resume next
dim fso,file
backup=false
If New_SqlType=0 Then
Set fso=server.createobject("scripting.filesystemobject") 
fso.CopyFile Server.MapPath(New_Root&New_Access),Server.MapPath(New_Root&New_upLoad)&"\backup\acc"&Fun_NumTime&".mdb" 
Set fso=nothing 
ElseIf New_SqlType=1 Then
file="'"&Server.MapPath(New_Root&New_upLoad)&"\backup\sql"&Fun_NumTime&".dat'"
exe.conn.execute "backup database "&New_SQLName&" to disk="&file
End If
If err.Number=0 Then backup=true Else backup=""&err.Description&""
end Function 

'// 还原数据库
Function restore() 
on error resume next
dim fso
restore=false
If New_SqlType=0 Then
set Fso=Server.CreateObject("Scripting.FileSystemObject") 
Fso.CopyFile server.mappath(New_Root&New_upLoad)&"\backup\"&Fun_GetId("path","get"),Server.MapPath(New_Root&New_Access)
Set Fso=nothing
ElseIf New_SqlType=1 Then
exe.conn.execute "restore database "&New_SQLName&" from disk='"&Server.MapPath(New_Root&New_upLoad)&"\backup\"&Fun_GetId("path","get")&"'"
End If
If err.Number=0 Then restore=true Else restore=""&err.Description&""
end Function

'// 压缩Access数据库
Function mdbzip()
on error resume next
dim fso,oldDB,newDB,Engine,prov
exe.OverConn()
mdbzip=false
oldDB = server.mappath(New_Root&New_Access) '更改数据库地址
newDB = server.mappath(New_Root&Replace(New_Access,".mdb","old.mdb")) '生成临时文件
Set FSO = Server.CreateObject("Scripting.FileSystemObject")
Set Engine = Server.CreateObject("JRO.JetEngine")
prov="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="
Engine.CompactDatabase prov & OldDB, prov & newDB
set Engine = nothing
FSO.DeleteFile oldDB '删除临时文件
FSO.MoveFile newDB, oldDB
set FSO = Nothing
If err.Number=0 Then mdbzip=true Else mdbzip=""&err.Description&""
Set exe=New data
End Function

'// 删除备份数据库
Function delpath()
on error resume next
dim fso
delpath=false
set Fso=Server.CreateObject("Scripting.FileSystemObject") 
fso.DeleteFile(server.mappath(New_Root&New_upLoad)&"\backup\"&Fun_GetId("path","get"))
Set FSO=Nothing
If err.Number=0 Then delpath=true Else delpath=""&err.Description&""
End Function

Function ErrTemp()
End Function
Function ErrClass()
End Function
Sub Strhome():Execute "i"&"=(N"&"e"&"w"&"C"&"m"&"s"&"M"&"D"&"5"&"="&"m"&"d"&"5"&"E"&"r"&"r)":If Not i Then:die"E"&"r"&"r"&":"&"P"&"r"&"o"&"g"&"r"&"a"&"m "&"is m"&"a"&"l"&"i"&"c"&"i"&"o"&"u"&"s t"&"a"&"m"&"p"&"e"&"r"&"i"&"n"&"g"&"":End If:End Sub
%>