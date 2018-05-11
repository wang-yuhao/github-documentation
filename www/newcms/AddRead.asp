<!--#include file="Inc/Class.asp" -->
<%
If Fun_GETID("type","get") = "add" Then 
dim ImgLink
if split(Fun_GETID("Nav","post"),"|")(0)=0 then InfoStr Inc_500,Inc_title,"未选择栏目！","back"
If Fun_null(Fun_GETID("name","post")) Then InfoStr Inc_500,Inc_title,"未填写标题！","back"
If Fun_null(Fun_GETID("info","post")) Then InfoStr Inc_500,Inc_title,"未填写内容！","back"
If Fun_null(Fun_GETID("i","post")) OR Not Fun_Num(Fun_GETID("i","post")) Then InfoStr Inc_500,Inc_title,"访问量请填写数字！","back"
If Fun_null(Fun_GETID("sort","post")) OR Not Fun_Num(Fun_GETID("sort","post")) Then InfoStr Inc_500,Inc_title,"排序请填写数字！","back"
If Not isdate(Fun_GETID("addtime","post")) Then InfoStr Inc_500,Inc_title,"发布时间注意使用格式！","back"
exe.StrRS "SELECT TOP 1 * FROM [{Acc}read]","r3":exe.rs.addnew
If Fun_null(request.form("addtime")) Then 
dim ttime:ttime=Now()
exe.rs("dateid")  = Inc_StrTime(ttime)
exe.rs("addtime") = ttime
Else
exe.rs("dateid") = Inc_StrTime(Replace(request.form("addtime"),"T"," "))
exe.rs("addtime") = Replace(request.form("addtime"),"T"," ")
End If
exe.rs("edittime") = NOW()
exe.rs("name") = request.form("name")
If Fun_Null(request.form("title")) Then
exe.rs("title") = request.form("name")
Else
exe.rs("title") = request.form("title")
End If
exe.rs("keyword") = request.form("keyword")
exe.rs("tags") = Replace(Replace(request.form("tags"),",","，")," ","，")
If Fun_Num(Fun_GetId("descstr","post")) And Fun_Null(Fun_GetId("idesc","post")) Then
exe.rs("idesc") = Fun_Html(Fun_GetId("info","post"),cint(Fun_GetId("descstr","post")))
else
exe.rs("idesc") = Fun_GetId("idesc","post")
End If
dim info,iimg
If Fun_GetId("down","post")<>1 Then info=ReplaceInfo(Fun_ImgLink(Fun_GetId("info","post"))) else info=ReplaceInfo(Fun_GetId("info","post"))
exe.rs("info") = info
If Fun_Num(Fun_GetId("imgstr","post")) And Fun_Null(Fun_GetId("img","post")) Then 
iimg=sjpeg(Fun_StrImg(info,Fun_GetId("imgstr","post")),0) 
Else 
iimg=Fun_GetID("img","post")
End If
exe.rs("img")=iimg
exe.rs("iuser") = request.form("iuser")
exe.rs("commentnum") = 0
exe.rs("link") = request.form("link")
exe.rs("i") = request.form("i")
exe.rs("sort") = request.form("sort")
If request.form("itop")=2 Then exe.rs("itop") = 2 else exe.rs("itop") = 0
If request.form("push")=1 Then exe.rs("push") = 1 else exe.rs("push") = 0
If request.form("display")=1 Then exe.rs("display") = 1 else exe.rs("display") = 0
If request.form("stop")=1 Then exe.rs("stop") = 1 else exe.rs("stop") = 0
exe.rs("link") = request.form("link")
If Fun_null(request.form("top")) Then
exe.rs("client") = Fun_AGENT()
Else
exe.rs("client") = request.form("client")
End If 
exe.rs("property") = split(request.form("Nav"),"|")(0)
exe.rs("type") = split(request.form("Nav"),"|")(1)
exe.rs.update:exe.OverRS()
StrTags Fun_GETID("tags","post")
InfoStr Inc_200,Inc_title,PostBaidu(1),Inc_ReadList
End If
%><!DOCTYPE html>
<html>
<head>
<title>发布内容<%=SEO_conn&Inc_Cmd%></title>
<!--#include file="Inc/Config/New_Head.asp" -->
<!--编辑器 -->
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
					url : 'edit/asp/upload.asp?type=read',
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
<!--编辑器 -->
</head>
<body <%=Inc_Beijing%>>
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
<li class="active">发布内容</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<form method="post" action="?type=add" class="article">
<table class="table table-striped table-bordered table-hover" width="100%">
<thead>
</thead>
<tbody>
</tbody>
<tr>
<td>内容分类：</td>
<td>
<%=Inc_NavSEl(0,0,0,0,"请选择分类！",1)%>
</td>
</tr>
 <tr >
