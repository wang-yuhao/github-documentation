<!--#include file="Inc/Class.asp" -->
<%
If Fun_GetId("type","get")="edit" Then
a=Fun_File(New_Root&"/inc/New_Config.asp")
a=reInfo(a,"Str_Message=","'",Fun_GetId("Str_Message","post"))
a=reInfo(a,"Str_Comment=","'",Fun_GetId("Str_Comment","post"))
a=reInfo(a,"Str_StopMessage=","'",Fun_GetId("Str_StopMessage","post"))
a=reInfo(a,"Str_StopComment=","'",Fun_GetId("Str_StopComment","post"))
a=reInfo(a,"Str_Name=","'",Fun_GetId("Str_Name","post"))
a=reInfo(a,"Str_Mail=","'",Fun_GetId("Str_Mail","post"))
a=reInfo(a,"Str_User=","'",Fun_GetId("Str_User","post"))
a=reInfo(a,"Str_Pass=","'",Fun_GetId("Str_Pass","post"))
a=reInfo(a,"Str_SMTP=","'",Fun_GetId("Str_SMTP","post"))
a=reInfo(a,"Str_TMessage=","'",Fun_GetId("Str_TMessage","post"))
a=reInfo(a,"Str_TComment=","'",Fun_GetId("Str_TComment","post"))
a=reInfo(a,"Str_Read=","'",Fun_GetId("Str_Read","post"))
a=reInfo(a,"Str_Title=","'",Fun_GetId("Str_Title","post"))
a=reInfo(a,"Str_TFMessage=","'",Fun_GetId("Str_TFMessage","post"))
a=reInfo(a,"Str_TFComment=","'",Fun_GetId("Str_TFComment","post"))
a=reInfo(a,"Str_FTitle=","'",Fun_GetId("Str_FTitle","post"))
a=reInfo(a,"Str_Stop=","'",Fun_GetId("Str_Stop","post"))
a=reInfo(a,"Str_Txiang=","'",Fun_GetId("Str_Txiang","post"))
a=reInfo(a,"Str_Info=","'",Replace(Replace(Fun_GetId("Str_Info","post"),chr(13),"<br>"),Chr(10),""))
Fun_FeText New_Root&"/inc/New_Config.asp",a
InfoStr Inc_200,Inc_title,"邮件信息修改成功！",Inc_MailSettings
End If
%><!DOCTYPE html>
<html>
<head>	
<title>互动设置<%=SEO_conn&Inc_CMD%></title>
<!--#include file="Inc/Config/New_Head.asp" -->
</head>
<body<%=Inc_Beijing%>>
<!--#include file="Inc/Config/New_Top.asp" -->
<div class="main-container" id="main-container">
<script type="text/javascript">try{ace.settings.check('main-container' , 'fixed')}catch(e){}</script>
<div class="main-container-inner">
<a class="menu-toggler" id="menu-toggler" href="#"><span class="menu-text"></span></a>
<!--#include file="Inc/Config/New_Sidebar.asp" -->
<div class="main-content">
<div class="breadcrumbs" id="breadcrumbs">
<script type="text/javascript">try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}</script>
<ul class="breadcrumb">
<li><i class="icon-home home-icon"></i><a href="<%=Inc_Index%>">首页</a>
<li>互动设置</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<div class="col-xs-12">
<div class="table-responsive">
<style>
.Post_A {vertical-align: middle;margin-left: 00px;margin-right: 5px;}
.Post_B {vertical-align: middle;margin-left: 20px;margin-right: 5px;}
</style>
<form method="post" action="?type=edit">
<table id="sample-table-2" class="table table-striped table-bordered table-hover">
<thead>
</thead>
<tbody>
</tr>
<td colspan="2"><strong>基本信息：</strong></td>
</tr>
</tr>
<td>头像设置：</td>
<td>
<label for="Str_Txiang">
<select name="Str_Txiang">
<option value="0" <%If Str_Txiang=0 Then echo "selected='selected'" %>>随机头像</option>
<option value="1" <%If Str_Txiang=1 Then echo "selected='selected'" %>>上传头像</option>
</select>
</label>
</td>
</tr>
<tr>
<td>功能开关：</td>
<td>
<span class="Post_A">留言</span> 
<label for="Str_Message">
<select name="Str_Message">
<option value="0" <%If Str_Message=0 Then echo "selected='selected'" %>>开启</option>
<option value="1" <%If Str_Message=1 Then echo "selected='selected'" %>>关闭</option>
</select>
</label>
<span class="Post_B">评论</span> 
<label for="Str_Comment">
<select name="Str_Comment">
<option value="0" <%If Str_Comment=0 Then echo "selected='selected'" %>>开启</option>
<option value="1" <%If Str_Comment=1 Then echo "selected='selected'" %>>关闭</option>
</select>
</label>
</td>
</tr>
<tr>
<td>信息审核：</td>
<td>
<span class="Post_A">留言</span> 
<label for="Str_StopMessage">
<select name="Str_StopMessage">
<option value="0" <%If Str_StopMessage=0 Then echo "selected='selected'" %>>开启</option>
<option value="1" <%If Str_StopMessage=1 Then echo "selected='selected'" %>>关闭</option>
</select>
</label>
<span class="Post_B">评论</span> 
<label for="Str_StopComment">
<select name="Str_StopComment">
<option value="0" <%If Str_StopComment=0 Then echo "selected='selected'" %>>开启</option>
<option value="1" <%If Str_StopComment=1 Then echo "selected='selected'" %>>关闭</option>
</select>
</label>
</td>
</tr>
<td colspan="2"><strong>发信配置：</strong></td>
</tr>
<tr>
<td width="15%">组件状态：</td>
<td><%If FunOK("jmail")="√" Then echo "<font color='#69aa46'>支持Jmail组件</font>" Else echo "<font color='red'>空间不支持JMail组件，请勿开启通知功能，否则会出现错误！</font>"%></td>
</tr>
<tr>
<td>发件名称：</td>
<td><input style="width:100%" name="Str_Name" type="text" value="<%=Str_Name%>"/></td>
</tr>
<tr>
<td>发件邮箱：</td>
<td><input style="width:100%" name="Str_Mail" type="text" value="<%=Str_Mail%>"/></td>
</tr>
<tr>
<td>发件账号：</td>
<td><input style="width:100%" name="Str_User" type="text" value="<%=Str_User%>"/></td>
</tr>
<tr >
<td>发件密码：</td>
<td><input style="width:100%" name="Str_Pass" type="text" value="<%=Str_Pass%>"/></td>
</tr>
<tr>
<td>发件地址：</td>
<td><input style="width:100%" name="Str_SMTP" type="text" class="text" value="<%=Str_SMTP%>"/></td>
</tr>
<tr >
<td colspan="2"><strong>通知站长：</strong></td>
</tr>
<tr >
<td>信息通知：</td>
<td>
<span class="Post_A">留言</span> 
<label for="Str_TMessage">
<select name="Str_TMessage">
<option value="0" <%If Str_TMessage=0 Then echo "selected='selected'" %>>开启</option>
<option value="1" <%If Str_TMessage=1 Then echo "selected='selected'" %>>关闭</option>
</select>
</label>
<span class="Post_B">评论</span> 
<label for="Str_TComment">
<select name="Str_TComment">
<option value="0" <%If Str_TComment=0 Then echo "selected='selected'" %>>开启</option>
<option value="1" <%If Str_TComment=1 Then echo "selected='selected'" %>>关闭</option>
</select>
</label>
</td>
</tr>
<tr >
<td>通知邮箱：</td>
<td><input style="width:100%" name="Str_Read" type="text" class="text"  value="<%=Str_Read%>"/></td>
</tr>
<tr>
<td>邮件标题：</td>
<td><input style="width:100%" name="Str_Title" type="text" class="text" value="<%=Str_Title%>"/></td>
</tr>
<tr >
<td colspan="2"><strong>通知访客：</strong></td>
</tr>
<tr >
<td>回复通知：</td>
<td>
<span class="Post_A">留言</span> 
<label for="Str_TFMessage">
<select name="Str_TFMessage">
<option value="0" <%If Str_TFMessage=0 Then echo "selected='selected'" %>>开启</option>
<option value="1" <%If Str_TFMessage=1 Then echo "selected='selected'" %>>关闭</option>
</select>
</label>
<span class="Post_B">评论</span> 
<label for="Str_TFComment">
<select name="Str_TFComment">
<option value="0" <%If Str_TFComment=0 Then echo "selected='selected'" %>>开启</option>
<option value="1" <%If Str_TFComment=1 Then echo "selected='selected'" %>>关闭</option>
</select>
</label>
</td>
</tr>
<tr>
<td>邮件标题：</td>
<td><input style="width:100%" name="Str_FTitle" type="text" value="<%=Str_FTitle%>"/></td>
</tr>
<tr>
<td>拦截开关：</td>
<td>
<input name="Str_Stop" type="radio" value="0" <%If Str_Stop=0 Then echo "checked=""checked""" %>> 开启 
<input name="Str_Stop" type="radio" value="1" <%If Str_Stop=1 Then echo "checked=""checked""" %>> 关闭
 &nbsp;[采用包含匹配模式]
</td>
</tr>
<tr >
<td>拦截内容：</td>
<td>
<textarea name="Str_Info" style="width:100%" rows="10"><%=replace(Str_Info,"<br>",chr(13))%></textarea>
</td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="button" id="button" value="提交" /> <input type="reset" name="button2" id="button2" value="重置" /></td>
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
<a id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="icon-double-angle-up icon-only bigger-110"></i></a>
</div>
</body>
</html>