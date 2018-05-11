<!--#include file="Inc/Class.asp" -->
<%
If Fun_GetId("type","get")="edit" Then
a=Fun_File(New_Root&"/inc/New_Config.asp")
a=reInfo(a,"New_SqlType=","'|",Fun_GetId("New_SqlType","post"))
a=reInfo(a,"New_Access=","'|",Fun_GetId("New_Access","post"))
a=reInfo(a,"New_Server=","'|",Fun_GetId("New_Server","post"))
a=reInfo(a,"New_SQLName=","'|",Fun_GetId("New_SQLName","post"))
a=reInfo(a,"New_SQLUser=","'|",Fun_GetId("New_SQLUser","post"))
a=reInfo(a,"New_SQLpwd=","'|",Fun_GetId("New_SQLpwd","post"))
a=reInfo(a,"New_Root=","'|",Fun_GetId("New_Root","post"))
a=reInfo(a,"New_DataOver=","'|",Fun_GetId("New_DataOver","post"))
a=reInfo(a,"New_Cache=","'|",Fun_GetId("New_Cache","post"))
a=reInfo(a,"New_FeCache=","'|",Fun_GetId("New_FeCache","post"))
a=reInfo(a,"New_On=","'|",Fun_GetId("New_On","post"))
a=reInfo(a,"New_Info=","'|",Fun_GetId("New_Info","post"))
a=reInfo(a,"New_admin=","'|",Fun_GetId("New_admin","post"))
a=reInfo(a,"New_404=","'|",Fun_GetId("New_404","post"))
a=reInfo(a,"New_Close=","'|",Fun_GetId("New_Close","post"))
a=reInfo(a,"New_Upsize=","'|",Fun_GetId("New_Upsize","post"))
a=reInfo(a,"New_upLoad=","'|",Fun_GetId("New_upLoad","post"))
a=reInfo(a,"New_Temp=","'|","/"&Fun_GetId("New_Temp","post"))
a=reInfo(a,"New_Gzip=","'|",Fun_GetId("New_Gzip","post"))
a=reInfo(a,"New_color=","'|",Fun_GetId("New_color","post"))
a=reInfo(a,"New_khd=","'|",Replace(Replace(Fun_GetId("New_khd","post"),chr(13),"<br>"),Chr(10),""))
Fun_FeText New_Root&"/inc/New_Config.asp",a
InfoStr Inc_200,Inc_title,"核心信息修改成功！",Inc_CoreSettings
End If
%><!DOCTYPE html>
<html>
<head>	
<title>核心参数<%=SEO_conn&Inc_CMD%></title>
<!--#include file="Inc/Config/New_Head.asp" -->
<link rel="stylesheet" href="edit/themes/default/default.css" />
<script charset="utf-8" src="edit/kindeditor-min.js"></script>
<script>
			KindEditor.ready(function(K) {
				var colorpicker;
				K('#colorpicker').bind('click', function(e) {
					e.stopPropagation();
					if (colorpicker) {
						colorpicker.remove();
						colorpicker = null;
						return;
					}
					var colorpickerPos = K('#colorpicker').pos();
					colorpicker = K.colorpicker({
						x : colorpickerPos.x,
						y : colorpickerPos.y + K('#colorpicker').height(),
						z : 19811214,
						selectedColor : 'default',
						click : function(color) {
							K('#color').val(color);
							colorpicker.remove();
							colorpicker = null;
						}
					});
				});
				K(document).click(function() {
					if (colorpicker) {
						colorpicker.remove();
						colorpicker = null;
					}
				});
			});
			
