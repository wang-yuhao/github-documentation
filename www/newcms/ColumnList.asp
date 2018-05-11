<!--#include file="Inc/Class.asp" -->
<%
If Not Fun_Null(Fun_GetId("type","get")) AND Not Fun_Null(Fun_GetId("id","get")) Then
exe.StrRS "SELECT display FROM [{Acc}Nav] WHERE id="&Fun_GetId("id","get")&"","r3"
If Fun_GetId("type","get") = "none" Then exe.RS(0) = 1 Else exe.RS(0) = 0
exe.rs.update:exe.OverRS()
End If
if Fun_GetId("type","get")="del" AND Fun_Num(Fun_GetId("id","post")) OR Fun_GetId("type","get")="del" AND Fun_Num(Fun_GetId("id","get")) then
exe.StrRS "SELECT count(id) FROM {Acc}Nav","exe"
If exe.RS(0)<2 Then InfoStr Inc_200,Inc_title,"请至少保留一个分类！",Fun_LaiLu
exe.OverRS
DelData "{Acc}Nav",Fun_GetId("id","post")&Fun_GetId("id","get")
InfoStr Inc_200,Inc_title,"已成功删除选定的数据！",Fun_LaiLu
END IF
%><!DOCTYPE html>
<html>
<head>	
<title>栏目列表<%=SEO_conn&Inc_CMD%></title>
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
<ul class="breadcrumb">
<li><i class="icon-home home-icon"></i><a href="<%=Inc_Index%>">首页</a></li>
<li>栏目列表</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<div class="col-xs-12">
<div class="table-responsive">
<form name="form" method="post" action="?type=del">
<table id="sample-table-2" class="table table-striped table-bordered table-hover">
<thead>
<tr>
<th class="center"><input type="checkbox" id="operAll" onclick="getAll()" class="ace"/><span class="lbl"></span></th>
<th>编号</th>
<th>名称</th>
<th class="hidden-480">排序</th>
<th>类型</th>
<th>分组</th>
<th class="hidden-480">状态</th>	
<th class="hidden-480"><i class="icon-time bigger-110 hidden-480"></i>时间</th>															
<th>操作</th>
</tr>
</thead>
<tbody>
<%Inc_NavList 0,0%>
</tbody>
</table>
 <div class="delete">
<input onclick="return confirm('请注意，删除后不可恢复！\n\n您真的确定要删除此条数据吗?\n\n删除后栏目下内容、子导航将会同时会被清空，建议禁用栏目，不建议删除！')" class="tooltip-error" type="submit"  value="删除所选" />
</div>
</div>
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