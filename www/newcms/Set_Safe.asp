<!--#include file="Inc/Class.asp" -->
<%
If Fun_GetId("type","get")="edit" Then
a=Fun_File(New_Root&"/inc/New_Config.asp")
a=reInfo(a,"Safe_Allq=","'",Fun_GetId("Safe_Allq","post"))
a=reInfo(a,"Safe_Lailunum=","'",Fun_GetId("Safe_Lailunum","post"))
a=reInfo(a,"Safe_Lailu=","'",Replace(Replace(Fun_GetId("Safe_Lailu","post"),chr(13),"<br>"),Chr(10),""))
a=reInfo(a,"Safe_ipnum=","'",Fun_GetId("Safe_ipnum","post"))
a=reInfo(a,"Safe_ip=","'",Replace(Replace(Fun_GetId("Safe_ip","post"),chr(13),"<br>"),Chr(10),""))
a=reInfo(a,"Safe_khdnum=","'",Fun_GetId("Safe_khdnum","post"))
a=reInfo(a,"Safe_khd=","'",Replace(Replace(Fun_GetId("Safe_khd","post"),chr(13),"<br>"),Chr(10),""))
a=reInfo(a,"Safe_Allh=","'",Fun_GetId("Safe_Allh","post"))
a=reInfo(a,"Safe_hLailunum=","'",Fun_GetId("Safe_hLailunum","post"))
a=reInfo(a,"Safe_hLailu=","'",Replace(Replace(Fun_GetId("Safe_hLailu","post"),chr(13),"<br>"),Chr(10),""))
a=reInfo(a,"Safe_hipnum=","'",Fun_GetId("Safe_hipnum","post"))
a=reInfo(a,"Safe_hip=","'",Replace(Replace(Fun_GetId("Safe_hip","post"),chr(13),"<br>"),Chr(10),""))
a=reInfo(a,"Safe_hkhdnum=","'",Fun_GetId("Safe_hkhdnum","post"))
a=reInfo(a,"Safe_hkhd=","'",Replace(Replace(Fun_GetId("Safe_hkhd","post"),chr(13),"<br>"),Chr(10),""))
Fun_FeText New_Root&"/inc/New_Config.asp",a
InfoStr Inc_200,Inc_title,"安全防护信息修改成功！",Inc_Safe
End If
%><!DOCTYPE html>
<html>
<head>	
<title>安全防护<%=SEO_conn&Inc_CMD%></title>
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
<li>安全防护</li>
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
<tr>
<td colspan="2"><strong>前台防护：</strong></td>
</tr>
<tr>
<td width="15%">前台防护总开关：</td>
<td>
<input name="Safe_Allq" type="radio" value="0" <%If Safe_Allq=0 Then echo "checked=""checked""" End if%>> 开启 
<input name="Safe_Allq" type="radio" value="1" <%If Safe_Allq=1 Then echo "checked=""checked""" End if%>> 关闭
</td>
</tr>
<tr>
<td width="15%">IP拦截开关：</td>
<td>
<input name="Safe_ipnum" type="radio" value="0" <%If Safe_ipnum=0 Then echo "checked=""checked""" End if%>> 开启 
<input name="Safe_ipnum" type="radio" value="1" <%If Safe_ipnum=1 Then echo "checked=""checked""" End if%>> 关闭
</td>
</tr>
<tr>
<td>拦截IP信息：</td>
<td>
<textarea name="Safe_ip" style="width:100%" rows="10"><%=replace(Safe_ip,"<br>",chr(13))%></textarea>
</td>
</tr>
<tr>
<td width="15%">客户端拦截开关：</td>
<td>
<input name="Safe_khdnum" type="radio" value="0" <%If Safe_khdnum=0 Then echo "checked=""checked""" End if%>> 开启 
<input name="Safe_khdnum" type="radio" value="1" <%If Safe_khdnum=1 Then echo "checked=""checked""" End if%>> 关闭
</td>
</tr>
<tr>
<td>拦截客户端信息：</td>
<td>
<textarea name="Safe_khd" style="width:100%" rows="10"><%=replace(Safe_khd,"<br>",chr(13))%></textarea>
</td>
</tr>
<tr>
<td width="15%">来路拦截开关：</td>
<td>
<input name="Safe_Lailunum" type="radio" value="0" <%If Safe_Lailunum=0 Then echo "checked=""checked""" End if%>> 开启 
<input name="Safe_Lailunum" type="radio" value="1" <%If Safe_Lailunum=1 Then echo "checked=""checked""" End if%>> 关闭
</td>
</tr>
<tr>
<td>拦截来路信息：</td>
<td>
<textarea name="Safe_Lailu" style="width:100%" rows="10"><%=replace(Safe_Lailu,"<br>",chr(13))%></textarea>
</td>
</tr>
<tr>
<td colspan="2"><strong>后台授权：</strong></td>
</tr>
<tr>
<td width="15%">后台授权总开关：</td>
<td>
<input name="Safe_Allh" type="radio" value="0" <%If Safe_Allh=0 Then echo "checked=""checked""" End if%>> 开启 
<input name="Safe_Allh" type="radio" value="1" <%If Safe_Allh=1 Then echo "checked=""checked""" End if%>> 关闭
</td>
</tr>
<tr>
<td width="15%">IP授权开关：</td>
<td>
<input name="Safe_hipnum" type="radio" value="0" <%If Safe_hipnum=0 Then echo "checked=""checked""" End if%>> 开启 
<input name="Safe_hipnum" type="radio" value="1" <%If Safe_hipnum=1 Then echo "checked=""checked""" End if%>> 关闭
</td>
</tr>
<tr>
<td>授权IP信息：</td>
<td>
<textarea name="Safe_hip" style="width:100%" rows="10"><%=replace(Safe_hip,"<br>",chr(13))%></textarea>
</td>
</tr>
<tr>
<td width="15%">客户端授权开关：</td>
<td>
<input name="Safe_hkhdnum" type="radio" value="0" <%If Safe_hkhdnum=0 Then echo "checked=""checked""" End if%>> 开启 
<input name="Safe_hkhdnum" type="radio" value="1" <%If Safe_hkhdnum=1 Then echo "checked=""checked""" End if%>> 关闭
</td>
</tr>
<tr>
<td>授权客户端信息：</td>
<td>
<textarea name="Safe_hkhd" style="width:100%" rows="10"><%=replace(Safe_hkhd,"<br>",chr(13))%></textarea>
</td>
</tr>
<tr>
<td width="15%">来路授权开关：</td>
<td>
<input name="Safe_hLailunum" type="radio" value="0" <%If Safe_hLailunum=0 Then echo "checked=""checked""" End if%>> 开启 
<input name="Safe_hLailunum" type="radio" value="1" <%If Safe_hLailunum=1 Then echo "checked=""checked""" End if%>> 关闭
</td>
</tr>
<tr>
<td>授权来路信息：</td>
<td>
<textarea name="Safe_hLailu" style="width:100%" rows="10"><%=replace(Safe_hLailu,"<br>",chr(13))%></textarea>
</td>
</tr>
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