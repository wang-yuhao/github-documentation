<!--#include file="../Inc/New_Class.asp"-->
<%
Rem /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Rem 程序名称：New Cms
Rem 程序作者：新成
Rem 作者博客：http://zhanxincheng.com/
Rem //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dim readnum:readnum=Fun_GetID("p","get")
If Not Fun_Num(readnum) OR Fun_Null(readnum) OR (Not Fun_Null(pagenum) AND Not Fun_Num(pagenum)) Then die Fun_404(New_Close)
Dim ipage:If ""&pagenum&""="1" Then ipage="" Else ipage=pagenum
exe.StrRS "SELECT {Acc}Read.id,{Acc}Read.dateid,{Acc}Nav.name,{Acc}Nav.enname,{Acc}Nav.infolink FROM {Acc}Read,{Acc}Nav WHERE ({Acc}Read.Id like '"&readnum&"' OR {Acc}Read.dateid like '"&readnum&"') AND {Acc}Read.property={Acc}Nav.id","exe"
If Not exe.RS.Bof Then
If SEO_301=0 AND Fun_Dname<>SEO_Url Then Fun_301 SEO_http&SEO_Url&GetNav(exe.RS(4),Getdateid(exe.RS(0),exe.RS(1)),"",exe.RS(2),exe.RS(3),SEO_bak,temtype)
If (readnum=""&exe.RS(0)&"" AND SEO_DATEId=1) OR (readnum=""&exe.RS(1)&"" AND SEO_DATEId=0) Then Fun_301 SEO_http&Fun_Dname&GetNav(exe.RS(4),Getdateid(exe.RS(0),exe.RS(1)),"",exe.RS(2),exe.RS(3),SEO_bak,temtype)
If (SEO_ReWrite=0 AND Instr(exe.RS(4),"?")=0 AND instr(Fun_ReWrite(),SEO_ReP)>0) OR (SEO_ReWrite=1 AND Instr(exe.RS(4),"?")>0 AND instr(Fun_ReWrite(),SEO_ReP)=0) Then Fun_301 SEO_http&Fun_Dname&GetNav(exe.RS(4),Getdateid(exe.RS(0),exe.RS(1)),"",exe.RS(2),exe.RS(3),SEO_bak,temtype)
Else
Fun_404 New_404
End If
exe.OverRS()
exe.StrRS "UPDATE {Acc}Read SET i=i+1 WHERE id like '"&readnum&"' OR dateid like '"&readnum&"'","exe"
If New_FeCache=0 Then
echo CaseTypeFlie("read")
ElseIf New_FeCache>0 Then
echo Fun_GetText("read"&readnum&"p"&pagenum,"read")
End If
exe.OverConn()
If New_True=0 Then echo overtime
%>
                  
