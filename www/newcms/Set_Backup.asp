<!--#include file="Inc/Class.asp" -->
<%
If Fun_GetId("type","get")="backup" Then
	dim ibackup:ibackup=backup()
	If ibackup=True Then InfoStr Inc_200,Inc_title,"数据库备份成功！","Set_Backup.asp" Else InfoStr Inc_200,Inc_title,ibackup,"Set_Backup.asp"
ElseIf Fun_GetId("type","get")="restore" AND Not Fun_Null(Fun_GetId("path","get")) Then
	dim irestore:irestore=restore()
	If irestore=True Then InfoStr Inc_200,Inc_title,"数据库还原成功！","Set_Backup.asp" Else InfoStr Inc_200,Inc_title,irestore,"Set_Backup.asp"
ElseIf Fun_GetId("type","get")="gzip" Then 
	dim imdbzip:imdbzip=mdbzip()
	If imdbzip=True Then InfoStr Inc_200,Inc_title,"数据库压缩成功！","Set_Backup.asp" Else InfoStr Inc_200,Inc_title,imdbzip,"Set_Backup.asp"
ElseIf Fun_GetId("type","get")="del" Then 
	Dim idelpath:idelpath=delpath()
	If idelpath=True Then InfoStr Inc_200,Inc_title,"数据库删除成功！","Set_Backup.asp" Else InfoStr Inc_200,Inc_title,idelpath,"Set_Backup.asp"
End If
Function filepath()
 On Error Resume Next
  Dim fso,f,f1,fc,a
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.GetFolder(Server.MapPath(New_Root&New_upLoad)&"/backup/")
  If Err.number<>0 Then Exit Function
  Set fc = f.Files
  For Each f1 in fc
  filepath=filepath&"<tr><td>"&f1.name&"</td><td>"&int(f1.size/1024/1024)&"M</td><td>"&f1.DateLastModified&"</td><td><div class=""action-buttons""><a class=""blue"" href=""?path="&f1.name&"&type=restore"" title=""恢复""><i class=""icon-zoom-in bigger-130""></i></a><a class=""red"" href=""?path="&f1.name&"&type=del"" onclick=""return confirm('请注意，删除后不可恢复！')"" class=""tooltip-error"" data-rel=""tooltip"" title=""删除""><i class=""icon-trash bigger-130""></i></a></div></td></tr>"
  Next
  If Fun_Null(filepath) Then echo "<td>没有备份文件</td>"
End Function
%><!DOCTYPE html>
<html>
<head>	
<title>数据管理<%=SEO_conn&Inc_CMD%></title>
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
<li>数据管理</li>
</div>
<div class="page-content">
<div class="row">
<div class="col-xs-12">
<div class="table-responsive">
<center>
<div class="infobox infobox-green infobox-small infobox-dark" style="text-align: center;margin: 0 auto;padding: 13px 0px 0px 0;font-size: 16px;">
<a href="?type=backup" style="color:#fff">一键备份</a>
</div>
<%If New_SqlType=0 Then%>
<div class="infobox infobox-blue infobox-small infobox-dark" style="text-align: center;margin: 0 auto;padding: 13px 0px 0px 0;font-size: 16px;">
<a href="?type=gzip" style="color:#fff">安全压缩</a>
</div>
<%End If%>
</center>
<div class="space-6"></div>
<form name="form" method="post" action="?type=del">
<table id="sample-table-2" class="table table-striped table-bordered table-hover">
<thead>
<tr>
<th>名称</th>
<th>体积</th>
<th><i class="icon-time bigger-110 hidden-480"></i>时间</th>
<th>操作</th>
</tr>
</thead>
<tbody>
<%=filepath()%>
</tbody>
</form>
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