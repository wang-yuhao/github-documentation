<!--#include file="Inc/Class.asp" -->
<%
if Fun_GetId("type","get")="del" AND Fun_Num(Fun_GetId("id","post")) OR Fun_GetId("type","get")="del" AND Fun_Num(Fun_GetId("id","get")) then
DelData "{Acc}Tags",Fun_GetId("id","post")&Fun_GetId("id","get")
InfoStr Inc_500,Inc_title,"已成功删除选定的数据！",Fun_LaiLu
END IF
%>
<!DOCTYPE html>
<html>
<head>	
<title>标签列表<%=SEO_conn&Inc_CMD%></title>
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
<li>标签列表</li>
<div class="nav-search" id="nav-search">
<form class="form-search" method="get" action="">
<span class="input-icon">
<input type="text" placeholder="Search ..." name="key" value="<%=key%>" class="nav-search-input" id="nav-search-input" autocomplete="off" />
<input name="size" type="hidden" value="<%=Size%>"/>
<input name="fype" type="hidden" value="<%=fype%>"/>
<i class="icon-search nav-search-icon"></i>
<button style="font-size: 12px;padding: 1px 10px;top: -2px;" class="btn" type="submit">查找</button> 
</span>
</form>
</div>
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
<th>标签</th>
<th>点击</th>
<th class="hidden-480">数量</th>
<th class="hidden-480"><i class="icon-time bigger-110 hidden-480"></i>时间</th>															
<th>操作</th>
</tr>
</thead>
<tbody>
<%
Dim display,img,top,push,name
exe.StrRS "select id,name,i,ii,addtime from {Acc}Tags order by id desc","r1"
If exe.rs.eof Then 
echo "<tr><td></td><td>暂时没有任何标签！</td></tr>"
Else
exe.rs.pagesize=Size
if page="" then page=1
exe.rs.absolutepage=page 
for i= 1 to exe.rs.pagesize
if exe.rs.eof then
exit for
end if
%>
<tr>
<td class="center"><input type="checkbox" name="id" value="<%=exe.rs(0)%>" class="ace" /><span class="lbl"></span></td>
<td><%=exe.rs(0)%></td>
<td><%=exe.RS(1)%></td>
<td><%=exe.RS(2)%></td>
<td class="hidden-480"><%=exe.RS(3)%></td>
<td class="hidden-480"><%=exe.RS(4)%></td>
<td>
<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
<a class="red" href="?type=del&id=<%=exe.RS(0)%>" onclick="return confirm('请注意，删除后不可恢复！\n\n您真的确定要删除此条数据吗?')" class="tooltip-error" data-rel="tooltip" title="删除"><i class="icon-trash bigger-130"></i></a>
</div>
</td>
</tr>
<%
exe.rs.movenext
next
End If
%>
</tbody>
</table>
<div class="delete">
<input onclick="return confirm('请注意，删除后不可恢复！\n\n您真的确定要删除吗?')" class="tooltip-error" type="submit"  value="删除所选" />
</div>
</form>
<div class="Fenye">
<span class="hidden-480"><a>共 <%=exe.rs.recordcount%> 条 <%=exe.rs.pagecount%> 页</a></span>
<%StrPage 3,5%>
<ul>
</div><%exe.OverRS():exe.OverConn()%>                                            
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