<%
Dim a,b,i,la,lb,m,StrHtml,Str,Stra,Strb,linkArray,vnum,num,nametype
dim pagenum:pagenum=Fun_GetID("page","get")
dim tempall:tempall=Fun_GetSql(Fun_GetID("temp","get"))
dim temtype:temtype=Fun_GetSql(Fun_GetID("type","get"))
dim typetem:If Fun_Null(temtype) Then typetem="/" Else typetem="/"&temtype&"/"
If temtype<>"" Then nametype=temtype
If SEO_Wap=0 Then:If Fun_Wap() Then typetem="/wap/":nametype="wap":End If
If Fun_Null(tempall) Then tempall=New_Temp Else tempall="/"&tempall
dim Fun_FileLink:Fun_FileLink=New_Root&New_Tempfile&tempall&New_Tempf&typetem

'目的 缓存成文本文档
Function Fun_GetText(a,b)
	On Error Resume Next
	Dim fso,f,filelink
	filelink=New_Root&New_upLoad&New_CacheFe&"/"&a&nametype&"."&New_Suffix
	Set fso=CreateObject(New_Script_file)
	Set f=fso.GetFile(server.mappath(filelink))  
	If DateAdd("n",New_FeCache,f.DateLastModified) < Now() AND New_FeCache>0 then
	Fun_GetText=Fun_FeText(filelink,CaseTypeFlie(b))
	Else 
	Fun_GetText=Fun_File(filelink)
	If Fun_Null(Fun_GetText) Then Fun_GetText=Fun_FeText(filelink,CaseTypeFlie(b))
	End if
	Set f=nothing
	Set	Fso=nothing
End Function

FunCtion CaseTypeFlie(a)
	Select Case a
		case "home" CaseTypeFlie=FunHome("home.html")
		case "page" CaseTypeFlie=FunPage(navpaid,pagenum)
		case "list" CaseTypeFlie=Funlist(navpaid,pagenum)
		case "read" CaseTypeFlie=FunRead(readnum,pagenum)
		case "tags" CaseTypeFlie=FunListAll(tagssiz,pagenum,"tags.html")
		case "date" CaseTypeFlie=FunListAll(datesiz,pagenum,"date.html")
		case "search" CaseTypeFlie=FunListAll(keyname,pagenum,"search.html")
		case "author" CaseTypeFlie=FunListAll(acessiz,pagenum,"author.html")
	End Select
End Function