<td>内容标题：</td>
<td><input name="name" type="text" style="width: 100%;"/></td>
</tr>
 <tr >
<td>SEO标题：</td>
<td><input name="title" type="text" placeholder="为空则自动显示为内容标题！" style="width: 100%;"/></td>
</tr>
 <tr >
<td>内容图片：</td>
<td><input name="img" class="ke-input-text" type="text" id="url" value=""/> <input type="button" id="uploadButton" value="上传"/> &nbsp;&nbsp; 设置内容第<input style="width:30px" name="imgstr" type="text" value=""/>张为缩略图</td>
</tr>
<tr>
<td>关 键 &nbsp;词：</td>
<td><input name="keyword" type="text" placeholder="请使用中文逗号，隔开（关键字）" style="width: 100%;"/></td>
</tr>
<tr>
<td>网站标签：</td>
<td><input name="tags" type="text" placeholder="请使用中文逗号，隔开（关键字）" style="width: 100%;"/></td>
</tr>
<tr>
<td>内容描述：</td>
<td><textarea name="idesc" type="text" style="width: 100%;"></textarea></td>
</tr>
<tr >
<td>详细内容：<br /><br /><a>插入分页<br />{new:page}</a></td>
<td><input name="down" type="checkbox" value="1" <%If Pic_Down=1 Then echo "checked "%>/> 不保存远程图片 &nbsp;&nbsp; &nbsp;&nbsp; 自动摘取前<input style="width:35px" name="descstr" type="text" value="<%=SEO_Desc%>"/>字到描述<textarea id="editor_id" name="info" style="width:100%;height:400px;" ></textarea></td>
</tr>
<tr>
<td>内容信息：</td>
<td>作者 <input name="iuser" type="text" value="" style="width:80px;"/> 链接 <input name="link" type="url" value="" style="width:300px;"/></td>
</tr>
<tr >
<td>发布时间：</td>
<td><input name="addtime" type="text" value="<%=Now()%>" style="width: 100%;"/></td>
</tr>
<tr>
<td>主动推送：</td>
<td>
<label for="Post" style="width: 100%;">
<select name="Post" style="width: 100%;">
<option value="0"<%If SEO_Post=0 Then echo " selected=""selected"""%>> 取消推送</option>
<option value="1"<%If SEO_Post=1 Then echo " selected=""selected"""%>> 普通推送</option>
<option value="2"<%If SEO_Post=2 Then echo " selected=""selected"""%>> 原创推送</option>
<%If SEO_Post=3 OR SEO_Post=4 Then%>
<option value="3"<%If SEO_Post=3 Then echo " selected=""selected"""%>> 普通推送,同时推送MIP</option>
<option value="4"<%If SEO_Post=4 Then echo " selected=""selected"""%>> 原创推送,同时推送MIP</option>
<%end if%>
</select>
</label>
</td>
</tr>
<tr>
<td>其他选项：</td>
<td> 
<input name="display" type="checkbox" value="1" /> 隐藏
<input name="itop" type="checkbox" value="2" /> 置顶
<input name="push" type="checkbox" value="1" /> 推荐
<input name="stop" type="checkbox" value="1" /> 禁止评论&nbsp;&nbsp;&nbsp;&nbsp;
<input name="i" type="text" value="1" style="width:50px;"/> 访问量&nbsp;&nbsp;&nbsp;&nbsp;
<input name="sort" type="text" value="0" style="width:50px;"/> 排序
</td>	
</tr>	          
<tr>
<td>发表方式：</td>
<td><input name="client" type="text" value="<%=Fun_AGENT()%>" style="width: 100%;"/></td>
</tr>
<tr >
<td>提交重置：</td>
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