</script>
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
<li>核心参数</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<div class="col-xs-12">
<div class="table-responsive">
<form method="post" action="?type=edit" >
<table id="sample-table-2" class="table table-striped table-bordered table-hover">
<thead>
</thead>
<tbody>
<td colspan="2"><strong>核心信息：</strong></td>
<tr>
<td width="15%">网站开关：</td>
<td>
<input name="New_On" type="radio" value="0" <%If New_On=0 Then echo "checked=""checked""" End if%>> 开启
<input name="New_On" type="radio" value="1" <%If New_On=1 Then echo "checked=""checked""" End if%>> 关闭
</td>
</tr>
<tr>
<td>网站关闭说明：</td>
<td>
<input name="New_Info" type="text" value="<%=New_Info%>" style="width:100%">
</td>
</tr>
<tr>
<td width="15%">数据库类型：</td>
<td>
<input name="New_SqlType" type="radio" value="0" <%If New_SqlType=0 Then echo "checked=""checked""" End if%>> Access
<input name="New_SqlType" type="radio" value="1" <%If New_SqlType=1 Then echo "checked=""checked""" End if%>> Mssql
</td>
</tr>
<tr>
<td>Access路径：</td>
<td>
<input name="New_Access" type="text" value="<%=New_Access%>" style="width:100%">
</td>
</tr>
<tr>
<td>SQL数据库地址：</td>
<td>
<input name="New_Server" type="text" value="<%=New_Server%>" style="width:100%">
</td>
</tr>
<tr>
<td>SQL数据库名称：</td>
<td>
<input name="New_SQLName" type="text" value="<%=New_SQLName%>" style="width:100%">
</td>
</tr>
<tr >
<td>SQL数据库账号：</td>
<td>
<input name="New_SQLUser" type="text" value="<%=New_SQLUser%>" style="width:100%">
</td>
</tr>
<tr >
<td>SQL数据库密码：</td>
<td>
<input name="New_SQLpwd" type="text" value="<%=New_SQLpwd%>" style="width:100%">
</td>
</tr>
<tr>
<td>数据库出错信息：</td>
<td>
<input name="New_DataOver" type="text" value="<%=New_DataOver%>" style="width:100%">
</td>
</tr>
<td colspan="2"><strong>缓存加速：</strong></td>
<tr>
<td>客户端缓存：</td>
<td>
<label style="width:100%">
<select name="New_Cache" size="" style="width:100%">
<option value="0" <%if New_Cache=0 Then echo "selected='selected'"%>> 关闭</option>
<option value="1" <%if New_Cache=1 Then echo "selected='selected'"%>> 1分钟</option>
<option value="5" <%if New_Cache=5 Then echo "selected='selected'"%>> 5分钟</option>
<option value="10" <%if New_Cache=10 Then echo "selected='selected'"%>> 10分钟</option>
<option value="20" <%if New_Cache=20 Then echo "selected='selected'"%>> 20分钟</option>
<option value="30" <%if New_Cache=30 Then echo "selected='selected'"%>> 30分钟</option>
<option value="60" <%if New_Cache=60 Then echo "selected='selected'"%>> 1小时</option>
</select>
</label>
</td>
</tr>
<tr>
<td>模板缓存：</td>
<td>
<label style="width:100%">
<select name="New_FeCache" size="" style="width:100%">
<option value="0" <%if New_FeCache=0 Then echo "selected='selected'"%>> 关闭</option>
<option value="10" <%if New_FeCache=10 Then echo "selected='selected'"%>> 10分钟</option>
<option value="20" <%if New_FeCache=20 Then echo "selected='selected'"%>> 20分钟</option>
<option value="30" <%if New_FeCache=30 Then echo "selected='selected'"%>> 30分钟</option>
<option value="60" <%if New_FeCache=60 Then echo "selected='selected'"%>> 1小时</option>
<option value="120" <%if New_FeCache=120 Then echo "selected='selected'"%>> 2小时</option>
<option value="180" <%if New_FeCache=180 Then echo "selected='selected'"%>> 5小时</option>
<option value="720" <%if New_FeCache=720 Then echo "selected='selected'"%>> 12小时</option>
<option value="1440" <%if New_FeCache=1440 Then echo "selected='selected'"%>> 24小时</option>
</select>
</label>
</td>
</tr>
<tr>
<td>HTML压缩：</td>
<td>
<label style="width:100%">
<select name="New_Gzip" size="" style="width:100%">
<option value="0" <%if New_Gzip=0 Then echo "selected='selected'"%>> 开启</option>
<option value="1" <%if New_Gzip=1 Then echo "selected='selected'"%>> 关闭</option>
</select>
</label>
</td>
</tr>
<td colspan="2"><strong>前台相关：</strong></td>
<tr>
<td>模板目录：</td>
<td>
<%=Fun_FileList("New_Temp",Replace(New_Temp,"/",""),1)%>
</td>
</tr>
<tr>
<td>关键词高亮颜色：</td>
<td>
<input name="New_color" type="text" value="<%=New_color%>" id="color" style="200px"> <input type="button" id="colorpicker" value="打开取色器" /> 
</td>
</tr>
<td colspan="2"><strong>目录设置：</strong></td>
<tr>
<td>根目录：</td>
<td>
<input name="New_Root" type="text" value="<%=New_Root%>" style="width:100%">
</td>
</tr>
<tr>
<td>后台路径：</td>
<td>
<input name="New_admin" type="text" value="<%=New_admin%>" style="width:100%">
</td>
</tr>
</tr>
<td>文件缓存路径：</td>
<td>
<input name="New_CacheFe" type="text" value="<%=New_CacheFe%>" style="width:100%">
</td>
</tr>
<tr>
<td>文件上传目录：</td>
<td>
<input name="New_upLoad" type="text" value="<%=New_upLoad%>" style="width:100%">
</td>
</tr>
<td colspan="2"><strong>辅助设置：</strong></td>
<tr>
<td>文件上传大限制：</td>
<td>
<input name="New_Upsize" type="text" value="<%=New_Upsize%>" style="width:100%">
</td>
</tr>
<tr>
<td>404 信息：</td>
<td>
<input name="New_404" type="text" value="<%=New_404%>" style="width:100%">
</td>
</tr>
<tr>
<td>拦截信息：</td>
<td>
<input name="New_Close" type="text" value="<%=New_Close%>" style="width:100%">
</td>
</tr>
<tr>
<td>客户端信息：</td>
<td>
<textarea name="New_khd" style="width:100%" rows="10"><%=replace(New_khd,"<br>",chr(13))%></textarea>
</td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="提交" /> <input type="reset" value="重置" /> </td>
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