<!--#include file="Inc/Class.asp" -->
<!DOCTYPE html>
<html>
<head>	
<title>清空缓存<%=SEO_conn&Inc_CMD%></title>
<!--#include file="Inc/Config/New_Head.asp" -->
<script type="text/javascript">
        function getAll()
        {
         var tit = document.getElementById("operAll");
         var inputs = document.getElementsByTagName("input");
         for(var i = 0; i < inputs.length; i++)
         {
          if(inputs[i].type == "checkbox")
          {
           if(tit.checked == true)
           {
            inputs[i].checked = true;
           }else{
            inputs[i].checked = false;
           }
          }
         }
        }
</script>
</head>
<body<%=Inc_Beijing%>>
<!--#include file="Inc/Config/New_Top.asp"-->
<div class="main-container" id="main-container">
<script type="text/javascript">try{ace.settings.check('main-container' , 'fixed')}catch(e){}</script>
<div class="main-container-inner"><a class="menu-toggler" id="menu-toggler" href="#"><span class="menu-text"></span></a>
<!--#include file="Inc/Config/New_sidebar.asp"-->
<div class="main-content">
<div class="breadcrumbs" id="breadcrumbs">
<script type="text/javascript">try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}</script>
<ul class="breadcrumb">
<li><i class="icon-home home-icon"></i><a href="<%=Inc_Index%>">首页</a></li>
<li>清空缓存</li>
</div>
<div class="page-content">
<div class="row">
<div class="col-xs-12">
<div class="table-responsive">
<table id="sample-table-2" class="table table-striped table-bordered table-hover">
<thead>
<tr>
<th>编号</th>
<th>缓存名称</th>
<th class="hidden-480"><i class="icon-time bigger-110 hidden-480"></i>删除时间</th>															
<th>处理状态</th>
</tr>
</thead>
<tbody>
<%
Function delcache()
	On Error Resume Next
	Dim fso,f,f1,fc,a,i
	Set fso = CreateObject("Scripting.FileSystemObject")
	Set f = fso.GetFolder(Server.MapPath(New_Root&New_upLoad&New_CacheFe&"/"))
	echo ErrDesc()
	Set fc = f.Files
	i=1
	For Each f1 in fc
	delcache=delcache&"<tr><td>"&i&"</td><td>"&f1.name&"</td><td>"&Now()&"</td> <td>删除成功"&"</td></tr>"
	fso.DeleteFile(Server.MapPath(New_Root&New_upLoad&New_CacheFe&"/"&f1.name))
	i=i+1
	Next
	If Fun_Null(delcache) Then echo "<tr><td>没有缓存文件！</td></tr>"
End Function
echo delcache()
%>
</tbody>
</table>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="icon-double-angle-up icon-only bigger-110"></i></a>
</div>
</body>
</html>