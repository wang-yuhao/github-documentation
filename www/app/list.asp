<!--#include file="../Inc/New_Class.asp"-->
<%
Rem /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Rem 程序名称：New Cms
Rem 程序作者：新成
Rem 作者博客：http://zhanxincheng.com/
Rem //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dim navpaid:navpaid=Fun_GetID("cat","get")
If Fun_SqlSafe(navpaid) OR Fun_Null(navpaid) OR (Not Fun_Num(pagenum) AND Not Fun_Null(pagenum)) Then die Fun_404(New_Close)
Dim ipage:If ""&pagenum&""="1" Then ipage="" Else ipage=pagenum
exe.StrRS "SELECT id,listlink,name,enname FROM {Acc}Nav WHERE ID like '"&navpaid&"' OR enname like '"&navpaid&"'","exe"
If Not exe.RS.Eof Then 
If SEO_301=0 AND Fun_Dname<>SEO_Url Then Fun_301 SEO_http&SEO_Url&GetNav(exe.RS(1),exe.RS(0),ipage,exe.RS(3),exe.RS(2),SEO_Bak,temtype)
If (SEO_ReWrite=0 AND Instr(exe.RS(1),"?")=0 AND instr(Fun_ReWrite(),SEO_ReP)>0) OR (SEO_ReWrite=1 AND Instr(exe.RS(1),"?")>0 AND instr(Fun_ReWrite(),SEO_ReP)=0) Then Fun_301 SEO_http&Fun_Dname&GetNav(exe.RS(1),exe.RS(0),ipage,exe.RS(3),exe.RS(2),SEO_Bak,temtype)
Else
Fun_404 New_404
End If
exe.OverRS()
If New_FeCache=0 Then
echo CaseTypeFlie("list")
ElseIf New_FeCache>0 Then
echo Fun_GetText("cat"&navpaid&"p"&pagenum,"list")
End If
exe.OverConn()
If New_True=0 Then echo overtime
%>
                  
