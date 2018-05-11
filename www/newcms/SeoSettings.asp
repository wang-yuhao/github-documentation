<!--#include file="Inc/Class.asp" -->
<%
If Fun_GetId("type","get")="edit" Then
dim linkmip,linkwap
linkmip=New_Root&New_Tempfile&tempall&New_Tempf&"/mip/"
linkwap=New_Root&New_Tempfile&tempall&New_Tempf&"/wap/"
If (Not StrPath(linkmip) AND Fun_GetId("SEO_Post","post")=3) OR (Not StrPath(linkmip) AND Fun_GetId("SEO_Post","post")=4) Then InfoStr Inc_500,Inc_title,"请确定MIP模板存在，使用目录【"&linkmip&"】！","back"
If Fun_GetId("SEO_Wap","post")=0 AND Not StrPath(linkwap) Then InfoStr Inc_500,Inc_title,"请确定WAP模板存在，使用目录【"&linkwap&"】！","back"
If Fun_GetId("SEO_301","post")=0 AND Fun_Null(Fun_GetId("SEO_Url","post")) Then InfoStr Inc_500,Inc_title,"请输入301转向的域名！","back"
a=Fun_File(New_Root&"/inc/New_Config.asp")
a=reInfo(a,"SEO_ReWrite=","'",Fun_GetId("SEO_ReWrite","post"))
a=reInfo(a,"SEO_301=","'",Fun_GetId("SEO_301","post"))
a=reInfo(a,"SEO_Url=","'",Fun_GetId("SEO_Url","post"))
a=reInfo(a,"SEO_Post=","'",Fun_GetId("SEO_Post","post"))
a=reInfo(a,"SEO_Site=","'",Fun_GetId("SEO_Site","post"))
a=reInfo(a,"SEO_token=","'",Fun_GetId("SEO_token","post"))
a=reInfo(a,"SEO_Bak=","'",Fun_GetId("SEO_Bak","post"))
a=reInfo(a,"SEO_Conn=","'",Fun_GetId("SEO_Conn","post"))
a=reInfo(a,"SEO_Nav=","'",Fun_GetId("SEO_Nav","post"))
a=reInfo(a,"SEO_Size=","'",Fun_GetId("SEO_Size","post"))
a=reInfo(a,"SEO_ReInfo=","'|",Replace(Replace(Replace(Fun_GetId("SEO_ReInfo","post"),chr(10),""),chr(13),"<br>"),"""","'"))
a=reInfo(a,"SEO_ReNum=","'",Fun_GetId("SEO_ReNum","post"))
a=reInfo(a,"SEO_DATEId=","'",Fun_GetId("SEO_DATEId","post"))
a=reInfo(a,"SEO_search=","'",Fun_GetId("SEO_search","post"))
a=reInfo(a,"SEO_tags=","'",Fun_GetId("SEO_tags","post"))
a=reInfo(a,"SEO_date=","'",Fun_GetId("SEO_date","post"))
a=reInfo(a,"SEO_desc=","'",Fun_GetId("SEO_desc","post"))
a=reInfo(a,"SEO_http=","'",Fun_GetId("SEO_http","post"))
a=reInfo(a,"SEO_author=","'",Fun_GetId("SEO_author","post"))
a=reInfo(a,"SEO_Wap=","'",Fun_GetId("SEO_Wap","post"))
Fun_FeText "/robots.txt",Fun_GetId("robots","post")
Fun_FeText New_Root&"/inc/New_Config.asp",a
InfoStr Inc_200,Inc_title,"Seo信息修改成功！",Inc_SeoSettings
End If
%><!DOCTYPE html>
<html>
<head>	
<title>SEO优化<%=SEO_conn&Inc_CMD%></title>
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
<li>SEO优化</li>
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
<td width="15%">路径选择：</td>
<td>
<input name="SEO_ReWrite" type="radio" value="0" <%If SEO_ReWrite=0 Then echo "checked=""checked""" End if%>> 伪静态 
<input name="SEO_ReWrite" type="radio" value="1" <%If SEO_ReWrite=1 Then echo "checked=""checked""" End if%>> 纯动态
 &nbsp;[开启前请配置好伪静态规则,并且切换成对应的地址]
</td>
</tr>
<tr>
<td width="15%">地址格式：</td>
<td>
<input name="SEO_DATEId" type="radio" value="0" <%If SEO_DATEId=0 Then echo "checked=""checked""" End if%>> ID型 
<input name="SEO_DATEId" type="radio" value="1" <%If SEO_DATEId=1 Then echo "checked=""checked""" End if%>> 时间
 &nbsp;[开启后会统一URL地址格式，当开启时间则访问id型地址301到时间型地址]
</td>
</tr>
<tr >
<td>301 跳转：</td>
<td>
<input name="SEO_301" type="radio" value="0" <%If SEO_301=0 Then echo "checked=""checked""" End if%>> 开启 
<input name="SEO_301" type="radio" value="1" <%If SEO_301=1 Then echo "checked=""checked""" End if%>> 关闭 
 &nbsp;[集中首页权重]
</td>
</tr>
<tr >
<td>301 域名：</td>
<td>
<input name="SEO_Url" type="text" value="<%=SEO_Url%>"  style="width: 45%;">
</td>
</tr>
<tr>
<td>使用协议：</td>
<td>
<input name="SEO_http" type="radio" value="http://" <%If SEO_http="http://" Then echo "checked=""checked""" End if%>> http 
<input name="SEO_http" type="radio" value="https://" <%If SEO_http="https://" Then echo "checked=""checked""" End if%>> https 
</td>
</tr>
<tr >
<td>手机端跳转：</td>
<td>
<input name="SEO_Wap" type="radio" value="0" <%If SEO_Wap=0 Then echo "checked=""checked""" End if%>> 开启 
<input name="SEO_Wap" type="radio" value="1" <%If SEO_Wap=1 Then echo "checked=""checked""" End if%>> 关闭 
 &nbsp;[开启后当手机访问时，会自动使用<%=Fun_FileLink%>wap/模版，请确保存在，否则会出错！]
</td>
</tr>
<tr>
<td>主动推送：</td>
<td>
<label for="SEO_Post" style="width: 100%;">
<select name="SEO_Post" style="width: 100%;">
<option value="0"<%If SEO_Post=0 Then echo " selected=""selected"""%>> 取消推送</option>
<option value="1"<%If SEO_Post=1 Then echo " selected=""selected"""%>> 普通推送</option>
<option value="2"<%If SEO_Post=2 Then echo " selected=""selected"""%>> 原创推送</option>
<option value="3"<%If SEO_Post=3 Then echo " selected=""selected"""%>> 普通推送,同时推送MIP</option>
<option value="4"<%If SEO_Post=4 Then echo " selected=""selected"""%>> 原创推送,同时推送MIP</option>
</select>
</label>
</td>
</tr>
<tr >
<td>验证域名：</td>
<td>
<input name="SEO_Site" type="text" value="<%=SEO_Site%>" style="width: 45%;">
 &nbsp;[在站长平台验证的站点，比如www.baidu.com]
</td>
</tr>
<tr >
<td>准入密钥：</td>
<td>
<input name="SEO_token" type="text" value="<%=SEO_token%>" style="width: 45%;"> 
 &nbsp;[在站长平台申请的推送用的准入密钥]
</td>
</tr>
<tr>
<td>文件后缀：</td>
<td>
<label for="SEO_Bak" style="width: 100%;">
<select name="SEO_Bak" size="" style="width: 100%;">
<option <%If SEO_Bak=".shtml" Then echo " selected=""selected"" "%>value=".html"> .html</option>	
<option <%If SEO_Bak=".shtml" Then echo " selected=""selected"" "%>value=".htm"> .htm</option>	
<option <%If SEO_Bak=".shtml" Then echo " selected=""selected"" "%>value=".shtml"> .shtml</option>	
<option <%If SEO_Bak=".shtm" Then echo " selected=""selected"" "%>value=".shtm"> .shtm</option>	
<option <%If SEO_Bak=".asp" Then echo " selected=""selected"" "%>value=".asp"> .asp</option>	
<option <%If SEO_Bak=".aspx" Then echo " selected=""selected"" "%>value=".shtm"> .aspx</option>
<option <%If SEO_Bak=".jsp" Then echo " selected=""selected"" "%>value=".jsp"> .jsp</option>
<option <%If SEO_Bak=".php" Then echo " selected=""selected"" "%>value=".shtm"> .php</option>					
</select>
</label>
</td>
</tr>
<tr>
<td>智能摘要：</td>
<td>
<input name="SEO_desc" type="text" value="<%=SEO_desc%>" style="width: 45%;"> 
 &nbsp;[为空则关闭，请输入数字]
</td>
</tr>
<tr>
<td>标签地址：</td>
<td>
<label for="SEO_Tags" style="width: 100%;">
<select name="SEO_Tags" size="" style="width: 100%;">
<option <%If SEO_Tags="/?tags=[type:id]&page=[type:page]&type=[type:class]" Then echo " selected=""selected"" "%>value="/?tags=[type:id]&page=[type:page]&type=[type:class]"> 动态路径：/?tags=标签&page=2&type=wap</option>
<option <%If SEO_Tags="/tags/[type:id]/[type:page]/[type:class]/" Then echo " selected=""selected"" "%>value="/tags/[type:id]/[type:page]/[type:class]/"> 静态路径：/tags/标签/2/wap/</option>	
<option <%If SEO_Tags="/tags/[type:id]/[type:page]/[type:class][type:html]" Then echo " selected=""selected"" "%>value="/tags/[type:id]/[type:page]/[type:class][type:html]"> 静态路径：/tags/标签/2/wap<%=SEO_Bak%></option>	
<option <%If SEO_Tags="/tags-[type:id]-[type:page]-[type:class]/" Then echo " selected=""selected"" "%>value="/tags-[type:id]-[type:page]-[type:class]/"> 静态路径：/tags-标签-2-wap/</option>	
<option <%If SEO_Tags="/tags-[type:id]-[type:page]-[type:class][type:html]" Then echo " selected=""selected"" "%>value="/tags-[type:id]-[type:page]-[type:class][type:html]"> 静态路径：/tags-标签-2-wap<%=SEO_Bak%></option>						
</select>
</label>
</td>
</tr>
<tr>
<td>日期地址：</td>
<td>
<label for="SEO_Date" style="width: 100%;">
<select name="SEO_Date" size="" style="width: 100%;">
<option <%If SEO_Date="/?date=[type:id]&page=[type:page]&type=[type:class]" Then echo " selected=""selected"" "%>value="/?date=[type:id]&page=[type:page]&type=[type:class]"> 动态路径：/?date=20161001&page=2&type=wap</option>
<option <%If SEO_Date="/date/[type:id]/[type:page]/[type:class]/" Then echo " selected=""selected"" "%>value="/date/[type:id]/[type:page]/[type:class]/"> 静态路径：/date/20161001/2/wap/</option>	
<option <%If SEO_Date="/date/[type:id]/[type:page]/[type:class][type:html]" Then echo " selected=""selected"" "%>value="/date/[type:id]/[type:page]/[type:class][type:html]"> 静态路径：/date/20161001/2/wap<%=SEO_Bak%></option>	
<option <%If SEO_Date="/date-[type:id]-[type:page]-[type:class]/" Then echo " selected=""selected"" "%>value="/date-[type:id]-[type:page]-[type:class]/"> 静态路径：/date-20161001-2-wap/</option>	
<option <%If SEO_Date="/date-[type:id]-[type:page]-[type:class][type:html]" Then echo " selected=""selected"" "%>value="/date-[type:id]-[type:page]-[type:class][type:html]"> 静态路径：/date-20161001-2-wap<%=SEO_Bak%></option>						
</select>
</label>
</td>
</tr>
<tr>
<td>搜索地址：</td>
<td>
<label for="SEO_search" style="width: 100%;">
<select name="SEO_search" size="" style="width: 100%;">
<option <%If SEO_search="/?s=[type:id]&page=[type:page]&type=[type:class]" Then echo " selected=""selected"" "%>value="/?s=[type:id]&page=[type:page]&type=[type:class]"> 动态路径：/?s=关键词&page=2&type=wap</option>
<option <%If SEO_search="/s/[type:id]/[type:page]/[type:class]/" Then echo " selected=""selected"" "%>value="/s/[type:id]/[type:page]/[type:class]/"> 静态路径：/s/关键词/2/wap/</option>	
<option <%If SEO_search="/s/[type:id]/[type:page]/[type:class][type:html]" Then echo " selected=""selected"" "%>value="/s/[type:id]/[type:page]/[type:class][type:html]"> 静态路径：/s/关键词/2/wap<%=SEO_Bak%></option>	
<option <%If SEO_search="/s-[type:id]-[type:page]-[type:class]/" Then echo " selected=""selected"" "%>value="/s-[type:id]-[type:page]-[type:class]/"> 静态路径：/s-关键词-2-wap/</option>	
<option <%If SEO_search="/s-[type:id]-[type:page]-[type:class][type:html]" Then echo " selected=""selected"" "%>value="/s-[type:id]-[type:page]-[type:class][type:html]"> 静态路径：/s-关键词-2-wap<%=SEO_Bak%></option>						
</select>
</label>
</td>
<tr>
<td>作者地址：</td>
<td>
<label for="SEO_author" style="width: 100%;">
<select name="SEO_author" size="" style="width: 100%;">
<option <%If SEO_author="/?author=[type:id]&page=[type:page]&type=[type:class]" Then echo " selected=""selected"" "%>value="/?author=[type:id]&page=[type:page]&type=[type:class]"> 动态路径：/?author=作者&page=2&type=wap</option>
<option <%If SEO_author="/author/[type:id]/[type:page]/[type:class]/" Then echo " selected=""selected"" "%>value="/author/[type:id]/[type:page]/[type:class]/"> 静态路径：/author/作者/2/wap/</option>	
<option <%If SEO_author="/author/[type:id]/[type:page]/[type:class][type:html]" Then echo " selected=""selected"" "%>value="/author/[type:id]/[type:page]/[type:class][type:html]"> 静态路径：/author/作者/2/wap<%=SEO_Bak%></option>	
<option <%If SEO_author="/author-[type:id]-[type:page]-[type:class]/" Then echo " selected=""selected"" "%>value="/author-[type:id]-[type:page]-[type:class]/"> 静态路径：/author-作者-2-wap/</option>	
<option <%If SEO_author="/author-[type:id]-[type:page]-[type:class][type:html]" Then echo " selected=""selected"" "%>value="/author-[type:id]-[type:page]-[type:class][type:html]"> 静态路径：/author-作者-2-wap<%=SEO_Bak%></option>						
</select>
</label>
</td>
</tr>
<tr>
<td>连接字符：</td>
<td>
<input name="SEO_Conn" type="text" value="<%=SEO_Conn%>" style="width: 45%;"> &nbsp;[调用标签{new:conn}，网站连接字符]
</td>
</tr>
<tr>
<td>导航字符：</td>
<td>
<input name="SEO_Nav" type="text" value="<%=SEO_Nav%>" style="width: 45%;"> &nbsp;[调用标签{new:navconn}，面包屑导航连接字符]
</td>
</tr>
<tr>
<td>输出数量：</td>
<td>
<input name="SEO_Size" type="text" value="<%=SEO_Size%>" > &nbsp;[调用标签{new:size}，一般用于列表调用数量]
</td>
</tr>
<tr>
<td>替换开关：</td>
<td>
<input name="SEO_ReNum" type="radio" value="0" <%If SEO_ReNum=0 Then echo "checked=""checked""" End if%>> 开启 
<input name="SEO_ReNum" type="radio" value="1" <%If SEO_ReNum=1 Then echo "checked=""checked""" End if%>> 关闭 
 &nbsp;[开启后添加内容会替换，原内容|替换内容，通常用于内容自动加链接，伪原创等]
</td>
</tr>
<tr >
<td>内容替换：</td>
<td>
<textarea name="SEO_ReInfo" style="width:100%" rows="10"><%=replace(SEO_ReInfo,"<br>",chr(13))%></textarea>
</td>
</tr>
<tr >
<td>Robots：</td>
<td>
<textarea name="robots" style="width:100%" rows="10"><%=Fun_File("/robots.txt")%></textarea>
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