<!--#include file="Inc/Class.asp" -->
<%
If Fun_Num(Fun_GetId("id","get")) AND Fun_GetId("type","get")="edit" Then
If Fun_Url(Fun_GetId("url","post")) Then url=Fun_GetId("url","post") Else url="http://"&Fun_GetId("url","post")
If Fun_Null(Fun_GetId("name","post")) Then InfoStr Inc_500,Inc_title,"请填写昵称！","back"
If Fun_Null(Fun_GetId("idesc","post")) Then InfoStr Inc_500,Inc_title,"请填写内容！","back"
If Fun_Null(Fun_GetId("notice","post")) Then notice=1 Else notice=0
If Fun_Null(Fun_GetId("display","post")) Then display=0 Else display=1
EditData "{Acc}Comment",Fun_GetId("id","get"),"name,img,mail,qq,url|"&url&",tel,ip,idesc,display|"&display&",notice|"&notice&""
InfoStr Inc_200,Inc_title,"互动信息修改成功！",Fun_GetID("Lailu","post")
End If

Dim id,dateid,fileid,iclass,reid,rootid,name,img,mail,qq,url,tel,ip,idesc,display,notice,addtime,client
ReadData "{Acc}Comment",Fun_GetId("id","get"),"id,dateid,fileid,iclass|property,reid,rootid,name,img,mail,qq,url,tel,ip,idesc,display,notice,addtime,client"
If iclass = 0 Then 
iclass = "留言" 
Else 
iclass = "评论"
exe.StrRS "SELECT {Acc}Nav.infolink,{Acc}Nav.name,{Acc}Nav.enname,{Acc}Read.id,{Acc}Read.dateid,{Acc}Read.title FROM {Acc}Read,{Acc}Nav WHERE {Acc}Read.property={Acc}Nav.id AND {Acc}Read.id="&fileid,"exe"
If Not exe.RS.bof Then iclass="<a target=""_black"" href="""&GetNav(exe.RS(0),Getdateid(exe.RS(3),exe.RS(4)),"",exe.RS(1),exe.RS(2),SEO_bak,"")&""">"&exe.RS(5)&"</a>"
exe.OverRS()
End If
%><!DOCTYPE html>
<html>
<head>	
<title>网友互动<%=SEO_Conn&Inc_CMD%></title>
<!--#include file="Inc/Config/New_Head.asp" -->
<link rel="stylesheet" href="edit/themes/default/default.css" />
<script charset="utf-8" src="edit/kindeditor-min.js"></script>
<script charset="utf-8" src="edit/lang/zh_CN.js"></script>
<script>
			KindEditor.ready(function(K) {
				editor = K.create('textarea[id="editor_id"]', {
					allowFileManager : true
				});
			});
			KindEditor.ready(function(K) {
				var uploadbutton = K.uploadbutton({
					button : K('#uploadButton')[0],
					fieldName : 'imgFile',
					url : 'edit/asp/upload.asp?type=user',
					afterUpload : function(data) {
						if (data.error === 0) {
							var url = K.formatUrl(data.url, 'absolute');
							K('#url').val(url);
						} else {
							alert(data.message);
						}
					},
					afterError : function(str) {
						alert('上传失败');
					}
				});
				uploadbutton.fileBox.change(function(e) {
					uploadbutton.submit();
				});
			});
</script>
</head>
<body<%=Inc_Beijing%>>
<!--#include file="Inc/Config/New_Top.asp"-->
<div class="main-container" id="main-container">
<script type="text/javascript">try{ace.settings.check('main-container' , 'fixed')}catch(e){}</script>
<div class="main-container-inner">
<a class="menu-toggler" id="menu-toggler" href="#"><span class="menu-text"></span></a>
<!--#include file="Inc/Config/New_Sidebar.asp" -->
<div class="main-content">
<div class="breadcrumbs" id="breadcrumbs">
<script type="text/javascript">try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}</script>
<ul class="breadcrumb">
<li><i class="icon-home home-icon"></i><a href="<%=Inc_Index%>">首页</a></li>
<li class="active">网友互动</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<div class="col-xs-12">
<div class="table-responsive">
<form method="post" action="?type=edit&id=<%=id%>">
<table id="sample-table-2" class="table table-striped table-bordered table-hover">
<thead>
</thead>
<tbody>
<tr>    
<td width="15%">互动来源：</td>
<td><a><%=iclass%></a></td>
</tr>
<tr >
<td>网友昵称：</td>
<td><input style="width: 100%;" name="name" type="text" value="<%=name%>"/><input name="Lailu" type="hidden" value="<%=Fun_Lailu%>"/></td>
</tr>
<tr>
<td>网友邮箱：</td>
<td><input style="width: 100%;" name="mail" type="text" value="<%=mail%>"/></td> 
</tr>
<tr>
<td>网友网站：</td>
<td><input style="width: 100%;" name="url" type="text" value="<%=url%>"/></td>
</tr>
<tr >
<td>网友头像：</td>
<td><input name="img" class="ke-input-text" type="text" id="url" value="<%=img%>" /> <input type="button" id="uploadButton" value="上传" /></td>
</tr>
<tr>
<td>网友电话：</td>
<td><input style="width: 100%;" name="tel" type="text" value="<%=tel%>"/></td>
</tr>
<tr>
<td>网友Q Q：</td>
<td><input style="width: 100%;" name="qq" type="text" value="<%=qq%>"/></td>
</tr>
<td>网友设备：</td>
<td><input style="width: 100%;" name="client" type="text" value="<%=client%>"/></td>
</tr>
<tr>
<td>网友内容：</td>
<td><textarea style="width: 100%;" name="idesc" rows="5"><%=idesc%></textarea></td>
</tr>
<tr>
<td>其他选项：</td>
<td> 
<input name="display" type="checkbox" value="1" <%If display=1 Then echo("checked=""checked""")%>/> 隐藏
<input name="notice" type="checkbox" value="0" <%If notice=0 Then echo("checked=""checked""")%>/> 通知
</td>	
</tr>	
<tr>
<td>添加时间：</td>
<td><%=addtime%></td>
</tr>
<tr >
<td>网友&nbsp;&nbsp;&nbsp;IP：</td>
<td><%=ip%></td>
</tr>
<tr>
<td>提交重置：</td>
<td><input type="submit" value="提交" /> <input type="reset" value="重置" /></td>
</tr>
</tbody>
</table>										
</form>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>