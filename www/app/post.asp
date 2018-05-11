<!--#include file="../Inc/New_Class.asp"-->
<%
Rem /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Rem 程序名称：New Cms
Rem 程序作者：新成
Rem 作者博客：http://zhanxincheng.com/
Rem //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dim itype,dateid,fileid,name,reid,img,mail,qq,url,tel,desc,record,notice,ftime
ftime=trim(Fun_GetId("time","get"))&trim(Fun_GetId("time","post"))
If Fun_Null(ftime) Then ftime=99999999999
itype=trim(Fun_GetId("type","get"))&trim(Fun_GetId("type","post"))
If Not Fun_Num(itype) Then die "POST路径参数错误，请设置type属性：0留言 1评论"
dateid=trim(Fun_GetId("dateid","get"))&trim(Fun_GetId("dateid","post"))
If Fun_Null(dateid) Then dateid=0
If itype<>0 AND Not Fun_Num(dateid) AND Fun_Null(dateid) Then die "POST路径参数错误，请设置dateid属性：[read:dateid]"
fileid=trim(Fun_GetId("fileid","get"))&trim(Fun_GetId("fileid","post"))
If Fun_Null(fileid) Then fileid=0
If itype<>0 AND Not Fun_Num(fileid) Then die "POST路径参数错误，请设置fileid属性：[read:id]"
name=trim(Fun_GetId("name","post"))
reid=trim(Fun_GetId("reid","post"))
url=trim(Fun_GetId("url","post"))
If Instr(url,"http://")=0 AND Instr(url,"https://")=0 AND Not Fun_Null(url) Then url="http://"&url
img=trim(Fun_GetId("img","post"))
mail=trim(Fun_GetId("mail","post"))
qq=trim(Fun_GetId("qq","post"))
tel=trim(Fun_GetId("tel","post"))
desc=Fun_Html(trim(Fun_GetId("content","post")),200)
record=trim(Fun_GetId("record","post"))
notice=trim(Fun_GetId("notice","post"))
If Fun_Null(Reid) OR Not Fun_Num(reid) Then reid=0
If notice="" Then notice=1
If record="" Then record=1
dim typename:If itype=0 Then typename="留言" Else typename="评论"
If Str_Message=1 AND typename="留言" OR Str_Comment=1 AND typename="评论" Then die "<Script language=JavaScript>alert('"&typename&"功能已关闭！');history.back();</Script>"
If itype<>0 AND Fun_Num(fileid) Then
exe.StrRS "SELECT stop FROM [{Acc}Read] WHERE id="&fileid&"","exe"
If Not exe.rs.eof Then 
If exe.RS(0)=1 Then die "<Script language=JavaScript>alert('亲，该篇内容禁止评论！');history.back();</Script>"
End If
exe.OverRS
End If
if trim((Fun_GetId("check","post"))) <> trim(request.Cookies("validateCode")) then die (" <script>alert('亲，请输入正确的验证码哦？');history.go(-1);</script>")
dim schr
if Fun_Null(name) then 
die "<Script language=JavaScript>alert('亲，请填写昵称！');history.back();</Script>"
ElseIf Fun_Url(name) Then
die "<Script language=JavaScript>alert('亲，昵称不合法！');history.back();</Script>"
ElseIf Str_Stop=0 AND Not Fun_Null(Str_Info) Then
schr=split(Str_Info,"<br>")
for i=0 to ubound(schr)
If Instr(name,schr(i))>0 Then die "<Script language=JavaScript>alert('亲，昵称请勿包含"&schr(i)&"！');history.back();</Script>"
next
End If

if Fun_null(desc) then 
die "<Script language=JavaScript>alert('亲，你还没有告诉我你要说的话呢？');history.back();</Script>"
ElseIf Fun_Null(desc) AND Fun_Url(desc) Then
die "<Script language=JavaScript>alert('您的信息已触发反垃圾系统，请检查修正后重新提交！');history.back();</Script>"
ElseIf Not Fun_Null(desc) AND Not Fun_Test("[\u4e00-\u9fa5]",desc) Then
die "<Script language=JavaScript>alert('亲，请包含汉子！');history.back();</Script>"
ElseIf Str_Stop=0 AND Not Fun_Null(Str_Info) Then
schr=split(Str_Info,"<br>")
for i=0 to ubound(schr)
If Instr(desc,schr(i))>0 Then die "<Script language=JavaScript>alert('亲，"&typename&"请勿包含"&schr(i)&"！');history.back();</Script>"
next
End If

