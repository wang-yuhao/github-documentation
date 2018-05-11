<!--#include file="../Inc/New_Class.asp"-->
<%
Rem /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Rem 程序名称：New Cms
Rem 程序作者：新成
Rem 作者博客：http://zhanxincheng.com/
Rem //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Response.ContentType="text/javascript; charset=utf-8"
Select Case Fun_GetID("r","get")
Case "vers"
	Dim vers:vers=Fun_GetID("vers","get"):vers=Replace(vers,".","")
	If vers<Replace(Inc_vers,".","") Then die "document.write(' <font color=\'red\'> 最新版本("&Inc_vers&")</font>')"
Case "type"
	Dim itype:itype=Fun_GetID("type","get")
	If Fun_Null(itype) OR len(itype)<>26 OR left(itype,6)<>"NEWCMS" Then 
	die "document.write('未授权版本，免费开源版密匙[NEWCMS20161105000000ZXC]')"
	ElseIf itype="NEWCMS201611005000000ZXC" Then 
	die "document.write('免费开源版')"
	Else
	'预留接口
	End If
Case Else
End Select
%>