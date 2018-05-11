<!--#include file="../Inc/New_Class.asp"-->
<%
Rem /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Rem 程序名称：New Cms
Rem 程序作者：新成
Rem 作者博客：http://zhanxincheng.com/
Rem //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dim tagssiz:tagssiz=Fun_GetSql(Fun_GetID("tags","get"))
If (Not Fun_Null(pagenum) AND Not Fun_Num(pagenum)) OR Fun_SqlSafe(tagssiz) Then die Fun_404(New_Close)
Dim ipage:If ""&pagenum&""="1" Then ipage="" Else ipage=pagenum
If SEO_301=0 AND Fun_Dname<>SEO_Url Then Fun_301 SEO_http&SEO_Url&GetNav(SEO_Tags,tagssiz,ipage,"","",SEO_Bak,temtype)
If (SEO_ReWrite=0 AND Instr(SEO_Tags,"?")=0 AND instr(Fun_ReWrite(),SEO_ReP)>0) OR (SEO_ReWrite=1 AND Instr(SEO_Tags,"?")>0 AND instr(Fun_ReWrite(),SEO_ReP)=0) Then Fun_301 SEO_http&Fun_Dname&GetNav(SEO_tags,tagssiz,ipage,"","",SEO_Bak,temtype)
exe.StrRS "UPDATE {Acc}Tags SET i=i+1 WHERE name='"&tagssiz&"'","exe"
If New_FeCache=0 Then
echo CaseTypeFlie("tags")
ElseIf New_FeCache>0 Then
echo Fun_GetText("tags"&tagssiz&"p"&pagenum,"tags")
End If
exe.OverConn()
If New_True=0 Then echo overtime
%>
                  