If Not Fun_Null(mail) AND Not Fun_Mail(mail) Then
die "<Script language=JavaScript>alert('亲，邮箱填写有错误，正确格式如：admin@baidu.com');history.back();</Script>"
ElseIf Str_Stop=0 AND Not Fun_Null(Str_Info) Then
schr=split(Str_Info,"<br>")
for i=0 to ubound(schr)
If Instr(mail,schr(i))>0 Then die "<Script language=JavaScript>alert('亲，邮箱请勿包含"&schr(i)&"！');history.back();</Script>"
next
End If

If Not Fun_Null(url) AND Not Fun_Url(url) Then
die "<Script language=JavaScript>alert('亲，网址填写有错误，正确格式如：www.baidu.com');history.back();</Script>"
ElseIf Str_Stop=0 AND Not Fun_Null(Str_Info) Then
schr=split(Str_Info,"<br>")
for i=0 to ubound(schr)
If Instr(url,schr(i))>0 Then die "<Script language=JavaScript>alert('亲，网址请勿包含"&schr(i)&"！');history.back();</Script>"
next
End If

If Not Fun_Null(qq) AND Not Fun_QQ(qq) Then
die "<Script language=JavaScript>alert('亲，QQ填写有错误!');history.back();</Script>"
ElseIf Str_Stop=0 AND Not Fun_Null(Str_Info) Then
schr=split(Str_Info,"<br>")
for i=0 to ubound(schr)
If Instr(qq,schr(i))>0 Then die "<Script language=JavaScript>alert('亲，QQ请勿包含"&schr(i)&"！');history.back();</Script>"
next
End If

If Not Fun_Tel(tel) AND Not Fun_Null(tel) Then
die "<Script language=JavaScript>alert('亲，手机号填写有错误!');history.back();</Script>"
ElseIf Str_Stop=0 AND Not Fun_Null(Str_Info) Then
schr=split(Str_Info,"<br>")
for i=0 to ubound(schr)
If Instr(tel,schr(i))>0 Then die "<Script language=JavaScript>alert('亲，手机号请勿包含"&schr(i)&"！');history.back();</Script>"
next
End If


If Not Fun_Null(Fun_Cookie("[data:time]")) Then
If DateDiff("s", Fun_Cookie("[data:time]"), Now())>ftime Then die "<Script language=JavaScript>alert('亲，提交内容过于频繁！');history.back();</Script>"
End If

if record=0 then
Fun_ReCookie "postname",name,30
Fun_ReCookie "posturl",url,30
Fun_ReCookie "postimg",img,30
Fun_ReCookie "postmail",mail,30
Fun_ReCookie "postqq",qq,30
Fun_ReCookie "posttel",tel,30
Else
Fun_ReCookie "postname",name,""
Fun_ReCookie "posturl",url,""
Fun_ReCookie "postimg",img,""
Fun_ReCookie "postmail",mail,""
Fun_ReCookie "postqq",qq,""
Fun_ReCookie "posttel",tel,""
end if


If Str_Txiang=0 Then
exe.StrRS "SELECT TOP 1 img FROM {Acc}comment WHERE name='"&name&"' ORDER BY ID DESC","exe"
If exe.rs.eof Then 
img=New_Root&New_upLoad&"/portrait/"&Fun_Num100&".jpg" 
else
If exe.RS(0)<>"" Then img=exe.rs(0) Else img=New_Root&New_upLoad&"/portrait/"&Fun_Num100&".jpg" 
End if
exe.OverRS
End If