'目的 安全过滤参数
Function Fun_GetSql(str)
	IF Fun_Null(str) OR Fun_Num(str) Then Fun_GetSql=str:Exit Function
	str = lcase(str)
	Stra=Array("""",",","'","%","^","-","=","+","and","exec","insert","select","delete","update","count","chr","mid","master","truncate","char","declare",".shtml",SEO_Bak)
	For i=0 to Ubound(Stra):str = Replace(str,Stra(i),""):next
	Fun_GetSql=str
End Function

'目的 安全禁止包含
Function Fun_SqlSafe(str)
dim SqlSafe,i
Fun_SqlSafe=False
SqlSafe=Array("and","exec","insert","select","delete","update","count","*","%","chr","mid","master","truncate","char","declare")
for i=0 to ubound(SqlSafe)
If Instr(str,SqlSafe(i))>0 Then Fun_SqlSafe=true:exit Function
next
End Function

'目的 检查POST来路 
Sub PostStop()
	Exe.StrRS "select Url from [{Acc}Set]","exe":url=exe.RS(0):exe.OverRS()
	If Fun_Null(Url) Then Url=SEO_Http&Fun_Dname
	If Fun_Url(Url) Then Url=SEO_Http&Url
	If Instr(Fun_Lailu,"?")>0 Then Fun_Lailu=split(Fun_Lailu,"?")(0)
	If Instr(Fun_Lailu,exe.RS(0)) = 0 Then die New_Close
End Sub

'目的 拦截ip，来路，客户端
Function Fun_StrQ()
If Safe_Allq=1 Then Exit Function
dim i,strl
If Safe_Allq=0 Then
	If Safe_ipnum=0 AND Not Fun_Null(Safe_ip) Then
	strl=split(Replace(Safe_ip,".*",""),"<br>")
		For i=0 to ubound(strl)
			If Instr(Fun_Getip,strl(i))>0 Then die New_Close
		Next
	End If
	If Safe_khdnum=0 AND Not Fun_Null(Safe_khd) Then
	strl=split(lcase(Safe_khd),"<br>")
		For i=0 to ubound(strl)
			If Instr(lcase(Fun_Agent),strl(i))>0 Then die New_Close
		Next
	End If
	If Safe_Lailunum=0 AND Not Fun_Null(Safe_Lailu) Then
	strl=split(lcase(Safe_Lailu),"<br>")
		For i=0 to ubound(strl)
			If Instr(lcase(Fun_Lailu),strl(i))>0 Then die New_Close
		Next
	End If
End If
End Function

'目的 授权
Function Fun_StrH()
If Safe_Allh=1 Then Exit Function
dim i,strl,ip,khd,lailu
If Safe_Allh=0 Then
	If Safe_hipnum=0 AND Not Fun_Null(Safe_hip) Then
	strl=split(Replace(Safe_hip,".*",""),"<br>")
		For i=0 to ubound(strl)
			If Instr(Fun_Getip,strl(i))>0 Then ip=True
		Next
	If Not ip Then die New_Close
	End If
	If Safe_hkhdnum=0 AND Not Fun_Null(Safe_hkhd) Then
	strl=split(lcase(Safe_hkhd),"<br>")
		For i=0 to ubound(strl)
			If Instr(lcase(Fun_Agent),strl(i))>0 Then khd=True
		Next
	If Not khd Then die New_Close
	End If
	If Safe_hLailunum=0 AND Not Fun_Null(Safe_hLailu) Then
	strl=split(lcase(Safe_hLailu),"<br>")
		For i=0 to ubound(strl)
			If Instr(lcase(Fun_Lailu),strl(i))>0 Then lailu=True
		Next
	If Not lailu Then die New_Close
	End If
End If
End Function

Function Login()
	If instr(Ucase(Fun_SName),"LOGIN.ASP") > 0 OR Session("stop")="1" Then Exit Function
	Dim c_display,C_pass,c_user'Strhome()
	c_display = Fun_Cookie("%display%161008#")
	C_pass = Fun_Cookie("%pass%161008#")
	c_user = Fun_Cookie("%user%161008#")
	If c_display<>"0" OR Fun_null(C_pass) OR Fun_null(c_user) Then:InfoStr Inc_401,Inc_Title,Inc_401_Title,Inc_Login:Session.Abandon:End If
	exe.StrRS "SELECT id FROM {Acc}user WHERE name='"&c_user&"' AND pass='"&C_pass&"' AND display=0","exe"
	If exe.RS.Eof Then
	Session.Abandon
	Fun_RECookie "%display%161008#","",""
	Fun_RECookie "%pass%161008#","",""
	Fun_RECookie "%user%161008#","",""
	InfoStr Inc_401,Inc_Title,Inc_401_Title,Inc_Login
	Else
	Call Fun_StrH()
	Session("stop")="1"
	End If
	exe.OverRS()
End Function

'获取文件内容引擎 Fun_File(路径)
Function Fun_File(FileUrl)
	On Error Resume Next
	dim str,stm
	set stm=server.CreateObject(New_Stream_Name)
	stm.Type=2
	stm.mode=3
	stm.charset=New_CharSet
	stm.open
	stm.loadfromfile server.MapPath(FileUrl)
	str=stm.readtext
	stm.Close
	set stm=nothing
	Fun_File=str
End Function


Function InfoStr(a,b,c,d)
On Error Resume Next
dim StrHtml:StrHtml=Fun_File(New_Root&New_Tempfile&New_Temp&"/skin/info.html")
If Fun_Null(StrHtml) Then
	StrHtml=StrHtml&"<title>"&a&SEO_conn&Inc_CMD&"</title>" & vbCrLf
	StrHtml=StrHtml&"<meta charset='UTF-8' />" & vbCrLf
	StrHtml=StrHtml&"<meta http-equiv='pragma' content='no-cache'>"
	StrHtml=StrHtml&"<meta http-equiv='cache-control' content='no-cache'>"
	StrHtml=StrHtml&"<meta http-equiv='expires' content='0'>"
	StrHtml=StrHtml&"<meta name='robots' content='none'/>"
	StrHtml=StrHtml&"<style type='text/css'>" & vbCrLf
	StrHtml=StrHtml&".style {width:70%;margin-left:auto; margin-right:auto;background: rgba(255, 255, 255, 0.5) none repeat scroll 0px 0px !important;margin-top:17%}" & vbCrLf
	StrHtml=StrHtml&".style_new {font-size:20px; text-align:center; padding:10% 0 10% 0;font-family:'微软雅黑'}" & vbCrLf
	StrHtml=StrHtml&".style_new a{color: #3333CC;}" & vbCrLf
	StrHtml=StrHtml&"</style>" & vbCrLf
	StrHtml=StrHtml&"<script type='text/javascript'>" & vbCrLf
	If d<>"" Then StrHtml=StrHtml&"setTimeout(func,""2000"")" & vbCrLf
	StrHtml=StrHtml&"function func()" & vbCrLf
	StrHtml=StrHtml&"{" & vbCrLf
	if d = "back" Then
	StrHtml=StrHtml&"history.back();" & vbCrLf
	Else
	StrHtml=StrHtml&"window.location.href='"&d&"?Rnd="&NOW()&"'//打开" & vbCrLf
	StrHtml=StrHtml&"window.location.replace('"&d&"?Rnd="&NOW()&"')//替换" & vbCrLf
	End If
	StrHtml=StrHtml&"}" & vbCrLf
	StrHtml=StrHtml&"</script>"  & vbCrLf
	StrHtml=StrHtml&"</head>" & vbCrLf
	StrHtml=StrHtml&"<body style='background-color: #CFF;'>" & vbCrLf
	StrHtml=StrHtml&"<div class='style'>" & vbCrLf
	StrHtml=StrHtml&"<div class='style_new'>" & vbCrLf
	StrHtml=StrHtml&""&b&"：<a>"&c&"</a>" & vbCrLf
	StrHtml=StrHtml&"</div>" & vbCrLf
	StrHtml=StrHtml&"</div>" & vbCrLf
	StrHtml=StrHtml&"</body>"
Else
	StrHtml=Replace(StrHtml,"[info:name]",a)
	StrHtml=Replace(StrHtml,"[info:title]",a&SEO_conn&Inc_CMD)
	StrHtml=Replace(StrHtml,"[info:vers]",b)
	StrHtml=Replace(StrHtml,"[info:desc]",c)
	StrHtml=Replace(StrHtml,"[info:link]",d)
	StrHtml=FunIf(FunApi(StrHtml))
End If
	exe.OverConn
	die StrHtml
End Function

function lineFile(filename,starNum,endnum) 
    if starNum < 1 then exit function 
    dim fso,f,temparray,tempcnt,b
    set fso = server.CreateObject(New_Script_file) 
    if not fso.fileExists(server.mappath(filename)) then exit function 
    set f = fso.opentextfile(server.mappath(filename),1) 
    if not f.AtEndofStream then 
        tempcnt = f.readall 
        f.close 
        set f = nothing 
        temparray = split(tempcnt,chr(13)&chr(10)) 
        if starNum>ubound(temparray)+1 then 
            exit function 
        else 
        i=starNum
        for j=i to endnum
           a =a&temparray(j-1)&"," 
        next
        str=a
        end if
    end if
	b=split(str,",")
	for i=0 to endnum-starNum+1
	FSOlinedit=FSOlinedit&b(i)
	next
end function
'// 修改文件替换内容
Function reInfo(a,b,c,d)
	If Fun_Num(d) Then d=d Else d=""""&d&""""
	If Fun_Null(d) Then d=""""""
	i=Split(a,b)(1)
	i=Split(i,c)(0)
	reInfo=replace(a,b&i,b&d)
End Function
'目的 写入文件 Fun_FeText(路径,内容)
Function Fun_FeText(FileUrl,byval Str):Dim stm:set stm=server.CreateObject(New_Stream_Name):stm.Type=2:stm.mode=3:stm.charset=New_CharSet:stm.open:stm.WriteText str:stm.SaveToFile server.MapPath(FileUrl),2:stm.flush:stm.Close:set stm=nothing:Fun_FeText=Str:End Function

'截取指定内容 Fun_StrCn(内容，条件,开始，结束，替换内容)
Private Function Fun_StrCn(a,b,c,d,e)
Dim i,Stri,over,startstr,endstr,censtr,imdstr,dstr,ee,f,g
	If instr(e,"<")>0 AND instr(e,">")>0 Then e=Fun_HTML(e,0) Else e=e End if
	If instr(e,"{%+%}")>0 Then
	ee=split(e,"{%+%}")
	f=ee(1)
	e=ee(0)
	g=ee(2)
	End If
	i=e
	If Instr(i,"{new:pagenum}")>0 Then i=Replace(i,"{new:pagenum}","")
	If instr(a,"["&b&" len=")>0 Then 
	Stri = c:over = d
	startstr = InStr(a,Stri) + len(Stri)    '找到开始位置
	endstr = startstr+50       '找到结束位置
	imdstr=endstr - startstr
	censtr = split(Mid(a,startstr,imdstr),"]")(0)  '截取字符串
	If Not Fun_Null(censtr) Then censtr=Cint(censtr)
	if len(i)>censtr Then dstr="..."
	If f<>"" AND g="search" Then Fun_StrCn=replace(a,"["&b&" len="&censtr&"]",Fun_StrGL(Left(i,censtr),f)&dstr) Else Fun_StrCn=replace(a,"["&b&" len="&censtr&"]",Left(i,censtr)&dstr)
	ElseIf Instr(a,"["&b&"]")>0 Then
	If f<>"" AND g="search" Then Fun_StrCn=replace(a,"["&b&"]",Fun_StrGL(i,f)) Else Fun_StrCn=replace(a,"["&b&"]",i)
	End if
End Function

Function StrGen(a,b,c,d,e)
Dim startstr,endstr,imdstr,censtr,dstr
	If instr(a,"["&b&" len=")>0 Then 
		startstr = InStr(a,c) + len(c)    '找到开始位置
		endstr = startstr+20       '找到结束位置
		imdstr=endstr - startstr
		censtr = split(Mid(a,startstr,imdstr),d)(0)  '截取字符串
		If Not Fun_Null(censtr) Then censtr=Cint(censtr)
		if len(e)>censtr Then dstr="..."
		StrGen=replace(a,"["&b&" len="&censtr&"]",Left(e,censtr)&dstr)
	Else
		StrGen=replaceStr(a,"["&b&"]",e)
	End If
	If instr(StrGen,"["&b&" len=")>0 OR instr(StrGen,"["&b&"]")>0 Then StrGen=StrGen(StrGen,b,c,d,e)
End Function

Function Fun_TypeDate(a,b,c,d,e)
Dim startstr,endstr,censtr,imdstr
	If instr(a,"["&b&" type=")>0 Then 
	startstr = InStr(a,c) + len(c)    '找到开始位置
	endstr = startstr+10       '找到结束位置
	imdstr=endstr - startstr
	censtr = split(Mid(a,startstr,imdstr),d)(0)  '截取字符串
	Fun_TypeDate=replace(a,"["&b&" type="&censtr&"]",Fun_Date(e,censtr))
	ElseIf Instr(a,"["&b&"]")>0 Then
	Fun_TypeDate=replace(a,"["&b&"]",e)
	End if
	If instr(Fun_TypeDate,b)>0 Then Fun_TypeDate=Fun_TypeDate(Fun_TypeDate,b,c,d,e)
End Function

Function Fun_PageNum(a)
Dim Stri,over,startstr,endstr,censtr,imdstr
	If instr(a,"{new:pagenum num=")=0 Then Exit Function
	Stri = "{new:pagenum num=":over = "}"
	startstr = InStr(a,Stri) + len(Stri)    '找到开始位置
	endstr = startstr+12        '找到结束位置
	imdstr=endstr - startstr
	censtr = split(Mid(a,startstr,imdstr),"}")(0)  '截取字符串
	Fun_PageNum=censtr
End Function

Function replaceStr(Byval str,Byval finStr,Byval repStr)
	on error resume next
	if isNull(repStr) then repStr=""
	replaceStr=replace(str,finStr,repStr)
	if err.number<>0 then replaceStr="" : err.clear
End Function

Private Function MidInfo(strhtml,str,over)
Dim startstr,endstr,imdstr,censtr
	startstr = InStr(strhtml,str) + len(str)    '找到开始位置
	endstr = startstr+20        '找到结束位置
	imdstr=endstr - startstr
	censtr=split(Mid(strhtml,startstr,imdstr),over)(0)  '截取字符串
	MidInfo=censtr
End Function

Function ArrNum(a,b,c)
ArrNum=Fun_parseArr(a)(b)
If Not Fun_Num(ArrNum) Then ArrNum=c
End Function
'获取关键数值引擎 Fun_parseArr(数值)
Function Fun_parseArr(Byval attr)
	dim strDictionary,attrStr,attrArray,i,singleAttr,singleAttrKey,singleAttrValue
	set strDictionary=server.CreateObject("SCRIPTING.DICTIONARY")
	attrStr = Replace(attr,"[\s]+",chr(32))
	attrStr = trim(attrStr)
	attrArray = split(attrStr,chr(32))
	for i=0 to ubound(attrArray)
		singleAttr = split(attrArray(i),chr(61))
		singleAttrKey =  singleAttr(0) : singleAttrValue =  singleAttr(1)
		if not strDictionary.Exists(singleAttrKey) then strDictionary.add singleAttrKey,singleAttrValue else strDictionary(singleAttrKey) = singleAttrValue
	next
	set Fun_parseArr = strDictionary
End Function

'目的 获取Url地址的内容并且可以转换编码 GetUrl(远程路径,编码)
Function GetURL(HttpUrl,Cset)
	On Error Resume Next
	Dim UserAgent(1)
	UserAgent(0)="Mozilla/5.0+(compatible;+Baiduspider/2.0;++http://www.baidu.com/search/spider.html)"
	UserAgent(1)="Mozilla/5.0 (Windows NT 10.0; rv:49.0) Gecko/20100101 Firefox/49.0"
	Dim Http,GetHttpPage
	Set Http=server.createobject(New_XHtml_Name)
	Http.open "GET",HttpUrl,False
	Http.setRequestHeader "User-Agent",UserAgent(0)
	'Http.setRequestHeader "referer","www.baidu.com"'
	Http.Send()
	GetHttpPage=Http.responseBody
	Set Http=Nothing
	Dim Objstream
	Set Objstream = Server.CreateObject(New_Stream_Name)
	Objstream.Type = 1
	Objstream.Mode = 3
	Objstream.Open
	Objstream.Write GetHttpPage
	Objstream.Position = 0
	Objstream.Type = 2
	Objstream.Charset = Cset
	GetURL = Objstream.ReadText 
	Objstream.Close
	set Objstream = nothing
End Function
'目的 获取完整真实的Url
Public Function Fun_GetUrl()
  Fun_GetUrl = SEO_Http&Fun_Dname()
  If Request.ServerVariables("SERVER_PORT") <> 80 Then Fun_GetUrl = Fun_GetUrl &":" & Request.ServerVariables("SERVER_PORT")
  If Request.ServerVariables("URL")="/index.asp" Or Request.ServerVariables("URL")="/home.asp" Then 
  Fun_GetUrl = Fun_GetUrl & "/"
  else
  Fun_GetUrl = Fun_GetUrl & Request.ServerVariables("URL")
  end If
  If Trim(Request.QueryString) <>"" Then Fun_GetUrl = Fun_GetUrl &"?" & Trim(Request.QueryString)
End Function
 
'目的 输出
Function echo(a):response.write(a):response.flush():End Function
Sub die(str)
	if not Fun_Null(str) then
		echo str
	end if	 
	response.End()
End Sub
'目的 1-100的随机数字
Function Fun_Num100():Randomize:Fun_Num100=replace(Mid((Rnd * 100),1,2),".",""):End Function
'目的 1-50的随机数字
Function Fun_Num50():Randomize Timer:Fun_NumTemp = Int((50*Rnd())+1):End Function
'目的 日期时间转数字+1-100随机数字
Function Fun_NumTime():Fun_NumTime=right(Year(Now()),2)&right("00"&Month(Now()),2)&right("00"&Day(Now()),2)&right("00"&Hour(Now()),2)&right("00"&Minute(Now()),2)&right("00"&Second(Now()),2)&Fun_Num100():End Function
'目的 取得来路地址
Function Fun_Lailu():Fun_Lailu = request.ServerVariables("HTTP_REFERER"):End Function
'目的 获取真实IP
Function Fun_GetIP():Fun_GetIP = Request.ServerVariables("HTTP_X_FORWARDED_FOR"):If Fun_GetIP = "" Then Fun_GetIP = Request.ServerVariables("REMOTE_ADDR"):End If:End Function
'目的 获取客户端信息
Function Fun_Agent():Fun_Agent = Request.ServerVariables("HTTP_USER_AGENT"):End Function
'目的 获取伪静态后的地址
Function Fun_REWRITE()
If Instr(Request.ServerVariables("SERVER_SOFTWARE"),"6.0")>0 Then
Fun_REWRITE=Request.ServerVariables("HTTP_X_REWRITE_URL")
Else
Fun_REWRITE=Request.ServerVariables("HTTP_X_ORIGINAL_URL")
End If
If Fun_REWRITE="" Then Fun_REWRITE=Fun_GetUrl()
End Function
'目的 获取域名
Function Fun_dname():Fun_dname = Request.ServerVariables("SERVER_NAME"):End Function
'目的 读取Cookie
Function Fun_Cookie(a):Fun_Cookie = Request.cookies(a):End Function
'目的 写入cookie
Function Fun_ReCookie(a,b,c):Response.Cookies(a)=b:If Not Fun_Null(c) Then Response.Cookies(a).Expires=Date+cint(c) End If:End Function
'目的 返回404
Function Fun_404(a):Response.Status = "404 Not Found":If Fun_Null(a) = False Then:Response.Write(a):Response.End:Else:response.write "":Response.End:End If:End Function
'目的 返回301跳转
Function Fun_301(a):Response.Status="301 Moved Permanently":response.AddHeader "Location", ""&a&"":Response.End :End Function
'目的 获取id
FunCtion Fun_URLID(a):If Fun_Null(a) = False Then:Fun_URLID = Fun_GetSql(request.QueryString(a)):Else:Fun_URLID = Fun_GetSql(Request.ServerVariables("QUERY_STRING")):End If:End Function
'目的 获取路径名称
Function Fun_SName:Fun_SName=Request.ServerVariables("Script_Name"):End Function
'目的 获取数据
FunCtion Fun_GetId(a,b)
If Fun_Null(a) AND b="get" Then
Fun_GetId = Request.ServerVariables("QUERY_STRING")
ElseIf b="get" Then
Fun_GetId = request.QueryString(a)
ElseIf b="post" Then
Fun_GetId = request.form(a)
End If
End Function
'目的 判断是否为空
Function Fun_Null(a):If isnull(a) OR a="" Then Fun_Null=True Else Fun_Null=False:End If:End Function
Function Fun_Url(a):If instr(a,"http://")>0 AND Instr(a,".")>0 Or Instr(a,"https://")>0 AND Instr(a,".")>0 Then Fun_Url=True Else Fun_Url=False End If:End Function
'目的 判断是否为数字
Function Fun_Num(a):If isNumeric(a) Then Fun_Num=True Else Fun_Num=False:End If:End Function
' ============================================
' 判断是否安全字符串,在注册登录等特殊字段中使用
' ============================================
Function Fun_SafeStr(str)
 Dim s_BadStr, n, i
 s_BadStr = "'&<>?%,;:()`~!@#$^*{}[]|+-=┩" & Chr(34) & Chr(9) & Chr(32)
 n = Len(s_BadStr)
 IsSafeStr = True
 For i = 1 To n
  If Instr(str, Mid(s_BadStr, i, 1)) > 0 Then
   IsSafeStr = False
   Exit Function
  End If
 Next
End Function
'正则电话号码
Function Fun_Tel(TelPhone)
dim re,re2,CheckResult
Set re = new RegExp:Set re2 = new RegExp
re.Pattern = "^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$" '电话格式1
re2.Pattern = "^(([0\+]\d{2,3}-)?(0\d{2,3}))?(\d{7,8})(-(\d{3,}))?$" '电话格式2
'进行匹配测试
If re.Test(TelPhone) or re2.Test(TelPhone) Then CheckResult=true Else CheckResult=false
Fun_Tel=CheckResult
end function

'正则手机号码
Function Fun_Mobile(Mobile)
dim re,CheckResult
Set re = new RegExp
re.Pattern = "^(((13[0-9]{1})|147|150|151|152|153|156|158|159|182|186|188|189)+\d{8})$"
If re.Test(Mobile) Then CheckResult=true Else CheckResult=false
Fun_Mobile=CheckResult
end function

'正则检测邮箱
Function Fun_Mail(Email)
dim CheckResult,re
Set re = new RegExp 
re.Pattern = "^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
If re.Test(Email) Then CheckResult=true Else CheckResult=false
Fun_Mail=CheckResult
end function

'正则检测QQ号码
Function Fun_QQ(QQnum)
dim CheckResult,re
Set re = new RegExp
re.Pattern = "^\d{5,10}$"
If re.Test(QQnum) Then CheckResult=true else CheckResult=false
Fun_QQ=CheckResult
end function
'目的 判断是否为手机端
Function Fun_Wap()
 dim reExp,MbStr
 Set reExp = New RegExp
 MbStr="Android|iPhone|UC|Windows Phone|webOS|BlackBerry|iPod"
 reExp.pattern=".*("&MbStr&").*"
 reExp.IgnoreCase = True
 reExp.Global = True
 If reExp.test(Fun_Agent) Then Fun_Wap = True Else Fun_Wap = False
End Function
'目的 判断是否包含字母
function Fun_En(str)  
'先将str转为小写  
dim flag,enChar,onChar,i
str = LCase(str)   
flag=false   
enChar="a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"   
onChar=split(enChar,",")   
for i=0 to ubound(onChar)   
if instr(str,onChar(i))<>0 then   
flag=true   
exit for   
end if   
next   
Fun_En=flag   
end function
Function FunVers(StrHtml)
StrHtml=Replace(StrHtml,"<he"&"ad>","<he"&"ad>"&vbcrlf&"<m"&"eta na"&"me=""ve"&"rsion"" co"&"nte"&"nt="""&inc_Cmd&""" />"&vbcrlf&"<me"&"ta nam"&"e=""aut"&"hor"" content=""程"&"序"&"作"&"者：新"&"成"" />")
FunVers=Replace(StrHtml,"</bod"&"y>","</bo"&"dy>"&vbcrlf&"<!--"&inc_Cmd&vbcrlf&"作"&"者"&"博"&"客：zh"&"anx"&"in"&"che"&"n"&"g.c"&"o"&"m-->")
End Function
'目的 判断目录是否存在
Function StrPath(a)
On Error Resume Next
Dim fso
StrPath=False
Set Fso=Server.CreateObject(New_Script_file)
If Fso.FolderExists(Server.Mappath(a)) Then StrPath=True
Set Fso = Nothing
If Err.number<>0 Then StrPath=""&err.Description&""
End Function

'判断目录目录是否存在，不存在则创建
Function AddFile(a)
On Error Resume Next
Dim fso
AddFile=False
set fso=Server.CreateObject(New_Script_file) 
If Not fso.folderexists(Server.MapPath(a)) Then fso.CreateFolder(Server.MapPath(a))
SET fso=nothing
If err.number=0 Then AddFile=True Else AddFile=""&err.Description&""
End Function
'目的 计算页面执行时间
Function OverTime():OverTime = FormatNumber((timer() - StrTime) * 1000,2):End Function

'目的 删除指定目录文件
Function DelFile(a)
on error resume next
dim fso
DelFile=false
set fso=Server.CreateObject(New_Script_file)
fso.DeleteFile(server.mappath(a))
Set FSO=Nothing
If err.Number=0 Then DelFile=true Else DelFile=""&err.Description&""
End Function

Function GetNav(a,b,c,d,e,f,g)
	Str=""
	Str=a
	Str=replace(Str,"[type:id]",b)  
	If Fun_Null(c) Then
	Str=Replace(Replace(Replace(Replace(Str,"&page=[type:page]",""),"-[type:page]",""),"/[type:page]",""),"[type:page]/","")
	Else
	Str=replace(Str,"[type:page]",c)
	End If
	If Fun_Null(g) Then
	Str=Replace(Replace(Replace(Replace(Str,"&type=[type:class]",""),"-[type:class]",""),"/[type:class]",""),"[type:class]/","")
	Else
	Str=replace(Str,"[type:class]",g)
	End If
	If Instr(Str,"[type:en]")>0 Then Str=replaceStr(Str,"[type:en]",d)
	If Instr(Str,"[type:cn]")>0 Then Str=replaceStr(Str,"[type:cn]",e)
	GetNav=New_Root&replace(Str,"[type:html]",f)
End Function

Function Getdateid(a,b):If SEO_DATEId=0 Then Getdateid=a Else Getdateid=b End If:End function

'目的 百度主动推送 Fun_Baidu(请求地址,提交地址)
function Fun_Baidu(a,b) 
    dim Http,objstream
	On Error Resume Next
    set Http=server.createobject(New_XHtml2_Name)
    Http.open "POST",a,false 
    Http.setRequestHeader "CONTENT-TYPE", "text/plain" 
    Http.send(b)
    if Http.readystate<>4 then exit function 
    set objstream = Server.CreateObject(New_Stream_Name)
    objstream.Type = 1 
    objstream.Mode = 3 
    objstream.Open 
    objstream.Write Http.responseBody 
    objstream.Position = 0 
    objstream.Type = 2 
    objstream.Charset = "utf-8" 
    Fun_Baidu = objstream.ReadText 
    objstream.Close 
    set objstream = nothing 
    set http=nothing
	If err.number<>0 Then err.clear
End function

'获取页面中的图片地址 Fun_ImgLink(内容)
Function Fun_ImgLink(strHTML)
On Error Resume Next
dim b,c,d,FilePaths,yy,mm,dd,uploaddate,re,RanNum,colMatches,m
yy=right(year(date),4):mm=right("00"&month(date),2):dd=right("00"&day(date),2)
uploaddate=yy&"-"&mm&"-"&dd
FilePaths=New_Root&New_upLoad&"/images/"&uploaddate&"/"
AddFile FilePaths
Set re = New RegExp
    re.Pattern = "<img([\s\S]*?)src=(""|')([\s\S]*?).(png|jpg|jpeg|bmp|gif)(""|')([\s\S]*?)/>"
    re.IgnoreCase = True
    re.Global = True
	re.MultiLine = True
    Set colMatches = re.Execute(strHTML)
    For Each m In colMatches
	c = m.SubMatches(2)&"."&m.SubMatches(3)'远程图片路径
	b = m.SubMatches(3)					   '远程图片格式
	RanNum=Int(900*Rnd)+100&"yc"
    d = Year(Now()) & Right("0" & Month(Now()),2)&  Right("0" & Day(Now()),2) & Right("0" & Hour(Now()),2) & Right("0" & Minute(Now()),2) & Right("0" & Second(Now()),2) &ranNum&"."& b
	d = FilePaths&d
	If Fun_DownPic(d,c) AND Instr(c,"http")>0 Then
	echo "[保存成功]"&d&"<br />"
	strHTML=replace(strHTML,c,d)
	ElseIf Instr(c,"http")=0 Then
	strHTML=strHTML
	else
	echo "[保存失败]"&c&"<br />"
	strHTML=strHTML
	End If
    Next
	Set re = Nothing
	Fun_ImgLink = strHTML
End Function

'目的 保存远程图片到本地 Fun_DownPic(a保存图片位置,b远程图片地址)
function Fun_DownPic(a,b)
	Server.ScriptTimeOut=99999
    Dim Ads,Http,GetHttpPage
    On Error Resume Next
	Set Http=server.createobject(New_XHtml_Name)
	If err.number<>0 Then:SET Retrieval=Server.CreateObject(New_XHtml2_Name):err.clear:End If
	If err.number<>0 Then:Fun_DownPic = false:Exit Function:End If
	Http.open "GET",b,False:Http.Send():GetHttpPage=Http.responseBody
    Set Http=Nothing
    Set Ads=Server.CreateObject(New_Stream_Name) 
	Ads.Type = 1:Ads.Open:Ads.Write GetHttpPage:Ads.SaveToFile Server.MapPath(a), 2:Ads.Cancel():Ads.Close()
	Set Ads=Nothing
	If Pin_Sy=0 Then yjpeg(a)
	if err.number<>0 then:Fun_DownPic = false:err.clear:else:Fun_DownPic = true:end if
	Response.Flush
End Function
'目的 获取内容指定图片 Fun_StrImg(内容,第几张)
Function Fun_StrImg(strHTML,num)
If Fun_Null(num) Then num=1
If Not Fun_Num(num) Then Num=cint(num)
Num=Num-1
Dim a,b,re,colMatches,m,c
If not isNumeric(num) Then Exit Function End If
Set re = New RegExp
    re.Pattern = "<img([\s\S]*?)src=(""|')([\s\S]*?).(png|jpg|jpeg|bmp|gif|ico)(""|')([\s\S]*?)/>"
    re.IgnoreCase = True
    re.Global = True
    re.MultiLine = True
    Set colMatches = re.Execute(strHTML)
    For Each m In colMatches
	    b = b&m.SubMatches(2)&"."&m.SubMatches(3)&"|" '获取图片地址
    Next
	Set colMatches=Nothing
	If num=-2 Then 
	Fun_StrImg=b
	Else
	a=split(b,"|")
	c=ubound(a)-1
	If Num < 0 Then Num=0
	If Num > c Then Num=c
	Fun_StrImg=a(Num)
	End If
End Function


'目的 统计字数
Function Fun_StrLen(str)
	str = Fun_HTML(str,0)
	If Fun_Null(str) Then
		Fun_StrLen = 0
	Else
		Dim n
		n=Array(".","。",",","，","<",">","《","》","/","?","？","|","、","\","""","”","“",";","；",":","：","{","}","【","】","[","]","!","！","@","#","￥","$","%","^","……","&","*","（","）","(",")","-","_","=","——","+","…")
		a = Ubound(n)
		For i=0 to a
		str = Replace(str,n(i),"")
		next
		n = len(str)
		Fun_StrLen = n
	End If
End Function

'目的 关键词高亮显示 
Function Fun_StrGL(a,b)
    Dim regEx
    Set regEx = New RegExp
        regEx.IgnoreCase = True
        regEx.Global = True
    regEx.Pattern = "(" & b & ")"
    Fun_StrGL = regEx.Replace(a,"<span style='color:"&New_color&"'>$1</span>")
End Function

Function ReplaceExp(strHTML,a,b) 
Set re = New RegExp
    re.Pattern = a&"([\s\S]*?)"&b
    re.IgnoreCase = True
    re.Global = True
    re.MultiLine = True
    Set colMatches = re.Execute(strHTML)
    For Each m In colMatches
	strHTML=m.SubMatches(0)
    Next
	set colMatches=nothing
	ReplaceExp=strHTML
End Function

'目的 过滤HTML标签 
Function Fun_HTML(strHTML,strLen) 
 Dim objRegExp, Match, Matches 
 Set objRegExp = New Regexp 
 objRegExp.IgnoreCase = True 
 objRegExp.Global = True 
 objRegExp.Pattern = "<.+?>" 
 Set Matches = objRegExp.Execute(strHTML) 
 For Each Match in Matches 
 strHtml=Replace(strHTML,Match.Value,"")
 Next 
 Set objRegExp = Nothing 
 if(len(strHTML)>strLen) AND strLen <>0 then Fun_HTML = left(strHTML,strLen) else Fun_HTML=strHTML
 If instr(Fun_HTML,"{new:page}")>0 Then Fun_HTML=Replace(Fun_HTML,"{new:page}","")
 If Instr(Fun_HTML,"&nbsp;")>0 Then Fun_HTML=Replace(Fun_HTML,"&nbsp;","")
 Fun_HTML=Replace(Replace(Replace(Replace(Fun_HTML,Chr(8),""),Chr(9),""),Chr(10),""),Chr(13),"")
End Function


Function Fun_jmail(t1,t2,t3,t4)
On Error Resume Next
dim jmail,sendok
set jmail=server.createobject("Jmail.message")
jmail.silent=True
jmail.charset="UTF-8"
jmail.ContentType = "text/html"
jmail.from=Str_Mail'发件人邮箱
jmail.fromname=Str_Name'发件人名称
jmail.AddRecipient t1'收件人邮箱
jmail.Priority=t4'邮件的紧急程度，1最快，5最慢
jmail.subject=t3'发送邮件标题
JMail.ReplyTo=Str_Read'指定别的回信地址 
JMail.HTMLBody = "<html><head><meta http-equiv=""Content-Type"" content=""text/html; charset=UTF-8""></head><body>"&t2&"</body></html>"
jmail.mailserverusername=""&Str_User&""       '邮件发送服务器登录名称
jmail.mailserverpassword=""&Str_Pass&""       '邮件发送服务器登录密码
sendok=jmail.send(""&Str_SMTP&"")         'smtp服务器名称
if sendok then Fun_jmail=True ELSE Fun_jmail=False
jmail.Close
set jmail=nothing
End Function

'目的 生成缩略图
Function sjpeg(fileUrl,str)
On Error Resume Next
If Pic_SltSy=0 Then yjpeg(fileUrl)
If Pic_Gif=0 AND Instr(fileUrl,".gif")>0 OR Pic_Png=0 AND Instr(fileUrl,".png")>0 Then sjpeg=fileUrl:Exit Function
dim Jpeg
Set Jpeg = Server.CreateObject("Persits.Jpeg")
If Err.number<>0 Then sjpeg=fileUrl:Exit Function
		Jpeg.Open Server.MapPath(fileUrl)
		Jpeg.Quality = Pic_Ok
		If Jpeg.Width=<Pic_Width AND Jpeg.Height<=Pic_Height Then sjpeg=fileUrl:Exit Function
If (Pic_Make=0 AND Pic_Height>0 AND Pic_ON=0) Or (Pic_Make=0 AND Pic_Width>0 AND Pic_ON=0) Then 		
		Jpeg.Width = Pic_Width
		Jpeg.Height = Pic_Height
		'Jpeg.Sharpen 1,130 
ElseIf (Pic_Make=1 AND Pic_Height>0 AND Pic_ON=0) Or (Pic_Make=1 AND Pic_Width>0 AND Pic_ON=0) Then 
		jpeg.PreserveAspectRatio = True
		if jpeg.OriginalWidth/jpeg.OriginalHeight > Pic_Width/Pic_Height then'太扁了，要剪掉左右部分 
		jpeg.Height = Pic_Height
		jpeg.crop CInt((jpeg.Width-Pic_Width)/2),0,CInt((jpeg.Width-Pic_Width)/2)+Pic_Width,Pic_Height
		else
		jpeg.Width = Pic_Width 
		jpeg.crop 0,CInt((jpeg.Height-Pic_Height)/2),Pic_Width,CInt((jpeg.Height-Pic_Height)/2)+Pic_Height 
		end if 
End If

		If str=0 Then fileUrl=split(fileUrl,".")(0)&"s."&split(fileUrl,".")(1)
		Jpeg.Save Server.MapPath(fileUrl) 
		Set Jpeg=Nothing
		sjpeg=fileUrl 
End Function

Function yjpeg(fileUrl)
On Error Resume Next
If Pic_Gif=0 AND Instr(fileUrl,".gif")>0 OR Pic_Png=0 AND Instr(fileUrl,".png")>0 Then yjpeg=fileUrl:Exit Function
	Dim Jpeg
	Set Jpeg=Server.CreateObject("Persits.Jpeg")
	If Err.number<>0 Then yjpeg=fileUrl:Exit Function
	Jpeg.Open Server.MapPath(fileUrl)
If Pin_Sy=0 AND Pic_Type=0 Then	 
	Jpeg.Canvas.Font.Color = Replace(Pic_color,"#","&H") ''''//水印字体颜色
	Jpeg.Canvas.Font.Family = Pic_Word ''''//水印字体
	Jpeg.Canvas.Font.Size = Pic_Size ''''//水印字体大小
	'Jpeg.Canvas.Font.Bold = True   ''''//是否粗体，粗体用：True
	'Jpeg.Canvas.Font.BkMode = &111 ''''//字体背景颜色
	select case Pic_Imgtype
		case 1 Jpeg.Canvas.Print Pic_X+5 , Pic_Y+5, Pic_Info '顶部居左
		case 2 Jpeg.Canvas.Print Jpeg.width-70-Pic_X , Pic_Y+5, Pic_Info '顶部居右
		case 3 Jpeg.Canvas.Print Pic_X+10 , (Jpeg.height-20-Pic_X), Pic_Info '底部居左
		case 4 Jpeg.Canvas.Print (Jpeg.width-70-Pic_X), (Jpeg.height-20-Pic_X), Pic_Info '底部居右
		case else Jpeg.Canvas.Print Pic_X+5 , Pic_Y+5, Pic_Info '顶部居左
	end select
ElseIf Pin_Sy=0 AND Pic_Type=1 Then
	Dim logo
	Set Logo = Server.CreateObject("Persits.Jpeg")
	Logo.Open Server.MapPath(Pic_Link) 
	Jpeg.Canvas.Pen.Width  = 0    
	Jpeg.Canvas.Brush.Solid = False
	If Jpeg.width=<Logo.Width OR Jpeg.height=<Logo.Height Then Exit Function
	select case Pic_Imgtype
		case 1 Jpeg.DrawImage Pic_X+5 , Pic_Y+5, Logo, Pic_Num '顶部居左
		case 2 Jpeg.DrawImage (Jpeg.width-Logo.Width-5-Pic_X), Pic_Y+5, Logo, Pic_Num '顶部居右
		case 3 Jpeg.DrawImage Pic_X+5 , (Jpeg.height-Logo.Height-5-Pic_X), Logo, Pic_Num '底部居左
		case 4 Jpeg.DrawImage (Jpeg.width-Logo.Width-5-Pic_X), (Jpeg.height-Logo.Height-5-Pic_X), Logo,Pic_Num'底部居右
		case else Jpeg.DrawImage Pic_X+5 , Pic_Y+5, Logo, Pic_Num '顶部居左 
	end select
	Set logo = Nothing 
End If
	Jpeg.Save Server.MapPath(fileUrl)
	Set Jpeg = Nothing 
	yjpeg=fileUrl
End Function

'目的 评论人等级
Function Fun_StrVip(a)
	if a=> 1 and a=<3 then '3
	Fun_StrVip = "列兵"
	elseif a=>4 and a=<6  then '3
	Fun_StrVip = "上等兵"
	elseif a=>7 and a=<9  then '3
	Fun_StrVip = "下士"
	elseif a=>10 and a=<12  then '3
	Fun_StrVip = "中士"
	elseif a=>13 and a=<15  then '3
	Fun_StrVip = "上士"
	elseif a=>16 and a=<18  then '3
	Fun_StrVip = "四级军士长"
	elseif a=>19 and a=<21  then '3
	Fun_StrVip = "三级军士长"
	elseif a=>22 and a=<24  then '3
	Fun_StrVip = "二级军士长"
	elseif a=>25 and a=<27  then '3
	Fun_StrVip = "一级军士长"
	elseif a=>28 and a=<30  then '3
	Fun_StrVip = "少尉"
	elseif a=>31 and a=<33  then '3
	Fun_StrVip = "中尉"
	elseif a=>34 and a=<36  then '3
	Fun_StrVip = "上尉"
	elseif a=>37 and a=<40  then '4
	Fun_StrVip = "少校"
	elseif a=>41 and a=<44  then '4
	Fun_StrVip = "中校"
	elseif a=>45 and a=<48  then '4
	Fun_StrVip = "上校"
	elseif a=>49 and a=<52  then '4
	Fun_StrVip = "大校"
	elseif a=>53 and a=<58  then '6
	Fun_StrVip = "少将"
	elseif a=>59 and a=<66  then '8
	Fun_StrVip = "中将"
	elseif a=>67 and a=<99  then '
	Fun_StrVip = "上将"
	else
	Fun_StrVip = "特种部队"
	end if
End Function

'目的 客户端检测
Function Fun_StrKhd(a)
	On Error Resume Next
	dim khd,strArr
	a = Lcase(a)
	Fun_StrKhd = "未知设备"
	If Not Fun_Null(New_khd) Then
	strArr=split(New_khd,"<br>")
	for i = 0 to ubound(strArr)
	khd=split(strArr(i),",")
	if instr(a,khd(0))>0 then Fun_StrKhd=khd(1)
	next
	End If
End Function

'目的 转换日期格式
Function Fun_Date(a,b)
dim TimeDifference
	Select Case  ucase(b)
		case "月日"
			Fun_Date=right(100+month(a),2) & "月" & right(100+day(a),2) & "日"
		case "月日长时间"
			Fun_Date=right(100+month(a),2) & "月" & right(100+day(a),2) & "日" & " " & formatdatetime(a,3)
		case "月日短时间"
			Fun_Date=right(100+month(a),2) & "月" & right(100+day(a),2) & "日" & " " & formatdatetime(a,4)
		case "年月日" 
			Fun_Date=year(a) & "年" & right(100+month(a),2) & "月" & right(100+day(a),2) & "日"
		case "年月日长时间" 
			Fun_Date=formatdatetime(a,1) & " " & formatdatetime(a,3)
		case "年月日短时间"
			Fun_Date=formatdatetime(a,1) & " " & formatdatetime(a,4)
		case "年月日长时间" 
			Fun_Date=formatdatetime(a,1) & " " & formatdatetime(a,3)
		case "年月日短时间"
			Fun_Date=formatdatetime(a,1) & " " & formatdatetime(a,4)
		case "星期"
			Fun_Date=WeekdayName(WeekDay(a))
		case "Y-M-D" 
			Fun_Date=formatdatetime(a,2)
		case "Y-M-D-TIME" 
			Fun_Date=formatdatetime(a,2) & formatdatetime(a,3)
		case "Y-M-D-LENTIME" 
			Fun_Date=formatdatetime(a,2) & formatdatetime(a,4)
		case "M-D" 
			Fun_Date=Month(a) & Day(a)
		case "M-D-TIME" 
			Fun_Date=Month(a)&Day(a) & formatdatetime(a,3)
		case "M-D-LENTIME" 
			Fun_Date=Month(a)&Day(a) & formatdatetime(a,4)
		case "博客日期格式"
			TimeDifference = DateDiff("s", a, Now)
			If TimeDifference <60 then  
			Fun_Date=("刚刚")
			Elseif TimeDifference <60*60 then  
			Fun_Date=(TimeDifference\60 & " 分钟前")  
			Elseif TimeDifference <60*60*24 then  
			Fun_Date=(TimeDifference\(60*60) & "小时前") & " " & formatdatetime(a,4)
			elseif datediff("d",a,date)=0 then
			Fun_Date="今天 " &formatdatetime(a,4)
			elseif datediff("d",a,date)=1 then
			Fun_Date="昨天 " &formatdatetime(a,4)
			elseif datediff("d",a,date)=2 then
			Fun_Date="前天 " &formatdatetime(a,4)
			elseif TimeDifference <7*60*60*24 then  
			Fun_Date=(TimeDifference\(60*60*24) & " " & "天前") & " " & formatdatetime(a,4)
			elseif year(date)=year(a) then
			Fun_Date=month(a) & "月" & day(a) & "日" & " " & formatdatetime(a,4)
			else
			Fun_Date=formatdatetime(a,2) & " " & formatdatetime(a,4)
			end if
		case else Fun_Date=a
	End Select
End Function


Function Fun_Test(patrn, strng)   
    Dim regEx, retVal ' 建立变量。   
    Set regEx = New RegExp ' 建立正则表达式。   
    regEx.Pattern = patrn ' 设置模式。   
    regEx.IgnoreCase = False ' 设置是否区分大小写。   
    retVal = regEx.Test(strng) ' 执行搜索测试。   
    If retVal Then   
        Fun_Test = True  
    Else   
        Fun_Test = False  
    End If   
End Function
Function NewCmsMD5():NewCmsMD5=MD5(NewCms()):End Function
'目的 计算2个日期相差年月日
Function Fun_JSDate(DATE1,DATE2)
	Dim a,b,c,e
	a = YEAR(DATE1)-YEAR(DATE2):b = Month(DATE1) - Month(DATE2):c = DAY(DATE1) - DAY(DATE2)
	If a < 0 then:Fun_JSDate="Error":Exit Function:Else:If c < 0 then:b = b - 1:e = DateAdd("m",-1,date()):c = DateDiff("d",e,date()) + c:end if:If b < 0 then:a = a - 1:b = 12 + b:c = c:End if:End If
	If a = 0 And B = 0 And C = 0 Then
		Fun_JSDate = "New Cms"
		ElseIF a = 0 And b = 0 Then
		Fun_JSDate = c & " 天"
		ElseIF A = 0 AND C = 0 Then
		Fun_JSDate = B & " 个月"
		ElseIF B = 0 AND C = 0 Then
		Fun_JSDate = A & " 周年"
		Elseif a = 0 Then
		Fun_JSDate = b & "月" & c & "天"
		ElseIF b = 0 Then
		Fun_JSDate = a & "年" & c & "天"
		ElseIF c = 0 Then
		Fun_JSDate = a & "年" & b & "月" 
		Else
		Fun_JSDate = a & "年" & b & "月" & c & "天"
	End If
End Function

'目的 转换成GMT时间
Function Fun_GMT(a)
	'On Error Resume Next
	'IF Instr(Request.cookies("[New_GMT]"),"GMT") = 0 OR datediff("s",cdate(Request.cookies("[NEW_TIME]")),NOW())>10 Then
	a=a-0.333333333333333
	Dim strZero,strZone,dWeek,dMonth
	dWeek=Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat")
	dMonth=Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
	Fun_GMT=dWeek(WeekDay(a)-1)&", "&DAY(a)&" "&dMonth(Month(a)-1)&" "&YEAR(a)&" "&formatdatetime(a,3)&" GMT"
	'Response.Cookies("[NEW_GMT]")=Fun_GMT
	'Response.Cookies("[NEW_TIME]")=DateAdd("n",New_Cache,now())
	'Response.Cookies(a).Expires=DateAdd("n",New_Cache,now())
	'Else
	'Response.Status="304 Not Modified" 
	'Fun_GMT=Request.cookies("[New_GMT]")
	'End if
End Function

'*******************************************************************************************
'目的 获取农历日期
Function Fun_CNDate()
	dim WeekName(7),MonthAdd(11),NongliData(99),TianGan(9),DiZhi(11),ShuXiang(11),DayName(30),MonName(12)
	dim curTime,curYear,curMonth,curDay,curWeekday
	dim GongliStr,WeekdayStr,NongliStr,NongliDayStr
	dim m, n, k, isEnd, bit, TheDate,i
	'星期名
	WeekName(0)="*":WeekName(1)="星期日":WeekName(2)="星期一":WeekName(3)="星期二":WeekName(4)="星期三":WeekName(5)="星期四":WeekName(6)="星期五":WeekName(7)="星期六"
	'天干名称
	TianGan(0)="甲":TianGan(1)="乙":TianGan(2)="丙":TianGan(3)="丁":TianGan(4)="戊":TianGan(5)="己":TianGan(6)="庚":TianGan(7)="辛":TianGan(8)="壬":TianGan(9)="癸"
	'地支名称
	DiZhi(0)="子":DiZhi(1)="丑":DiZhi(2)="寅":DiZhi(3)="卯":DiZhi(4)="辰":DiZhi(5)="巳":DiZhi(6)="午":DiZhi(7)="未":DiZhi(8)="申":DiZhi(9)="酉":DiZhi(10)="戌":DiZhi(11)="亥"
	'属相名称
	ShuXiang(0) = "鼠"
	ShuXiang(1) = "牛"
	ShuXiang(2) = "虎"
	ShuXiang(3) = "兔"
	ShuXiang(4) = "龙"
	ShuXiang(5) = "蛇"
	ShuXiang(6) = "马"
	ShuXiang(7) = "羊"
	ShuXiang(8) = "猴"
	ShuXiang(9) = "鸡"
	ShuXiang(10) = "狗"
	ShuXiang(11) = "猪"
	'农历日期名
	DayName(0) = "*"
	DayName(1) = "初一"
	DayName(2) = "初二"
	DayName(3) = "初三"
	DayName(4) = "初四"
	DayName(5) = "初五"
	DayName(6) = "初六"
	DayName(7) = "初七"
	DayName(8) = "初八"
	DayName(9) = "初九"
	DayName(10) = "初十"
	DayName(11) = "十一"
	DayName(12) = "十二"
	DayName(13) = "十三"
	DayName(14) = "十四"
	DayName(15) = "十五"
	DayName(16) = "十六"
	DayName(17) = "十七"
	DayName(18) = "十八"
	DayName(19) = "十九"
	DayName(20) = "二十"
	DayName(21) = "廿一"
	DayName(22) = "廿二"
	DayName(23) = "廿三"
	DayName(24) = "廿四"
	DayName(25) = "廿五"
	DayName(26) = "廿六"
	DayName(27) = "廿七"
	DayName(28) = "廿八"
	DayName(29) = "廿九"
	DayName(30) = "三十"
	'农历月份名
	MonName(0) = "*"
	MonName(1) = "正"
	MonName(2) = "二"
	MonName(3) = "三"
	MonName(4) = "四"
	MonName(5) = "五"
	MonName(6) = "六"
	MonName(7) = "七"
	MonName(8) = "八"
	MonName(9) = "九"
	MonName(10) = "十"
	MonName(11) = "十一"
	MonName(12) = "腊"
	'公历每月前面的天数
	MonthAdd(0) = 0
	MonthAdd(1) = 31
	MonthAdd(2) = 59
	MonthAdd(3) = 90
	MonthAdd(4) = 120
	MonthAdd(5) = 151
	MonthAdd(6) = 181
	MonthAdd(7) = 212
	MonthAdd(8) = 243
	MonthAdd(9) = 273
	MonthAdd(10) = 304
	MonthAdd(11) = 334
	'农历数据
	NongliData(0) = 2635
	NongliData(1) = 333387
	NongliData(2) = 1701
	NongliData(3) = 1748
	NongliData(4) = 267701
	NongliData(5) = 694
	NongliData(6) = 2391
	NongliData(7) = 133423
	NongliData(8) = 1175
	NongliData(9) = 396438
	NongliData(10) = 3402
	NongliData(11) = 3749
	NongliData(12) = 331177
	NongliData(13) = 1453
	NongliData(14) = 694
	NongliData(15) = 201326
	NongliData(16) = 2350
	NongliData(17) = 465197
	NongliData(18) = 3221
	NongliData(19) = 3402
	NongliData(20) = 400202
	NongliData(21) = 2901
	NongliData(22) = 1386
	NongliData(23) = 267611
	NongliData(24) = 605
	NongliData(25) = 2349
	NongliData(26) = 137515
	NongliData(27) = 2709
	NongliData(28) = 464533
	NongliData(29) = 1738
	NongliData(30) = 2901
	NongliData(31) = 330421
	NongliData(32) = 1242
	NongliData(33) = 2651
	NongliData(34) = 199255
	NongliData(35) = 1323
	NongliData(36) = 529706
	NongliData(37) = 3733
	NongliData(38) = 1706
	NongliData(39) = 398762
	NongliData(40) = 2741
	NongliData(41) = 1206
	NongliData(42) = 267438
	NongliData(43) = 2647
	NongliData(44) = 1318
	NongliData(45) = 204070
	NongliData(46) = 3477
	NongliData(47) = 461653
	NongliData(48) = 1386
	NongliData(49) = 2413
	NongliData(50) = 330077
	NongliData(51) = 1197
	NongliData(52) = 2637
	NongliData(53) = 268877
	NongliData(54) = 3365
	NongliData(55) = 531109
	NongliData(56) = 2900
	NongliData(57) = 2922
	NongliData(58) = 398042
	NongliData(59) = 2395
	NongliData(60) = 1179
	NongliData(61) = 267415
	NongliData(62) = 2635
	NongliData(63) = 661067
	NongliData(64) = 1701
	NongliData(65) = 1748
	NongliData(66) = 398772
	NongliData(67) = 2742
	NongliData(68) = 2391
	NongliData(69) = 330031
	NongliData(70) = 1175
	NongliData(71) = 1611
	NongliData(72) = 200010
	NongliData(73) = 3749
	NongliData(74) = 527717
	NongliData(75) = 1452
	NongliData(76) = 2742
	NongliData(77) = 332397
	NongliData(78) = 2350
	NongliData(79) = 3222
	NongliData(80) = 268949
	NongliData(81) = 3402
	NongliData(82) = 3493
	NongliData(83) = 133973
	NongliData(84) = 1386
	NongliData(85) = 464219
	NongliData(86) = 605
	NongliData(87) = 2349
	NongliData(88) = 334123
	NongliData(89) = 2709
	NongliData(90) = 2890
	NongliData(91) = 267946
	NongliData(92) = 2773
	NongliData(93) = 592565
	NongliData(94) = 1210
	NongliData(95) = 2651
	NongliData(96) = 395863
	NongliData(97) = 1323
	NongliData(98) = 2707
	NongliData(99) = 265877
	'获取当前系统时间
	curTime = Now():curYear = Year(curTime):curMonth = Month(curTime):curDay = Day(curTime):GongliStr = curYear&"年"
	'生成当前公历年、月、日 ==> GongliStr
	If (curMonth < 10) Then GongliStr =GongliStr&"0"&curMonth&"月" Else GongliStr =GongliStr&curMonth&"月" End If
	If (curDay < 10) Then GongliStr =GongliStr&"0"&curDay&"日" Else GongliStr =GongliStr&curDay&"日" End If
	'生成当前公历星期 ==> WeekdayStr
	curWeekday = Weekday(curTime):WeekdayStr = WeekName(curWeekday)
	'计算到初始时间1921年2月8日的天数：1921-2-8(正月初一)
	TheDate = (curYear - 1921) * 365 + Int((curYear - 1921) / 4) +curDay + MonthAdd(curMonth - 1) - 38
	If ((curYear Mod 4) = 0 AND curMonth > 2) Then TheDate = TheDate + 1 End If
	'计算农历天干、地支、月、日
	isEnd = 0:m = 0
	Do
	If (NongliData(m) < 4095) Then k = 11 Else k = 12 End if:n = k
	Do
	If (n < 0) Then
	Exit Do
	End If
	'获取NongliData(m)的第n个二进制位的值
	bit = NongliData(m)
	For i = 1 To n Step 1
	bit = Int(bit / 2)
	Next
	bit = bit Mod 2
	If (TheDate <= 29 + bit) Then
	isEnd = 1
	Exit Do
	End If
	TheDate = TheDate - 29 - bit
	n = n - 1
	Loop
	If (isEnd = 1) Then
	Exit Do
	End If
	m = m + 1
	Loop
	curYear = 1921 + m
	curMonth = k - n + 1
	curDay = TheDate
	If (k = 12) Then
	If (curMonth = (Int(NongliData(m) / 65536) + 1)) Then
	curMonth = 1 - curMonth
	ElseIf (curMonth > (Int(NongliData(m) / 65536) + 1))Then
	curMonth = curMonth - 1
	End if
	End If
	'生成农历天干、地支、属相 ==> NongliStr
	NongliStr =TianGan(((curYear - 4) Mod 60) Mod 10) & DiZhi(((curYear - 4) Mod 60) Mod 12)
	NongliStr =NongliStr&"("&ShuXiang(((curYear -4) Mod 60) Mod 12)&")"
	'生成农历月、日 ==> NongliDayStr
	If (curMonth < 1) Then NongliDayStr = "闰"&MonName(-1 * curMonth) Else NongliDayStr = MonName(curMonth) End If
	NongliDayStr = NongliDayStr&"月":NongliDayStr = "年 " & NongliDayStr&DayName(curDay):Fun_CNDate = NongliStr & NongliDayStr
End Function 
'*******************************************************************************************


'*******************************************************************************************
'目的 输入日历
'返回 日历HTML
Function Fun_RL(Byval A)
Dim iYear,iMonth,iCCC,iBBB,OneDate,TowDate,MonthStr,MonthEnd,iTian,AccStr,i,str,p,ii
A=A:iYear=year(A):iMonth=month(A):iCCC=Fun_CNDate()
iBBB="<a href='"&GetNav(SEO_date,iYear&right("00"&iMonth,2),"","","",SEO_bak,temtype)&"' title='查看本月所有文章'>"&iYear &" 年 " &iMonth& " 月</a>"
str=str&"<div  class='left'>"&iCCC&"</div><div class='right'>"&iBBB&"</div>"
str=str&"<table id='tc_calendar'>"
str=str&"<tr id='tc_week'><td>日</td><td>一</td><td>二</td><td>三</td><td>四</td><td>五</td><td>六</td></tr><tr class='even'>"
OneDate = FormatDateTime(month(A) & "/1/" &  year(A))  
TowDate = FormatDateTime(DateAdd("m",1,onedate))
MonthStr=weekday(onedate)-1  '获得要显示月份的第一天为周几 
MonthEnd=DateDiff("d",OneDate,TowDate)  '获得要显示的1日至下个月的1日一共相差几天(月份一共有多少天) 
IF MonthStr+MonthEnd<35 THEN iTian=35 ELSE iTian=42 END IF
i=1 
for ii=i to iTian
AccStr=i-MonthStr 
if i>MonthStr and i<=MonthEnd+MonthStr then 
exe.StrRS "select top 1 Id from {Acc}Read where Display=0 And day(addtime)="&AccStr&" and month(addtime)="&iMonth&" and year(addtime)="&iYear&"","exe"
if AccStr=Day(now) and month(now)=iMonth and year(now)=iYear then p=" id='current'" Else p=""
IF exe.RS.eof Then 
str=str&"<td"&p&">"&AccStr&"</td> " 
else 
str=str&"<td"&p&"><a href='"&GetNav(SEO_date,iYear&right("00"&iMonth,2)&right("00"&AccStr,2),"","","",SEO_bak,temtype)&"'>"&AccStr&"</a></td>" 
end if
exe.OverRS()
else
str=str&"<td></td>" 
end if
if i mod 7=0 then str=str&"</tr><tr class='even'>" end if 
i=i+1 
next
str=str&"</table>"
Fun_RL=str
End Function
'*******************************************************************************************


'*******************************************************************************************
'目的 内容MD5加密
'返回 输出MD5
private const bits_to_a_byte = 8 
private const bytes_to_a_word = 4 
private const bits_to_a_word = 32 
private m_lonbits(30) 
private m_l2power(30) 

private function lshift(lvalue, ishiftbits) 
if ishiftbits = 0 then 
lshift = lvalue 
exit function 
elseif ishiftbits = 31 then 
if lvalue and 1 then 
lshift = &h80000000 
else 
lshift = 0 
end if 
exit function 
elseif ishiftbits < 0 or ishiftbits > 31 then 
err.raise 6 
end if 

if (lvalue and m_l2power(31 - ishiftbits)) then 
lshift = ((lvalue and m_lonbits(31 - (ishiftbits + 1))) * m_l2power(ishiftbits)) or &h80000000 
else 
lshift = ((lvalue and m_lonbits(31 - ishiftbits)) * m_l2power(ishiftbits)) 
end if 
end function 

private function rshift(lvalue, ishiftbits) 
if ishiftbits = 0 then 
rshift = lvalue 
exit function 
elseif ishiftbits = 31 then 
if lvalue and &h80000000 then 
rshift = 1 
else 
rshift = 0 
end if 
exit function 
elseif ishiftbits < 0 or ishiftbits > 31 then 
err.raise 6 
end if 

rshift = (lvalue and &h7ffffffe) \ m_l2power(ishiftbits) 

if (lvalue and &h80000000) then 
rshift = (rshift or (&h40000000 \ m_l2power(ishiftbits - 1))) 
end if 
end function 
Function md5Err()
md5Err="B"&4010779&"E652064CC"&9935063&"BB973465"
End Function
private function rotateleft(lvalue, ishiftbits) 
rotateleft = lshift(lvalue, ishiftbits) or rshift(lvalue, (32 - ishiftbits)) 
end function 


private function addunsigned(lx, ly) 
dim lx4 
dim ly4 
dim lx8 
dim ly8 
dim lresult 

lx8 = lx and &h80000000 
ly8 = ly and &h80000000 
lx4 = lx and &h40000000 
ly4 = ly and &h40000000 

lresult = (lx and &h3fffffff) + (ly and &h3fffffff) 

if lx4 and ly4 then 
lresult = lresult xor &h80000000 xor lx8 xor ly8 
elseif lx4 or ly4 then 
if lresult and &h40000000 then 
lresult = lresult xor &hc0000000 xor lx8 xor ly8 
else 
lresult = lresult xor &h40000000 xor lx8 xor ly8 
end if 
else 
lresult = lresult xor lx8 xor ly8 
end if 

addunsigned = lresult 
end function 

private function md5_f(x, y, z) 
md5_f = (x and y) or ((not x) and z) 
end function 

private function md5_g(x, y, z) 
md5_g = (x and z) or (y and (not z)) 
end function 

private function md5_h(x, y, z) 
md5_h = (x xor y xor z) 
end function 

private function md5_i(x, y, z) 
md5_i = (y xor (x or (not z))) 
end function 

private sub md5_ff(a, b, c, d, x, s, ac) 
a = addunsigned(a, addunsigned(addunsigned(md5_f(b, c, d), x), ac)) 
a = rotateleft(a, s) 
a = addunsigned(a, b) 
end sub 

private sub md5_gg(a, b, c, d, x, s, ac) 
a = addunsigned(a, addunsigned(addunsigned(md5_g(b, c, d), x), ac)) 
a = rotateleft(a, s) 
a = addunsigned(a, b) 
end sub 

private sub md5_hh(a, b, c, d, x, s, ac) 
a = addunsigned(a, addunsigned(addunsigned(md5_h(b, c, d), x), ac)) 
a = rotateleft(a, s) 
a = addunsigned(a, b) 
end sub 

private sub md5_ii(a, b, c, d, x, s, ac) 
a = addunsigned(a, addunsigned(addunsigned(md5_i(b, c, d), x), ac)) 
a = rotateleft(a, s) 
a = addunsigned(a, b) 
end sub 

private function converttowordarray(smessage) 
dim lmessagelength 
dim lnumberofwords 
dim lwordarray() 
dim lbyteposition 
dim lbytecount 
dim lwordcount 

const modulus_bits = 512 
const congruent_bits = 448 

lmessagelength = len(smessage) 

lnumberofwords = (((lmessagelength + ((modulus_bits - congruent_bits) \ bits_to_a_byte)) \ (modulus_bits \ bits_to_a_byte)) + 1) * (modulus_bits \ bits_to_a_word) 
redim lwordarray(lnumberofwords - 1) 

lbyteposition = 0 
lbytecount = 0 
do until lbytecount >= lmessagelength 
lwordcount = lbytecount \ bytes_to_a_word 
lbyteposition = (lbytecount mod bytes_to_a_word) * bits_to_a_byte 
lwordarray(lwordcount) = lwordarray(lwordcount) or lshift(asc(mid(smessage, lbytecount + 1, 1)), lbyteposition) 
lbytecount = lbytecount + 1 
loop 

lwordcount = lbytecount \ bytes_to_a_word 
lbyteposition = (lbytecount mod bytes_to_a_word) * bits_to_a_byte 

lwordarray(lwordcount) = lwordarray(lwordcount) or lshift(&h80, lbyteposition) 

lwordarray(lnumberofwords - 2) = lshift(lmessagelength, 3) 
lwordarray(lnumberofwords - 1) = rshift(lmessagelength, 29) 

converttowordarray = lwordarray 
end function 

private function wordtohex(lvalue) 
dim lbyte 
dim lcount 

for lcount = 0 to 3 
lbyte = rshift(lvalue, lcount * bits_to_a_byte) and m_lonbits(bits_to_a_byte - 1) 
wordtohex = wordtohex & right("0" & hex(lbyte), 2) 
next 
end function 

public function md5(smessage) 
m_lonbits(0) = clng(1) 
m_lonbits(1) = clng(3) 
m_lonbits(2) = clng(7) 
m_lonbits(3) = clng(15) 
m_lonbits(4) = clng(31) 
m_lonbits(5) = clng(63) 
m_lonbits(6) = clng(127) 
m_lonbits(7) = clng(255) 
m_lonbits(8) = clng(511) 
m_lonbits(9) = clng(1023) 
m_lonbits(10) = clng(2047) 
m_lonbits(11) = clng(4095) 
m_lonbits(12) = clng(8191) 
m_lonbits(13) = clng(16383) 
m_lonbits(14) = clng(32767) 
m_lonbits(15) = clng(65535) 
m_lonbits(16) = clng(131071) 
m_lonbits(17) = clng(262143) 
m_lonbits(18) = clng(524287) 
m_lonbits(19) = clng(1048575) 
m_lonbits(20) = clng(2097151) 
m_lonbits(21) = clng(4194303) 
m_lonbits(22) = clng(8388607) 
m_lonbits(23) = clng(16777215) 
m_lonbits(24) = clng(33554431) 
m_lonbits(25) = clng(67108863) 
m_lonbits(26) = clng(134217727) 
m_lonbits(27) = clng(268435455) 
m_lonbits(28) = clng(536870911) 
m_lonbits(29) = clng(1073741823) 
m_lonbits(30) = clng(2147483647) 

m_l2power(0) = clng(1) 
m_l2power(1) = clng(2) 
m_l2power(2) = clng(4) 
m_l2power(3) = clng(8) 
m_l2power(4) = clng(16) 
m_l2power(5) = clng(32) 
m_l2power(6) = clng(64) 
m_l2power(7) = clng(128) 
m_l2power(8) = clng(256) 
m_l2power(9) = clng(512) 
m_l2power(10) = clng(1024) 
m_l2power(11) = clng(2048) 
m_l2power(12) = clng(4096) 
m_l2power(13) = clng(8192) 
m_l2power(14) = clng(16384) 
m_l2power(15) = clng(32768) 
m_l2power(16) = clng(65536) 
m_l2power(17) = clng(131072) 
m_l2power(18) = clng(262144) 
m_l2power(19) = clng(524288) 
m_l2power(20) = clng(1048576) 
m_l2power(21) = clng(2097152) 
m_l2power(22) = clng(4194304) 
m_l2power(23) = clng(8388608) 
m_l2power(24) = clng(16777216) 
m_l2power(25) = clng(33554432) 
m_l2power(26) = clng(67108864) 
m_l2power(27) = clng(134217728) 
m_l2power(28) = clng(268435456) 
m_l2power(29) = clng(536870912) 
m_l2power(30) = clng(1073741824) 

dim x 
dim k 
dim aa 
dim bb 
dim cc 
dim dd 
dim a 
dim b 
dim c 
dim d 

const s11 = 7 
const s12 = 12 
const s13 = 17 
const s14 = 22 
const s21 = 5 
const s22 = 9 
const s23 = 14 
const s24 = 20 
const s31 = 4 
const s32 = 11 
const s33 = 16 
const s34 = 23 
const s41 = 6 
const s42 = 10 
const s43 = 15 
const s44 = 21 

x = converttowordarray(smessage) 

a = &h67452301 
b = &hefcdab89 
c = &h98badcfe 
d = &h10325476 

for k = 0 to ubound(x) step 16 
aa = a 
bb = b 
cc = c 
dd = d 

md5_ff a, b, c, d, x(k + 0), s11, &hd76aa478 
md5_ff d, a, b, c, x(k + 1), s12, &he8c7b756 
md5_ff c, d, a, b, x(k + 2), s13, &h242070db 
md5_ff b, c, d, a, x(k + 3), s14, &hc1bdceee 
md5_ff a, b, c, d, x(k + 4), s11, &hf57c0faf 
md5_ff d, a, b, c, x(k + 5), s12, &h4787c62a 
md5_ff c, d, a, b, x(k + 6), s13, &ha8304613 
md5_ff b, c, d, a, x(k + 7), s14, &hfd469501 
md5_ff a, b, c, d, x(k + 8), s11, &h698098d8 
md5_ff d, a, b, c, x(k + 9), s12, &h8b44f7af 
md5_ff c, d, a, b, x(k + 10), s13, &hffff5bb1 
md5_ff b, c, d, a, x(k + 11), s14, &h895cd7be 
md5_ff a, b, c, d, x(k + 12), s11, &h6b901122 
md5_ff d, a, b, c, x(k + 13), s12, &hfd987193 
md5_ff c, d, a, b, x(k + 14), s13, &ha679438e 
md5_ff b, c, d, a, x(k + 15), s14, &h49b40821 

md5_gg a, b, c, d, x(k + 1), s21, &hf61e2562 
md5_gg d, a, b, c, x(k + 6), s22, &hc040b340 
md5_gg c, d, a, b, x(k + 11), s23, &h265e5a51 
md5_gg b, c, d, a, x(k + 0), s24, &he9b6c7aa 
md5_gg a, b, c, d, x(k + 5), s21, &hd62f105d 
md5_gg d, a, b, c, x(k + 10), s22, &h2441453 
md5_gg c, d, a, b, x(k + 15), s23, &hd8a1e681 
md5_gg b, c, d, a, x(k + 4), s24, &he7d3fbc8 
md5_gg a, b, c, d, x(k + 9), s21, &h21e1cde6 
md5_gg d, a, b, c, x(k + 14), s22, &hc33707d6 
md5_gg c, d, a, b, x(k + 3), s23, &hf4d50d87 
md5_gg b, c, d, a, x(k + 8), s24, &h455a14ed 
md5_gg a, b, c, d, x(k + 13), s21, &ha9e3e905 
md5_gg d, a, b, c, x(k + 2), s22, &hfcefa3f8 
md5_gg c, d, a, b, x(k + 7), s23, &h676f02d9 
md5_gg b, c, d, a, x(k + 12), s24, &h8d2a4c8a 

md5_hh a, b, c, d, x(k + 5), s31, &hfffa3942 
md5_hh d, a, b, c, x(k + 8), s32, &h8771f681 
md5_hh c, d, a, b, x(k + 11), s33, &h6d9d6122 
md5_hh b, c, d, a, x(k + 14), s34, &hfde5380c 
md5_hh a, b, c, d, x(k + 1), s31, &ha4beea44 
md5_hh d, a, b, c, x(k + 4), s32, &h4bdecfa9 
md5_hh c, d, a, b, x(k + 7), s33, &hf6bb4b60 
md5_hh b, c, d, a, x(k + 10), s34, &hbebfbc70 
md5_hh a, b, c, d, x(k + 13), s31, &h289b7ec6 
md5_hh d, a, b, c, x(k + 0), s32, &heaa127fa 
md5_hh c, d, a, b, x(k + 3), s33, &hd4ef3085 
md5_hh b, c, d, a, x(k + 6), s34, &h4881d05 
md5_hh a, b, c, d, x(k + 9), s31, &hd9d4d039 
md5_hh d, a, b, c, x(k + 12), s32, &he6db99e5 
md5_hh c, d, a, b, x(k + 15), s33, &h1fa27cf8 
md5_hh b, c, d, a, x(k + 2), s34, &hc4ac5665 

md5_ii a, b, c, d, x(k + 0), s41, &hf4292244 
md5_ii d, a, b, c, x(k + 7), s42, &h432aff97 
md5_ii c, d, a, b, x(k + 14), s43, &hab9423a7 
md5_ii b, c, d, a, x(k + 5), s44, &hfc93a039 
md5_ii a, b, c, d, x(k + 12), s41, &h655b59c3 
md5_ii d, a, b, c, x(k + 3), s42, &h8f0ccc92 
md5_ii c, d, a, b, x(k + 10), s43, &hffeff47d 
md5_ii b, c, d, a, x(k + 1), s44, &h85845dd1 
md5_ii a, b, c, d, x(k + 8), s41, &h6fa87e4f 
md5_ii d, a, b, c, x(k + 15), s42, &hfe2ce6e0 
md5_ii c, d, a, b, x(k + 6), s43, &ha3014314 
md5_ii b, c, d, a, x(k + 13), s44, &h4e0811a1 
md5_ii a, b, c, d, x(k + 4), s41, &hf7537e82 
md5_ii d, a, b, c, x(k + 11), s42, &hbd3af235 
md5_ii c, d, a, b, x(k + 2), s43, &h2ad7d2bb 
md5_ii b, c, d, a, x(k + 9), s44, &heb86d391 

a = addunsigned(a, aa) 
b = addunsigned(b, bb) 
c = addunsigned(c, cc) 
d = addunsigned(d, dd) 
next 

md5 = lcase(wordtohex(a) & wordtohex(b) & wordtohex(c) & wordtohex(d)) 
'md5=lcase(wordtohex(b) & wordtohex(c)) 'i crop this to fit 16byte database password :d 

md5=ucase(md5) 
end function 


public function md5_16(smessage) 
m_lonbits(0) = clng(1) 
m_lonbits(1) = clng(3) 
m_lonbits(2) = clng(7) 
m_lonbits(3) = clng(15) 
m_lonbits(4) = clng(31) 
m_lonbits(5) = clng(63) 
m_lonbits(6) = clng(127) 
m_lonbits(7) = clng(255) 
m_lonbits(8) = clng(511) 
m_lonbits(9) = clng(1023) 
m_lonbits(10) = clng(2047) 
m_lonbits(11) = clng(4095) 
m_lonbits(12) = clng(8191) 
m_lonbits(13) = clng(16383) 
m_lonbits(14) = clng(32767) 
m_lonbits(15) = clng(65535) 
m_lonbits(16) = clng(131071) 
m_lonbits(17) = clng(262143) 
m_lonbits(18) = clng(524287) 
m_lonbits(19) = clng(1048575) 
m_lonbits(20) = clng(2097151) 
m_lonbits(21) = clng(4194303) 
m_lonbits(22) = clng(8388607) 
m_lonbits(23) = clng(16777215) 
m_lonbits(24) = clng(33554431) 
m_lonbits(25) = clng(67108863) 
m_lonbits(26) = clng(134217727) 
m_lonbits(27) = clng(268435455) 
m_lonbits(28) = clng(536870911) 
m_lonbits(29) = clng(1073741823) 
m_lonbits(30) = clng(2147483647) 

m_l2power(0) = clng(1) 
m_l2power(1) = clng(2) 
m_l2power(2) = clng(4) 
m_l2power(3) = clng(8) 
m_l2power(4) = clng(16) 
m_l2power(5) = clng(32) 
m_l2power(6) = clng(64) 
m_l2power(7) = clng(128) 
m_l2power(8) = clng(256) 
m_l2power(9) = clng(512) 
m_l2power(10) = clng(1024) 
m_l2power(11) = clng(2048) 
m_l2power(12) = clng(4096) 
m_l2power(13) = clng(8192) 
m_l2power(14) = clng(16384) 
m_l2power(15) = clng(32768) 
m_l2power(16) = clng(65536) 
m_l2power(17) = clng(131072) 
m_l2power(18) = clng(262144) 
m_l2power(19) = clng(524288) 
m_l2power(20) = clng(1048576) 
m_l2power(21) = clng(2097152) 
m_l2power(22) = clng(4194304) 
m_l2power(23) = clng(8388608) 
m_l2power(24) = clng(16777216) 
m_l2power(25) = clng(33554432) 
m_l2power(26) = clng(67108864) 
m_l2power(27) = clng(134217728) 
m_l2power(28) = clng(268435456) 
m_l2power(29) = clng(536870912) 
m_l2power(30) = clng(1073741824) 

dim x 
dim k 
dim aa 
dim bb 
dim cc 
dim dd 
dim a 
dim b 
dim c 
dim d 

const s11 = 7 
const s12 = 12 
const s13 = 17 
const s14 = 22 
const s21 = 5 
const s22 = 9 
const s23 = 14 
const s24 = 20 
const s31 = 4 
const s32 = 11 
const s33 = 16 
const s34 = 23 
const s41 = 6 
const s42 = 10 
const s43 = 15 
const s44 = 21 

x = converttowordarray(smessage) 

a = &h67452301 
b = &hefcdab89 
c = &h98badcfe 
d = &h10325476 

for k = 0 to ubound(x) step 16 
aa = a 
bb = b 
cc = c 
dd = d 

md5_ff a, b, c, d, x(k + 0), s11, &hd76aa478 
md5_ff d, a, b, c, x(k + 1), s12, &he8c7b756 
md5_ff c, d, a, b, x(k + 2), s13, &h242070db 
md5_ff b, c, d, a, x(k + 3), s14, &hc1bdceee 
md5_ff a, b, c, d, x(k + 4), s11, &hf57c0faf 
md5_ff d, a, b, c, x(k + 5), s12, &h4787c62a 
md5_ff c, d, a, b, x(k + 6), s13, &ha8304613 
md5_ff b, c, d, a, x(k + 7), s14, &hfd469501 
md5_ff a, b, c, d, x(k + 8), s11, &h698098d8 
md5_ff d, a, b, c, x(k + 9), s12, &h8b44f7af 
md5_ff c, d, a, b, x(k + 10), s13, &hffff5bb1 
md5_ff b, c, d, a, x(k + 11), s14, &h895cd7be 
md5_ff a, b, c, d, x(k + 12), s11, &h6b901122 
md5_ff d, a, b, c, x(k + 13), s12, &hfd987193 
md5_ff c, d, a, b, x(k + 14), s13, &ha679438e 
md5_ff b, c, d, a, x(k + 15), s14, &h49b40821 

md5_gg a, b, c, d, x(k + 1), s21, &hf61e2562 
md5_gg d, a, b, c, x(k + 6), s22, &hc040b340 
md5_gg c, d, a, b, x(k + 11), s23, &h265e5a51 
md5_gg b, c, d, a, x(k + 0), s24, &he9b6c7aa 
md5_gg a, b, c, d, x(k + 5), s21, &hd62f105d 
md5_gg d, a, b, c, x(k + 10), s22, &h2441453 
md5_gg c, d, a, b, x(k + 15), s23, &hd8a1e681 
md5_gg b, c, d, a, x(k + 4), s24, &he7d3fbc8 
md5_gg a, b, c, d, x(k + 9), s21, &h21e1cde6 
md5_gg d, a, b, c, x(k + 14), s22, &hc33707d6 
md5_gg c, d, a, b, x(k + 3), s23, &hf4d50d87 
md5_gg b, c, d, a, x(k + 8), s24, &h455a14ed 
md5_gg a, b, c, d, x(k + 13), s21, &ha9e3e905 
md5_gg d, a, b, c, x(k + 2), s22, &hfcefa3f8 
md5_gg c, d, a, b, x(k + 7), s23, &h676f02d9 
md5_gg b, c, d, a, x(k + 12), s24, &h8d2a4c8a 

md5_hh a, b, c, d, x(k + 5), s31, &hfffa3942 
md5_hh d, a, b, c, x(k + 8), s32, &h8771f681 
md5_hh c, d, a, b, x(k + 11), s33, &h6d9d6122 
md5_hh b, c, d, a, x(k + 14), s34, &hfde5380c 
md5_hh a, b, c, d, x(k + 1), s31, &ha4beea44 
md5_hh d, a, b, c, x(k + 4), s32, &h4bdecfa9 
md5_hh c, d, a, b, x(k + 7), s33, &hf6bb4b60 
md5_hh b, c, d, a, x(k + 10), s34, &hbebfbc70 
md5_hh a, b, c, d, x(k + 13), s31, &h289b7ec6 
md5_hh d, a, b, c, x(k + 0), s32, &heaa127fa 
md5_hh c, d, a, b, x(k + 3), s33, &hd4ef3085 
md5_hh b, c, d, a, x(k + 6), s34, &h4881d05 
md5_hh a, b, c, d, x(k + 9), s31, &hd9d4d039 
md5_hh d, a, b, c, x(k + 12), s32, &he6db99e5 
md5_hh c, d, a, b, x(k + 15), s33, &h1fa27cf8 
md5_hh b, c, d, a, x(k + 2), s34, &hc4ac5665 

md5_ii a, b, c, d, x(k + 0), s41, &hf4292244 
md5_ii d, a, b, c, x(k + 7), s42, &h432aff97 
md5_ii c, d, a, b, x(k + 14), s43, &hab9423a7 
md5_ii b, c, d, a, x(k + 5), s44, &hfc93a039 
md5_ii a, b, c, d, x(k + 12), s41, &h655b59c3 
md5_ii d, a, b, c, x(k + 3), s42, &h8f0ccc92 
md5_ii c, d, a, b, x(k + 10), s43, &hffeff47d 
md5_ii b, c, d, a, x(k + 1), s44, &h85845dd1 
md5_ii a, b, c, d, x(k + 8), s41, &h6fa87e4f 
md5_ii d, a, b, c, x(k + 15), s42, &hfe2ce6e0 
md5_ii c, d, a, b, x(k + 6), s43, &ha3014314 
md5_ii b, c, d, a, x(k + 13), s44, &h4e0811a1 
md5_ii a, b, c, d, x(k + 4), s41, &hf7537e82 
md5_ii d, a, b, c, x(k + 11), s42, &hbd3af235 
md5_ii c, d, a, b, x(k + 2), s43, &h2ad7d2bb 
md5_ii b, c, d, a, x(k + 9), s44, &heb86d391 

a = addunsigned(a, aa) 
b = addunsigned(b, bb) 
c = addunsigned(c, cc) 
d = addunsigned(d, dd) 
next 

'md5 = lcase(wordtohex(a) & wordtohex(b) & wordtohex(c) & wordtohex(d)) 
md5_16=lcase(wordtohex(b) & wordtohex(c)) 'i crop this to fit 16byte database password :d 

md5_16=ucase(md5_16) 
end function
'*******************************************************************************************


'//获得上级所有栏目ID
function NavRoot(a)
Dim RS2
SET RS2=server.CreateObject(New_RS_NAME)
RS2.open("SELECT property FROM "&New_NewAcc&"Nav where id="&a),exe.Conn,3,3
If NOT RS2.EOF THEN 
NavRoot=RS2(0)&","&NavRoot(RS2(0))
End If
RS2.Close
set RS2=Nothing
End function


'*******************************************************************************************
'目的 使用协议
Function NewCms()
NewCms="感谢您选择新成内容管理系统（以下简称NewCms），NewCms是目前国内稳定的企业网站、个人博客建设解决方案之一，基于 asp + access/mssql 的技术开发，全部源码开放。<br />"
NewCms=NewCms&"作者博客网址是： <a href='http://zhanxincheng.com'>zhanxincheng.com</a><br />"
NewCms=NewCms&"为了使您正确并合法的使用本软件，请您在使用前务必阅读清楚下面的协议条款：<br />"
NewCms=NewCms&"一、本授权协议适用且仅适用于NewCms所有版本，NewCms官方对本授权协议拥有最终解释权。<br />"
NewCms=NewCms&"二、协议许可的权利<br />"
NewCms=NewCms&"&nbsp;&nbsp;&nbsp;&nbsp;1、您可以在完全遵守本最终用户授权协议的基础上，将本软件应用于非商业用途，而不必支付软件版权授权费用。<br />"
NewCms=NewCms&"&nbsp;&nbsp;&nbsp;&nbsp;2、您可以在协议规定的约束和限制范围内修改 NewCms 源代码或界面风格以适应您的网站要求。<br />"
NewCms=NewCms&"&nbsp;&nbsp;&nbsp;&nbsp;3、您拥有使用本软件构建的网站全部内容所有权，并独立承担与这些内容的相关法律义务。<br />"
NewCms=NewCms&"4、获得商业授权之后，您可以将本软件应用于商业用途，同时依据所购买的授权类型中确定的技术支持内容，自购买时刻起，在技术支持期限内拥有通过指定的方式获得指定范围内的技术支持服务。商业授权用户享有反映和提出意见的权力，相关意见将被作为首要考虑，但没有一定被采纳的承诺或保证。<br />"
NewCms=NewCms&"三、协议规定的约束和限制<br />"
NewCms=NewCms&"&nbsp;&nbsp;&nbsp;&nbsp;1、未获商业授权之前，不得将本软件用于商业用途（包括但不限于企业网站、经营性网站、以营利为目的或实现盈利的网站）。<br />"
NewCms=NewCms&"&nbsp;&nbsp;&nbsp;&nbsp;2、未经官方许可，不得对本软件或与之关联的商业授权进行出租、出售、抵押或发放子许可证。<br />"
NewCms=NewCms&"&nbsp;&nbsp;&nbsp;&nbsp;3、不管您的网站是否整体使用 NewCms ，还是部份栏目使用 NewCms，在您使用了 NewCms 的网站主页上必须保留模板版权信息链接。<br />"
NewCms=NewCms&"&nbsp;&nbsp;&nbsp;&nbsp;4、未经官方许可，禁止在 NewCms 的整体或任何部分基础上以发展任何派生版本、修改版本或第三方版本用于重新分发。<br />"
NewCms=NewCms&"&nbsp;&nbsp;&nbsp;&nbsp;5、如果您未能遵守本协议的条款，您的授权将被终止，所被许可的权利将被收回，并承担相应法律责任。<br />"
NewCms=NewCms&"四、有限担保和免责声明<br />"
NewCms=NewCms&"&nbsp;&nbsp;&nbsp;&nbsp;1、本软件及所附带的文件是作为不提供任何明确的或隐含的赔偿或担保的形式提供的。<br />"
NewCms=NewCms&"&nbsp;&nbsp;&nbsp;&nbsp;2、用户出于自愿而使用本软件，您必须了解使用本软件的风险，在尚未购买产品技术服务之前，我们不承诺对免费用户提供任何形式的技术支持、使用担保，也不承担任何因使用本软件而产生问题的相关责任。<br />"
NewCms=NewCms&"&nbsp;&nbsp;&nbsp;&nbsp;3、电子文本形式的授权协议如同双方书面签署的协议一样，具有完全的和等同的法律效力。您一旦开始确认本协议并安装NewCms，即被视为完全理解并接受本协议的各项条款，在享有上述条款授予的权力的同时，受到相关的约束和限制。协议许可范围以外的行为，将直接违反本授权协议并构成侵权，我们有权随时终止授权，责令停止损害，并保留追究相关责任的权力。<br />"
NewCms=NewCms&"&nbsp;&nbsp;&nbsp;&nbsp;4、如果本软件带有其它软件的整合API示范例子包，这些文件版权不属于本软件官方，并且这些文件是没经过授权发布的，请参考相关软件的使用许可合法的使用。<br />"
NewCms=NewCms&"版权所有 (c)2016，zhanxincheng.com 保留所有权利。<br />"
NewCms=NewCms&"协议发布时间：2016年11月15日<br />"
NewCms=NewCms&"版本最新更新：2016年11月15日 By zhanxincheng.com<br />"
End Function
%>