<!--#include file="Inc/Class.asp" -->
<%
If Fun_GetId("type","get")="edit" AND Not Fun_Null(Fun_GetId("id","get")) Then 
If Fun_Null(Fun_GetId("ad","post")) Then Style Inc_500,Inc_Title,"请填写广告代码！","back"
If Fun_Null(Fun_GetId("ad1","post")) Then Style Inc_500,Inc_Title,"请填写默认广告！","back"
If Fun_Null(Fun_GetId("strtime","post")) Then Style Inc_500,Inc_Title,"请填写开始时间！","back"
Dim itime:If Fun_GetID("overtime","post")="" Then itime="" Else itime=",overtime"
EditData "{Acc}AD",Fun_GetId("id","get"),"ad,ad1,edittime|"&Now()&",strtime"&itime&",ip|"&Fun_GetIP&""
InfoStr Inc_200,Inc_title,"广告修改成功！",Inc_ADlist
End If

Dim Id,ad,ad1,addtime,display
ReadData "{Acc}AD",Fun_GetId("id","get"),"id,ad,ad1,addtime|strtime,itime|overtime,display"
%>
<!DOCTYPE html>
<html>
<head>
<title>修改账号<%=SEO_Conn&Inc_CMD%></title>
<!--#include file="Inc/Config/New_Head.asp" -->
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
<li class="active">修改账号</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<form method="post"  action="?type=edit&id=<%=Id%>" class="article">
<table class="table table-striped table-bordered table-hover">
<tr>
<td width="15%">广告代码：</td>
<td><textarea style="width:100%" name="ad" rows="5"><%=ad%></textarea></td>
</tr>
<tr>
<td>开始时间：</td>
<td><input name="strtime" type="text" value="<%=addtime%>" style="width: 100%;"/></td>
</tr>
<tr>
<td>结束时间：</td>
<td><input name="overtime" type="text" value="<%=itime%>" style="width: 100%;"/></td>
</tr>
<td>默认广告：</td>
<td><textarea style="width:100%" name="ad1" rows="5"><%=ad1%></textarea></td>
</tr>
<tr>
<td>状态：</td>
<td>
<label style="width:100%">
<select name="display" size="" style="width:100%">
<option value="0" <%if display=0 Then echo "selected='selected'"%>> 正常</option>
<option value="1" <%if display=1 Then echo "selected='selected'"%>> 关闭</option>
</select>
</label>
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