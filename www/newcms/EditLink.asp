<!--#include file="Inc/Class.asp" -->
<%
If Fun_GetId("type","get")="edit" AND Not Fun_Null(Fun_GetId("id","get")) Then  
If Fun_Null(Fun_GetId("name","post")) then InfoStr Inc_500,Inc_title,"友链名称错误！","back"
If Not Fun_Url(Fun_GetId("url","post")) then InfoStr Inc_500,Inc_title,"友链网址错误！","back"
EditData "{Acc}link",Fun_GetId("id","get"),"name,url,logo,ico,qq,sort,display,address,idesc,Nofollow,edittime|"&Now()&",ip|"&Fun_Getip
InfoStr Inc_200,Inc_title,"友链修改成功！",Inc_linkList
End If
dim id,names,url,logo,ico,qq,sort,display,address,idesc,Nofollow
ReadData "{Acc}link",Fun_GetId("id","get"),"id,name,url,logo,ico,qq,sort,display,address,idesc,Nofollow"
%><!DOCTYPE html>
<html>
<head>	
<title>修改友链<%=SEO_conn&Inc_CMD%></title>
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
<li>修改链接</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<div class="col-xs-12">
<div class="table-responsive">
<form name="form" method="post" action="?type=edit&id=<%=id%>" class="article">
<table id="sample-table-2" class="table table-striped table-bordered table-hover">
<thead>
</thead>
<tbody>
<tr>
<td width="15%">网站名称：</td>
<td width=""><input name="name" value="<%=name%>" type="text" style="width:100%;" /></td>
</tr>
<tr>
<td>网站地址：</td>
<td><input name="url" type="text" value="<%=url%>" style="width:100%;" /></td>
</tr>
<tr>
<td>网站logo：</td>
<td><input name="logo" type="text" value="<%=logo%>" style="width:100%;" /></td>
</tr>
<tr>
<td>网站ico：</td>
<td><input name="ico" type="text" value="<%=ico%>" style="width:100%;" /></td>
</tr>
<tr>
<td>联系方式：</td>
<td><input name="qq" type="text" value="<%=qq%>" style="width:100%;" /></td>
</tr>
<tr >
<td>网站排序：</td>
<td><input name="sort" type="text" value="<%=sort%>" style="width:100%;" /></td>
</tr>
<td>是否显示：</td>
<td>
<label for="display" style="width: 100%;">
<select name="display" size="" style="width: 100%;">
<option value="0" <%if display=0 Then echo "selected='selected'" End if%>> 显示</option>	
<option value="1" <%if display=1 Then echo "selected='selected'" End if%>> 隐藏</option>	           
</select>
</label>
</td>
</tr>
<tr>
<td>显示分组：</td>
<td>
<label for="address" style="width: 100%;">
<select name="address" size="" style="width: 100%;">
<option value="0" <%if address=0 Then echo "selected='selected'"%>> 0</option>	
<option value="1" <%if address=1 Then echo "selected='selected'"%>> 1</option>	
<option value="2" <%if address=2 Then echo "selected='selected'"%>> 2</option>	
<option value="3" <%if address=3 Then echo "selected='selected'"%>> 3</option>
<option value="4" <%if address=4 Then echo "selected='selected'"%>> 4</option>	
<option value="5" <%if address=5 Then echo "selected='selected'"%>> 5</option>	
<option value="6" <%if address=6 Then echo "selected='selected'"%>> 6</option>	
<option value="7" <%if address=7 Then echo "selected='selected'"%>> 7</option>	
<option value="8" <%if address=8 Then echo "selected='selected'"%>> 8</option>	
<option value="9" <%if address=9 Then echo "selected='selected'"%>> 9</option>								
</select>
</label>
</td>
</tr>
<tr>
<td>网站介绍：</td>
<td><textarea name="idesc" cols="" rows="3" style="width:100%;"><%=idesc%></textarea></td>
</tr>
<tr>
<td>NoFollow：</td>
<td>
<label for="NoFollow" style="width: 100%;">
<select name="NoFollow" size="" style="width: 100%;">
<option value="" <%if Instr(NoFollow,"nofollow") = 0 Then echo "selected='selected'" End if%>> 否</option>	
<option value='rel="nofollow"' <%if Instr(NoFollow,"nofollow") > 0 Then echo "selected='selected'" End if%>> 是</option>	           
</select>
</label>
<tr>
<td>提交重置：</td>
<td>
<input type="submit" value="提交" /> <input type="reset" value="重置" />
</td>
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
</body>
</html>