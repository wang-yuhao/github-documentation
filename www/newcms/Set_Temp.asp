<!--#include file="Inc/Class.asp" -->
<%
dim path:If Fun_Null(Fun_GetID("path","get")) Then path="" Else path=request.QueryString("path")
dim ipath:If Fun_Null(path) Then ipath=path Else ipath=path&"/"
If Fun_GetID("type","get")="temp" Then
Fun_FeText New_Root&New_Tempfile&New_Temp&"/"&path,Replace(Fun_GetId("temp","post"),"&lt;/textarea&gt;","</textarea>")
InfoStr Inc_200,Inc_title,"模版修改成功！",Inc_Temp&"?path="&path&"&type=edit&"
ElseIf Fun_GetID("type","get")="del" Then
dim idelfile:idelfile=delfile(New_Root&New_Tempfile&New_Temp&"/"&path)
If idelfile Then InfoStr Inc_200,Inc_title,"文件删除成功！","back" Else InfoStr Inc_200,Inc_title,idelfile,"back"
End If


Function filepath()
 On Error Resume Next
  Dim fso,f,f1,fc,a,fd
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.GetFolder(Server.MapPath(New_Root&New_Tempfile&New_Temp&"/"&path))
  If Err.number<>0 Then Exit Function
  Set fc = f.Files
  Set fd = f.Subfolders
  For Each f1 in fd
  filepath=filepath&"<tr><td><a href=""?path="&ipath&f1.name&""">"&f1.name&"</a></td><td>目录</td><td>"&f1.DateLastModified&"</td><td><div class=""action-buttons""><a class=""blue"" href=""?path="&ipath&f1.name&""" title=""进入目录""><i class=""icon-zoom-in bigger-130""></i></a></div></td></tr>"
  Next
  For Each f1 in fc
  filepath=filepath&"<tr><td><a href=""?path="&ipath&f1.name&"&type=edit"">"&f1.name&"</a></td><td>文件</td><td>"&f1.DateLastModified&"</td><td><div class=""action-buttons""><a class=""blue"" href=""?path="&ipath&f1.name&"&type=edit"" title=""编辑""><i class=""icon-zoom-in bigger-130""></i></a><a class=""red"" href=""?path="&ipath&f1.name&"&type=del"" onclick=""return confirm('请注意，删除后不可恢复！')"" class=""tooltip-error"" data-rel=""tooltip"" title=""删除""><i class=""icon-trash bigger-130""></i></a></div></td></tr>"
  Next
  If Fun_Null(filepath) Then echo "<td>没有文件</td>"
End Function
%><!DOCTYPE html>
<html>
<head>	
<title>模版管理<%=SEO_conn&Inc_CMD%></title>
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
<li>模版管理</li>
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
<div class="col-xs-12">
<div class="table-responsive">
<div class="space-6"></div>
<%If Fun_GetID("type","get")="edit" Then%>
<form name="form" method="post" action="?type=temp&path=<%=path%>">
<textarea name="temp" type=""text"" style="width:100%;height:700px;"><%=Replace(Fun_File(New_Root&New_Tempfile&New_Temp&"/"&path),"</textarea>","&lt;/textarea&gt;")%></textarea>
<input type="submit" value="修改" /> <input value="返回" onclick="javascript:history.back();" type="submit">
<%else%>
<center>
<div class="infobox infobox-green infobox-small infobox-dark" style="text-align: center;margin: 0 auto;padding: 13px 0px 0px 0;font-size: 16px;">
<a href="<%=Inc_Temp%>" style="color:#fff">顶级目录</a>
</div>
<div class="infobox infobox-red infobox-small infobox-dark" style="text-align: center;margin: 0 auto;padding: 13px 0px 0px 0;font-size: 16px;">
<a onclick="javascript:history.back();" style="color:#fff">上级目录</a>
</div>
</center>
<div class="space-6"></div>
<form name="form" method="post" action="?type=del">
<table id="sample-table-2" class="table table-striped table-bordered table-hover">
<thead>
<tr>
<th>名称</th>
<th>说明</th>
<th><i class="icon-time bigger-110 hidden-480"></i>时间</th>
<th>操作</th>
</tr>
</thead>
<tbody>
<%=filepath()%>
</tbody>
<%End If%>
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