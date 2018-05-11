<!--#include file="Inc/Class.asp" -->
<%  
If Fun_GetId("type","get") = "add" Then 
If Fun_Null(Fun_GetId("ad","post")) Then InfoStr Inc_500,Inc_Title,"请填写广告代码！","back"
If Fun_Null(Fun_GetId("ad1","post")) Then InfoStr Inc_500,Inc_Title,"请填写默认广告！","back"
If Fun_Null(Fun_GetId("strtime","post")) Then InfoStr Inc_500,Inc_Title,"请填写开始时间！","back"
Dim itime:If Fun_GetID("overtime","post")="" Then itime="" Else itime=",overtime"
AddData "{Acc}AD","ad,ad1,addtime|"&Now()&",edittime|"&Now()&",strtime"&itime&",ip|"&Fun_GetIP&",display,i|0,ii|0"
InfoStr Inc_200,Inc_title,"广告创建成功！",Inc_ADlist
End If
%><!DOCTYPE html>
<html>
<head>
<title>新增广告<%=SEO_Conn&Inc_CMD%></title>
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
<li class="active">新增广告</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<form method="post" action="?type=add" class="article">
<table class="table table-striped table-bordered table-hover">
<tr>
<td width="15%">广告代码：</td>
<td><textarea style="width:100%" name="ad" rows="5"></textarea></td>
</tr>
<tr>
<td>开始时间：</td>
<td><input name="strtime" type="text" value="<%=Now()%>" style="width: 100%;"/></td>
</tr>
<tr>
<td>结束时间：</td>
<td><input name="overtime" type="text" value="" style="width: 100%;"/></td>
</tr>
<td>默认广告：</td>
<td><textarea style="width:100%" name="ad1" rows="5"></textarea></td>
</tr>
<tr>
<td>显示状态：</td>
<td>
<label style="width:100%">
<select name="display" size="" style="width:100%">
<option value="0"> 正常</option>
<option value="1"> 关闭</option>
</select>
</label>
</td>
</tr>
<tr>
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