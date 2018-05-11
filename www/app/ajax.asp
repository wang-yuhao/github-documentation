<!--#include file="../Inc/New_Class.asp"-->
<%
Rem /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Rem 程序名称：New Cms
Rem 程序作者：新成
Rem 作者博客：http://zhanxincheng.com/
Rem //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
If Fun_GetId("id","get")<>"" Then echo ajaxi(Fun_GetId("id","get"))
If Fun_GetId("text","get")<>"" Then echo ajaxchr(Fun_GetId("text","get"))
If Fun_Cookie("validateCode")=Fun_GetId("check","get") AND Fun_GetId("check","get")<>"" Then die True

Function ajaxchr(str)
str=Fun_GetId(str,"get")
ajaxchr=True
stra=split(Str_Info,"<br>")
for i=0 to ubound(stra)
If Instr(str,stra(i))>0 Then die stra(i)
next
End Function
Function ajaxi(a)
exe.StrRS "SELECT i FROM {Acc}Read WHERE id="&a,"exe"
If Not exe.RS.bof Then die exe.RS(0)
exe.OverRS()
End Function
%>