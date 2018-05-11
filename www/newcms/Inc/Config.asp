<%
'////全局基本信息//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

'侧边栏快捷选择设置
Const Sidebar_1 = "CoreSettings.asp" 
Const Sidebar_2 = "AddRead.asp"
Const Sidebar_3 = "UserList.asp"
Const Sidebar_4 = "BasicSettings.asp"

Const Inc_Shield = "/"                     '错误页面
Const Inc_Login = "Login.asp"                             '登陆页面
Const Inc_Index = "Home.asp"                              '首页设置
Const Inc_TuiChu = "Inc/Out.asp"					'推出登陆
Const Inc_500 = "HTTP 500"						
Const Inc_401 = "HTTP 401.1"
Const Inc_401_Title = "HTTP 错误 401.1 - 未经授权|访问由于凭据无效被拒绝。"
Const Inc_200 = "HTTP 200"

Const Inc_AddRead="AddRead.asp"              '新增内容
Const Inc_ReadList="ReadList.asp"            '内容列表
Const Inc_EditRead="EditRead.asp"
Dim Inc_Read:Inc_Read=Inc_EditRead&"?Rnd="&NOW()&"&id="  '文章编辑

Const Inc_AddTags="AddTags.asp"
Const Inc_TagsList="TagsList.asp"

Const Inc_AddUser = "AddUser.asp"                    '新增用户  
Const Inc_UserList = "UserList.asp"             
Const Inc_EditUser="EditUser.asp"
Dim Inc_User:Inc_User = Inc_EditUser&"?Rnd="&NOW()&"&id="	            '用户编辑


Const Inc_AddColumn = "AddColumn.asp"                '新增栏目
Const Inc_ColumnList = "ColumnList.asp"				'栏目列表
Const Inc_EditColumn = "EditColumn.asp"	
Dim Inc_Column:Inc_Column = Inc_EditColumn&"?Rnd="&NOW()&"&id="	            '栏目编辑

Const Set_="Set_"
Const Inc_Dela = "Set_DelCache.asp" 
Const Inc_Data = "Set_Backup.asp" 
Const Inc_Temp = "Set_Temp.asp" 
Const Inc_Safe = "Set_Safe.asp"
Const Inc_TagsDesc = "Set_TagsDesc.asp"

Const Inc_AddAd = "AddAd.asp"                '新增图片
Const Inc_AdList = "ADList.asp"				'图片列表
Const Inc_EditAd = "EditAD.asp"	
Dim Inc_AD:Inc_AD = Inc_EditAd&"?Rnd="&NOW()&"&id="	             '图片编辑

Const Inc_AddLink = "AddLink.asp"					'新增链接	
Const Inc_LinkList = "LinkList.asp"					'链接列表
Const Inc_EditLink = "EditLink.asp"	
Dim Inc_Link:Inc_Link = Inc_EditLink&"?Rnd="&NOW()&"&id="            '链接编辑

Const Inc_CommentList="CommentList.asp"			'互动列表
Const Inc_editComment="EditComment.asp"	
Dim Inc_Comment:Inc_Comment=Inc_editComment&"?Rnd="&NOW()&"&id="         '互动编辑

Const Inc_Settings = "Settings"
Const Inc_BasicSettings = "BasicSettings.asp"		'基本设置
Const Inc_CoreSettings = "CoreSettings.asp"		'核心设置
Const Inc_SecuritySettings = "SecuritySettings.asp"	'安全设置
Const Inc_MailSettings = "MailSettings.asp"	'邮件设置
Const Inc_TemplateSettings = "TemplateSettings.asp"	'模板设置
Const Inc_PictureSettings = "PictureSettings.asp"		'图片设置
Const Inc_SeoSettings = "SeoSettings.asp"
'获取当前栏目列表
Dim Inc_filename,Inc_Id
Inc_filename=Request.ServerVariables("Script_Name")
If instr(Inc_filename,Inc_Index)>0 Then
Inc_Id = 0 
ElseIf (instr(Inc_filename,Inc_ReadList)>0) or (instr(Inc_filename,Inc_AddRead)>0) Or (instr(Inc_Filename,Inc_EditRead)>0) Then
Inc_Id = 1
ElseIf (instr(Inc_filename,Inc_AddColumn)>0) Or (instr(Inc_filename,Inc_ColumnList)>0) Or (instr(Inc_Filename,Inc_EditColumn)>0) Then
Inc_Id = 2
ElseIf (instr(Inc_filename,Inc_AddUser)>0) or (instr(Inc_filename,Inc_UserList)>0) Or (instr(Inc_Filename,Inc_EditUser)>0) Then
Inc_Id = 3
ElseIf (instr(Inc_filename,Inc_AddTags)>0) or (instr(Inc_filename,Inc_TagsList)>0) Then
Inc_Id = 4
ElseIf (instr(Inc_filename,Set_)>0) Then
Inc_Id = 5
ElseIf (instr(Inc_filename,Inc_AddAd)>0) or (instr(Inc_filename,Inc_AdList)>0) or (instr(Inc_filename,Inc_EditAd)>0) Then
Inc_Id = 6
ElseIf (instr(Inc_filename,Inc_AddLink)>0) or (instr(Inc_filename,Inc_LinkList)>0) OR (instr(Inc_filename,Inc_EditLink)>0) Then
Inc_Id = 7
ElseIf (instr(Inc_filename,Inc_CommentList)>0) OR (Instr(Inc_filename,Inc_editComment)>0) Then
Inc_Id = 8
ElseIf (instr(Inc_filename,Inc_Settings)>0) Then
Inc_Id = 9
Else
Inc_Id = 0
End if
'后台风格
dim Beijing,Inc_Beijing
If Not Fun_Null(Fun_GetID("style","post")) Then Fun_ReCookie "%style%20150930#",Fun_GetID("style","post"),365
Beijing= Fun_Cookie("%style%20150930#")
If Beijing = "#438EB9" Or Fun_Null(Beijing) Then
Inc_Beijing = ""
ElseIf Beijing = "#222A2D" Then
Inc_Beijing = " class=""skin-1"""
ElseIf Beijing = "#C6487E" Then
Inc_Beijing = " class=""skin-2"""
ElseIf Beijing = "#D0D0D0" Then
Inc_Beijing = " class=""skin-3"""
End If
Dim Size:If Fun_Null(Fun_GetId("size","get")) Then Size=15 Else Size=Fun_GetId("size","get") End If
Dim key:If Fun_Null(Fun_GetId("key","get")) Then key="" Else key=Fun_GetId("key","get") End If
Dim page:If Fun_Null(Fun_GetId("page","get")) Then page="" Else page=Fun_GetId("page","get") End If
Dim List:If Fun_Null(Fun_GetId("list","get")) Then list="" Else list=Fun_GetId("list","get") End If
Dim fype:If Fun_Null(Fun_GetId("fype","get")) Then fype="" Else fype=Fun_GetId("fype","get") End If
Dim Plfl:If Not Fun_Null(Fun_GetId("Plfl","get")) Then Plfl=Fun_GetId("Plfl","get") Else Plfl=""
%>