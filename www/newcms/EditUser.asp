<!--#include file="Inc/Class.asp" -->
<%
If Fun_GetId("type","get")="edit" AND Not Fun_Null(Fun_GetId("id","get")) Then 
If Fun_Null(Fun_GetId("name","post")) Then InfoStr Inc_500,Inc_Title,"请填写账号！","back"
If Not Fun_Mail(Fun_GetId("mail","post")) AND Not Fun_Null(Fun_GetId("mail","post")) Then InfoStr Inc_500,Inc_Title,"邮箱格式错误，例如：admin@baidu.com","back"
If len(Fun_GetId("pass","post"))<6 AND Not Fun_Null(Fun_GetId("pass","post")) Then InfoStr Inc_500,Inc_Title,"密码请至少6位！","back"
If Not Fun_En(Fun_GetId("pass","post"))AND Not Fun_Null(Fun_GetId("pass","post")) Then InfoStr Inc_500,Inc_Title,"密码请至少包含一个字母！","back"
If Fun_Test("[\u4e00-\u9fa5]",Fun_GetId("pass","post")) Then InfoStr Inc_500,Inc_title,"密码不容许使用汉字！","back"
If Fun_Null(Fun_GetId("nickname","post"))Then InfoStr Inc_500,Inc_title,"未填写昵称！","back"
If Not Fun_QQ(Fun_GetId("qq","post")) AND Not Fun_Null(Fun_GetId("qq","post")) Then InfoStr Inc_500,Inc_title,"QQ号错误！","back" 
'If Not Fun_Test("[\u4e00-\u9fa5]",Fun_GetId("nickname","post")) Then InfoStr Inc_500,Inc_title,"昵称请使用汉字！","back"
Dim display:If Fun_Null(Fun_GetId("display","post")) Then display=0 Else display=1
Dim sort:If Fun_Null(Fun_GetId("sort","post")) Then sort=0 Else sort=Fun_GetId("sort","post")
If Not Fun_Num(sort)  Then InfoStr Inc_500,Inc_Title,"排序请填写数字格式！","back"
If Not Fun_Null(Fun_GetId("pass","post")) Then pass=",pass|"&MD5(Fun_GetId("pass","post"))
EditData "{Acc}User",Fun_GetId("id","get"),"name"&pass&",nickname,mail,img,power,edittime|"&Now()&",ip|"&Fun_GetIp&",qq,url,weixin,idesc,sort|"&sort&",display|"&display
InfoStr Inc_200,Inc_title,"用户修改成功！",Fun_GetID("Lailu","post")
End If

Dim Id,name,mail,img,power,Pass,ip,qq,url,weixin,idesc
ReadData "{Acc}User",Fun_GetId("id","get"),"id,name,nickname,mail,img,power,ip,display,qq,url,weixin,idesc,sort"
%>
<!DOCTYPE html>
<html>
<head>
<title>修改账号<%=SEO_Conn&Inc_CMD%></title>
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
<li class="active">修改用户</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<form method="post"  action="?type=edit&id=<%=Id%>" class="article">
<table class="table table-striped table-bordered table-hover">
<tr>
<td width="15%">账号：</td>
<td><input name="name" type="text" value="<%=name%>" style="width: 100%;"/><input name="Lailu" type="hidden" value="<%=Fun_Lailu%>"/></td>
</tr>
<tr>
<td>密码：</td>
<td><input name="pass" type="text" value="<%=pass%>" style="width: 100%;"/></td>
</tr>
<tr>
<td>邮箱：</td>
<td><input name="mail" type="text" value="<%=mail%>" style="width: 100%;"/></td>
</tr>
<tr>
<td>昵称：</td>
<td><input name="nickname" type="text" value="<%=nickname%>" style="width: 100%;"/></td>
</tr>
<tr>
<td>头像：</td>
<td><input name="img" class="ke-input-text" type="text" id="url" value="<%=img%>" /> <input type="button" id="uploadButton" value="上传" /> </td>
</tr>
<tr>
<td>网址：</td>
<td><input name="url" type="text" value="<%=url%>" style="width: 100%;"/></td>
</tr>
<tr>
<td>Q Q：</td>
<td><input name="qq" type="text" value="<%=qq%>" style="width: 100%;"/></td>
</tr>
<tr>
<td>微信：</td>
<td><input name="weixin" type="text" value="<%=weixin%>" style="width: 100%;"/></td>
</tr>
<tr>
<td>简介：</td>
<td><textarea name="idesc" rows="4" style="width:100%" ><%=idesc%></textarea></td>
</tr>
<tr style="display:none">
<td>权限：</td>
<td>
<label style="width:100%">
<select name="power" size="" style="width:100%">
<option value="0"<%If power=0 Then echo " selected "%>> 站长（超级管理员）</option>
<option value="1"<%If power=1 Then echo " selected "%>> 作者（发布内容，不审核，可查看、修改、隐藏自己发布的内容）</option>
<option value="2"<%If power=2 Then echo " selected "%>> 投稿（发布内容，审核，只看查看自己的内容，无隐藏、编辑权限）</option>
<option value="3"<%If power=3 Then echo " selected "%>> SEO（拥有网站内容发布、隐藏、编辑权限，友链、SEO、基本信息设置模块的使用权限）</option>
</select>
</label>
</td>
</tr>
</tr>
<tr>
<td>其他：</td>
<td>
<input name="display" type="checkbox" value="1" <%If display=1 Then echo("checked")%> /> 禁用&nbsp;&nbsp;&nbsp;&nbsp;
<input name="sort" type="text" value="<%=sort%>" style="width:50px;"/> 排序
</td>
</tr>
<tr >
<td>提交：</td>
<td>
<input class="a" type="submit" value="提交" />
<input class="a"  type="reset" value="重置" />
</td>
</tr> 
</table>
</form>		
</div>
</div>
</div>
</div>
<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="icon-double-angle-up icon-only bigger-110"></i></a>
</div>
</body>
</html>