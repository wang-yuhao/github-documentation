<!--#include file="../Inc/New_Class.asp"-->
<%
Rem /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Rem 程序名称：New Cms
Rem 程序作者：新成
Rem 作者博客：http://zhanxincheng.com/
Rem //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Response.Expires = -1
Response.AddHeader "Pragma","no-cache"
Response.AddHeader "cache-ctrol","no-cache"
Response.ContentType="text/xml; charset=utf-8"
echo "<?xml version=""1.0"" encoding=""UTF-8""?>" & vbcrlf
echo "<urlset>" & vbcrlf
Dim url
linkArray=exe.StrRS("SELECT TOP 1000 {Acc}Read.id,{Acc}Read.dateid,{Acc}Read.addtime,{Acc}Nav.name,{Acc}Nav.enname,{Acc}Nav.infolink FROM {Acc}Read,{Acc}Nav WHERE {Acc}Nav.id={Acc}Read.property AND {Acc}Read.display=0 ORDER BY {Acc}Read.id DESC","arr"):exe.OverRS()
exe.StrRS "SELECT URL FROM {Acc}Set","exe":URL=exe.RS(0):exe.OverRS()
If Fun_Null(URL) Then Url=Fun_Dname
If Instr(URL,"http://")=0 AND Instr(URL,"https://")=0 Then URL=SEO_Http&URL
if not isarray(linkArray) then  vnum=-1  else vnum=ubound(linkArray,2)
for i=0 to vnum
echo "<url>" & vbcrlf
echo "<loc>"&URL&GetNav(linkArray(5,i),Getdateid(linkArray(0,i),linkArray(1,i)),"","","",SEO_bak,temtype)&"</loc>" & vbcrlf
echo "<lastmod>"&Fun_DATE(linkArray(2,i),"Y-M-D")&"</lastmod>" & vbcrlf
echo "</url>" & vbcrlf
next
echo "</urlset>"
exe.OverConn()
If New_True=0 Then echo overtime
%>