exe.StrRS "select TOP 1 dateid,fileid,property,reid,rootid,name,img,mail,qq,url,tel,ip,idesc,display,notice,addtime,client from [{Acc}comment]","r3"
exe.rs.addnew
exe.rs(0)=dateid
exe.rs(1)=fileid
exe.RS(2)=itype
exe.RS(3)=reid
exe.RS(4)=0
exe.RS(5)=name
exe.RS(6)=img
exe.RS(7)=mail
exe.RS(8)=qq
exe.RS(9)=url
exe.RS(10)=tel
exe.RS(11)=Fun_GetIP()
exe.RS(12)=desc
If (Str_StopMessage=0 AND itype=0) OR (Str_StopComment=0 AND itype=1) Then exe.RS(13)=2 else exe.RS(13)=0
exe.RS(14)=notice
exe.RS(15)=Now()
exe.RS(16)=Fun_AGENT
exe.rs.update
exe.OverRS
Fun_ReCookie "[data:time]",Now(),1

If Str_StopComment=1 AND itype<>0 Then
exe.StrRS "SELECT Commentnum FROM {Acc}Read WHERE ID="&fileid,"r3"
If Not exe.rs.eof Then
exe.RS(0)=exe.RS(0)+1
exe.RS.UPdate
End If
exe.OverRS
End If

dim title,info
If (Str_StopMessage=0 AND itype=0) OR (Str_StopComment=0 AND itype=1) Then 
title=name&"："&typename&"管理员审核后显示！" 
info=typename&"管理员审核后显示！"
Else 
title=name&"："&typename&"提交成功！"
info=typename&"提交成功！"
End If

StrHtml=Fun_File(New_Root&New_Tempfile&New_Temp&"/skin/post.html")
StrHtml=Replace(StrHtml,"[post:title]",title)
StrHtml=Replace(StrHtml,"[post:info]",info)
StrHtml=Replace(StrHtml,"[post:name]",name)
StrHtml=Replace(StrHtml,"[post:desc]",desc)
StrHtml=Replace(StrHtml,"[post:lailu]",Fun_Lailu())
StrHtml=FunApi(StrHtml)
StrHtml=FunAll(StrHtml)
StrHtml=FunIf(StrHtml)
echo StrHtml

If Str_TMessage=0 AND Fun_Mail(Str_Read) AND itype=0 OR Str_TComment=0 AND Fun_Mail(Str_Read) AND itype<>0 Then
dim strmail
strmail=Fun_File(New_Root&New_Tempfile&New_Temp&"/skin/mail.html")
strmail=Replace(strmail,"[post:type]",typename)
strmail=Replace(strmail,"[post:name]",name)
strmail=Replace(strmail,"[post:img]",img)
strmail=Replace(strmail,"[post:url]",url)
strmail=Replace(strmail,"[post:mail]",mail)
strmail=Replace(strmail,"[post:qq]",qq)
strmail=Replace(strmail,"[post:tel]",tel)
strmail=Replace(strmail,"[post:reid]",reid)
strmail=Replace(strmail,"[post:desc]",desc)
strmail=Replace(strmail,"[post:lailu]",Fun_Lailu())
exe.STrRS "SELECT {Acc}Nav.infolink,{Acc}Nav.name,{Acc}Nav.enname,{Acc}Read.id,{Acc}read.dateid,{Acc}Read.name FROM {Acc}Read,{Acc}Nav WHERE {Acc}Nav.id={Acc}Read.property AND {Acc}Read.id="&fileid,"exe"
If exe.RS.Bof Then 
strmail=Replace(strmail,"[post:link]","")
strmail=Replace(strmail,"[post:title]","")
Else
strmail=Replace(strmail,"[post:link]",SEO_Http&Fun_Dname()&GetNav(exe.RS(0),Getdateid(exe.RS(3),exe.RS(4)),"",exe.RS(1),exe.RS(2),SEO_bak,""))
strmail=Replace(strmail,"[post:title]",exe.RS(5))
End If
exe.OverRS()
strmail=FunApi(strmail)
strmail=FunAll(strmail)
strmail=FunIf(strmail)
Call Fun_jmail(Str_Mail,strmail,FunAll(Replace(Str_Title,"[post:type]",typename)),2)
End If
%>