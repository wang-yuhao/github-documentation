<!--#include file="Inc/Class.asp" -->
<%  
If Fun_GetId("type","get") = "add" Then 
If Fun_Null(Fun_GetId("name","post")) Then InfoStr Inc_500,Inc_Title,"请填写账号！","back"
If Not Fun_Mail(Fun_GetId("mail","post")) AND Not Fun_Null(Fun_GetId("mail","post")) Then InfoStr Inc_500,Inc_Title,"邮箱格式错误，例如：admin@baidu.com","back"
If Fun_Null(Fun_GetId("pass","post")) Then InfoStr Inc_500,Inc_Title,"未填写密码！","back"
If len(Fun_GetId("pass","post"))<6 Then InfoStr Inc_500,Inc_Title,"密码请至少6位！","back"
If Not Fun_En(Fun_GetId("pass","post")) Then InfoStr Inc_500,Inc_Title,"密码请至少包含一个字母！","back"
If Fun_Test("[\u4e00-\u9fa5]",Fun_GetId("pass","post")) Then InfoStr Inc_500,Inc_title,"密码不容许使用汉字！","back"
If Fun_Null(Fun_GetId("nickname","post"))Then InfoStr Inc_500,Inc_title,"未填写昵称！","back"
If Not Fun_QQ(Fun_GetId("qq","post")) AND Not Fun_Null(Fun_GetId("qq","post")) Then InfoStr Inc_500,Inc_title,"QQ号错误！","back" 
'If Not Fun_Test("[\u4e00-\u9fa5]",Fun_GetId("nickname","post")) Then InfoStr Inc_500,Inc_title,"昵称请使用汉字！","back"
Dim sort:If Fun_Null(Fun_GetId("sort","post")) Then sort=0 Else sort=Fun_GetId("sort","post")
If Not Fun_Num(sort)  Then InfoStr Inc_500,Inc_Title,"排序请填写数字格式！","back"
exe.StrRS "select TOP 1 ID FROM {Acc}User WHERE name='"&Fun_GetId("name","post")&"'","exe"
If Not exe.RS.EOF Then InfoStr Inc_500,Inc_title,"账号已经存在！","back"
exe.OverRS()
Dim display:If Fun_Null(Fun_GetId("display","post")) Then display=0 Else display=1
AddData "{Acc}User","name,pass|"&MD5(Fun_GetId("pass","post"))&",nickname,mail,img,power,addtime|"&Now()&",ip|"&Fun_GetIp&",qq,url,weixin,idesc,sort,display|"&display
InfoStr Inc_200,Inc_title,"用户创建成功！",Inc_UserList
End If
%>
<!DOCTYPE html>
<html>
<head>
<title>新增账号<%=SEO_Conn&Inc_CMD%></title>
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
<li class="active">新增用户</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<form method="post" action="?type=add" class="article">
<table class="table table-striped table-bordered table-hover">
<tr>
<td width="15%">账号：</td>
<td><input name="name" type="text" value="" style="width: 100%;"/></td>
</tr>
<tr>
<td>密码：</td>
<td><input name="pass" type="text" value="" style="width: 100%;"/></td>
</tr>
<tr>
<td>邮箱：</td>
<td><input name="mail" type="text" value="" style="width: 100%;"/></td>
</tr>
<tr>
<td>昵称：</td>
<td><input name="nickname" type="text" value="" style="width: 100%;"/></td>
</tr>
<tr>
<td>头像：</td>
<td><input name="img" class="ke-input-text" type="text" id="url" value="" /> <input type="button" id="uploadButton" value="上传" /> </td>
</tr>
<tr>
<td>网址：</td>
<td><input name="url" type="text" value="" style="width: 100%;"/></td>
</tr>
<tr>
<td>Q Q：</td>
<td><input name="qq" type="text" value="" style="width: 100%;"/></td>
</tr>
<tr>
<td>微信：</td>
<td><input name="weixin" type="text" value="" style="width: 100%;"/></td>
</tr>
<tr>
<td>简介：</td>
<td><textarea name="idesc" rows="4" style="width:100%" ></textarea></td>
</tr>
<tr style="display:none">
<td>权限：</td>
<td>
<label style="width:100%">
<select name="power" size="" style="width:100%">
<option value="0"> 站长（超级管理员）</option>
<option value="1"> 作者（发布内容，不审核，可查看、修改、隐藏自己发布的内容）</option>
<option value="2"> 投稿（发布内容，审核，只看查看自己的内容，无隐藏、编辑权限）</option>
<option value="3"> SEO（拥有网站内容发布、隐藏、编辑权限，友链、SEO、基本信息设置模块的使用权限）</option>
</select>
</label>
</td>
</tr>
</tr>
<tr>
<td>其他：</td>
<td>
<input name="display" type="checkbox" value="1" /> 禁用&nbsp;&nbsp;&nbsp;&nbsp;
<input name="sort" type="text" value="0" style="width:50px;"/> 排序
</td>
</tr>
<tr >
<td>提交：</td>
<td>
<input type="submit" value="提交" />
<input type="reset" value="重置" />
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