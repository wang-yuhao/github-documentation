<!--#include file="../../../Inc/New_Data.asp" -->
<!--#include file="../../../Inc/New_Function.asp" -->
<!--#include file="UpLoad_Class.asp"-->
<!--#include file="JSON_2.0.4.asp"-->
<%
'On Error Resume Next
Login()

Dim aspUrl, savePath, saveUrl, maxSize, fileName, fileExt, newFileName, filePath, fileUrl, dirName
Dim extStr, imageExtStr, flashExtStr, mediaExtStr, fileExtStr,icoExtStr
Dim upload, file, fso, ranNum, hash, ymd, mm, dd, result

aspUrl = Request.ServerVariables("SCRIPT_NAME")
aspUrl = left(aspUrl, InStrRev(aspUrl, "/"))
dirName = Request.QueryString("type")

'文件保存目录路径
savePath = New_Root&New_upLoad&"/"
'文件保存目录URL
saveUrl = New_Root&New_upLoad&"/"
'定义允许上传的文件扩展名
imageExtStr = "gif|jpg|jpeg|png|bmp"
icoExtStr = "ico"
'flashExtStr = "swf|flv"
'mediaExtStr = "swf|flv|mp3|wav|wma|wmv|mid|avi|mpg|asf|rm|rmvb"
'fileExtStr = "doc|docx|xls|xlsx|ppt|htm|html|txt|zip|rar|gz|bz2"
'最大文件大小
maxSize = New_Upsize * 1024 * 1024 

Set fso = Server.CreateObject("Scripting.FileSystemObject")
If Not fso.FolderExists(Server.mappath(savePath)) Then
	showError("上传目录不存在。")
End If


Select Case Ucase(dirName)
Case "READ"	 dirName = "images"
Case "LOGO"	 dirName = "logo"
Case "ICO"	 dirName = "ico"
Case "OTHER"	 dirName = "other"
Case "USER" dirName="user"
Case Else		 dirName = "images"
End Select

If instr(lcase("images,other,ico,logo,user"), dirName) < 1 Then showError("目录名不正确。") End If

Select Case dirName
	Case "images" extStr = imageExtStr
	Case "other" extStr = imageExtStr
	Case "ico" extStr = icoExtStr
	case "logo" extStr = imageExtStr
	case "user" extStr = imageExtStr
	Case Else  extStr = imageExtStr
End Select

set upload = new AnUpLoad
upload.Exe = extStr
upload.MaxSize = maxSize
upload.GetData()
if upload.ErrorID>0 then 
	showError(upload.Description)
end if

'创建文件夹
savePath = savePath & dirName & "/"
saveUrl = saveUrl & dirName & "/"
If Not fso.FolderExists(Server.mappath(savePath)) Then
	fso.CreateFolder(Server.mappath(savePath))
End If
mm = month(now)
If mm < 10 Then
	mm = "0" & mm
End If
dd = day(now)
If dd < 10 Then
	dd = "0" & dd
End If
ymd = year(now) & "-" & mm & "-" & dd
savePath = savePath & ymd & "/"
saveUrl = saveUrl & ymd & "/"
If Not fso.FolderExists(Server.mappath(savePath)) Then
	fso.CreateFolder(Server.mappath(savePath))
End If

set file = upload.files("imgFile")
if file is nothing then
	showError("请选择文件。")
end if

set result = file.saveToFile(savePath, 0, true)
if result.error then
	showError(file.Exception)
end if

filePath = Server.mappath(savePath & file.filename)
fileUrl = saveUrl & file.filename
dim typeid:typeid=lcase(Request.QueryString("type"))
Set upload = nothing
Set file = nothing
If instr("other,ico,user,logo",typeid)=0 AND Pic_ON=0 Then sjpeg fileUrl

If Not fso.FileExists(filePath) Then showError("上传文件失败。") End If

Response.AddHeader "Content-Type", "text/html; charset=UTF-8"
Set hash = jsObject()
hash("error") = 0
hash("url") = fileUrl
hash.Flush
Response.End

Function showError(message)
	Response.AddHeader "Content-Type", "text/html; charset=UTF-8"
	Dim hash
	Set hash = jsObject()
	hash("error") = 1
	hash("message") = message
	hash.Flush
	Response.End
End Function
%>