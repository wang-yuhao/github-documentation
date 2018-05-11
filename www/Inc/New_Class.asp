<!--#include file="New_Data.asp"-->
<%
Rem /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Rem 程序名称：New Cms
Rem 程序作者：新成
Rem 作者博客：http://zhanxincheng.com/
Rem //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Select Case New_On
	Case 1 die New_Info
	Case 2 die Fun_404("<META http-equiv=""refresh"" content=""0;URL=/install/"">")
End Select
Call Fun_StrQ()
Dim Fun_Cache
if New_Cache>0 then
Response.ExpiresAbsolute=Now()+New_Cache
Response.Expires=New_Cache
Response.CacheControl="max-age="&New_Cache*60&""
Response.AddHeader "Pragma", "max-age="&New_Cache*60&""
'Response.AddHeader "Last-Modified", Now()
Fun_Cache="<a>"&New_Cache&"</a> 分钟"
Else
Fun_Cache="<a>关闭</a>"
End If
%>
<!--#include file="New_Function.asp"-->
<!--#include file="New_Temp.asp"-->
