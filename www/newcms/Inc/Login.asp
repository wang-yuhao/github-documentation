<%
If Fun_GetID("Login","get") = "yes" Then
dim New_Cookie,New_Pass,New_User
New_Cookie=Fun_GetID("New_Cookie","post")
New_Pass=Fun_GetID("New_Pass","post")
New_Pass=Fun_HTML(New_Pass,30)
New_Pass=MD5(New_Pass)
New_User=Fun_GetID("New_User","post")
New_User=Fun_HTML(New_User,20)

On error resume next
exe.StrRS "SELECT pass,power FROM {Acc}User WHERE name='"&New_User&"' AND display=0","exe"
If err.number<>0 Then InfoStr Inc_401,Inc_Title,Inc_401_Title,Inc_Login
If exe.RS.eof And exe.RS.bof Then
	InfoStr Inc_401,Inc_Title,Inc_401_Title,Inc_Login
Else
	If exe.rs(0)<>New_Pass Then
		InfoStr Inc_401,Inc_Title,Inc_401_Title,Inc_Login
	ElseIf New_Cookie=1 Then
		Call Fun_ReCookie("%display%161008#",0,30)
		Call Fun_ReCookie("%pass%161008#",New_Pass,30)
		Call Fun_ReCookie("%user%161008#",New_User,30)
		Call InfoStr(Inc_200,Inc_Title,"授权成功，正在为您跳转，请稍后！",Inc_Index)
	Else
		Call Fun_ReCookie("%display%161008#",0,"")
		Call Fun_ReCookie("%pass%161008#",New_Pass,"")
		Call Fun_ReCookie("%user%161008#",New_User,"")
		Call InfoStr(Inc_200,Inc_Title,"授权成功，正在为您跳转，请稍后！",Inc_Index)
	End If
End if
End if

If Fun_Cookie("%display%161008#")="0" And Not Fun_Null(Fun_Cookie("%pass%161008#")) And Not Fun_Null(Fun_Cookie("%user%161008#")) Then 
InfoStr Inc_200,Inc_Title,"授权成功，正在为您跳转，请稍后！",Inc_Index
End If
%>