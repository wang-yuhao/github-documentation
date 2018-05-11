<!--#include file="Inc/Class.asp" -->
<%
If Fun_URLID("type") = "add" Then 
If Fun_null(Fun_GetId("name","post")) Then InfoStr Inc_500,Inc_title,"未填写标签名称！","back"
If Not Fun_Num(Fun_GetId("stri","post")) Then InfoStr Inc_500,Inc_title,"点击数量只能为数字！","back"
StrTags Fun_GETID("name","post")
InfoStr Inc_200,Inc_title,"标签添加成功！",Inc_TagsList
End If
%><!DOCTYPE html>
<html>
<head>
<title>添加标签<%=SEO_conn&Inc_CMD%></title>
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
<li class="active">添加标签</li>
</ul>
<div class="nav-search" id="nav-search">
<form class="form-search">
<span class="input-icon">
<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
<i class="icon-search nav-search-icon"></i>
</span>
</form>
</div>
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
<td width="15%">标签名称：</td>
<td><input name="name" type="text" placeholder="多个请用，隔开！" style="width: 100%;"/></td>
</tr>
<td width="15%">浏览数量：</td>
<td><input name="stri" class="ke-input-text" type="text" id="url" value="0" style="width: 100%;"/></td>
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