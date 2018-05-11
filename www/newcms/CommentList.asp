<!--#include file="Inc/Class.asp" -->
<%
If Not Fun_Null(Fun_GetId("type","get")) AND Not Fun_Null(Fun_GetId("id","get")) Then
exe.StrRS "SELECT display FROM {Acc}Comment WHERE id="&Fun_GetId("id","get")&"","r3"
If Fun_GetId("type","get") = "none" Then exe.RS(0) = 1 Else exe.RS(0) = 0
exe.rs.update:exe.OverRS()
End If
if Fun_GetId("type","get")="del" AND Fun_Num(Fun_GetId("id","post")) OR Fun_GetId("type","get")="del" AND Fun_Num(Fun_GetId("id","get")) then
DelData "{Acc}Comment",Fun_GetId("id","post")&Fun_GetId("id","get")
InfoStr Inc_200,Inc_title,"已成功删除选定的数据！",Fun_LaiLu
END IF
%><!DOCTYPE html>
<html>
<head>	
<title>互动列表<%=SEO_Conn&Inc_CMD%></title>
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
<li>互动列表</li>
</ul>
<div class="nav-search" id="nav-search">
<form class="form-search" method="get" action="">
<span class="input-icon">
<input type="text" placeholder="Search ..." name="key" value="<%=key%>" class="nav-search-input" id="nav-search-input" autocomplete="off" />
<input name="size" type="hidden" value="<%=Size%>"/>
<input name="fype" type="hidden" value="<%=fype%>"/>
<input name="plfl" type="hidden" value="<%=plfl%>"/>
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
<th>昵称</th>
<th>内容</th>
<th>状态</th>
<th>来源</th>
<th class="hidden-480"><i class="icon-time bigger-110 hidden-480"></i>时间</th>		
<th>IP</th>													
<th>操作</th>
</tr>
</thead>
<tbody>
<%
if Not Fun_Null(key) then 
exe.StrRS "SELECT id,name,fileid,idesc,addtime,ip,display,(SELECT c.name FROM {Acc}Read c WHERE c.id=fileid),property FROM {Acc}Comment where (name like '%"&key&"%') or (idesc like '%"&key&"%') Or (qq like '%"&key&"%') or (tel like '%"&key&"%') ORDER BY id DESC","r1"
else
dim iPlfl
If Plfl<>"" Then iPlfl="where property="&Plfl Else iPlfl=""
exe.StrRS "SELECT id,name,fileid,idesc,addtime,ip,display,(SELECT c.name FROM {Acc}Read c WHERE c.id=fileid),property from {Acc}Comment "&iPlfl&" order by id desc","r1"
End If
If exe.rs.eof Then
echo "<tr><td></td><td>没有任何内容！</td></tr>"
Else
exe.rs.pagesize=Size
if page="" then page=1
exe.rs.absolutepage=page 
for i=1 to exe.rs.pagesize
if exe.rs.eof then exit for
Dim display,laiyuan
if exe.RS(6)=0 then 
display = "<a href=""?api="&Fun_GetId("api","get")&"&type=none&id="&exe.rs(0)&"&page="&Fun_GetId("page","get")&"&Rnd="&Now()&"&key="&Fun_GetId("key","get")&"&size="&Fun_GetId("size","get")&"&plfl="&Plfl&"&list="&list&"&fype="&fype&"""><font color='#69aa46'>显示</font></a>" 
elseIf exe.RS(6)=2 Then
display = "<a href=""?api="&Fun_GetId("api","get")&"&type=block&id="&exe.rs(0)&"&page="&Fun_GetId("page","get")&"&Rnd="&Now()&"&key="&Fun_GetId("key","get")&"&size="&Fun_GetId("size","get")&"&plfl="&Plfl&"&list="&list&"&fype="&fype&"""><font color='#FF0000'>审核</font></a>"
Else
display = "<a href=""?api="&Fun_GetId("api","get")&"&type=block&id="&exe.rs(0)&"&page="&Fun_GetId("page","get")&"&Rnd="&Now()&"&key="&Fun_GetId("key","get")&"&size="&Fun_GetId("size","get")&"&plfl="&Plfl&"&list="&list&"&fype="&fype&"""><font color='#FF0000'>隐藏</font></a>"
End If
If exe.RS(8)=0 Then laiyuan="留言" Else laiyuan=left(exe.RS(7),10)
If Fun_Null(laiyuan) Then laiyuan="评论"
%>
<tr>
<td class="center"><input type="checkbox" name="id" value="<%=exe.RS(0)%>" class="ace" /><span class="lbl"></span></td>
<td><%=left(exe.RS(1),8)%></td>
<td><%=left(exe.RS(3),25)%>...</td>
<td><%=display%></td>
<td><%=laiyuan%></td>
<td class="hidden-480"><%=exe.RS(4)%></td>
<td><%=exe.RS(5)%></td>
<td>
<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
<a class="green" href="<%=Inc_Comment&exe.RS(0)&"&plfl="&Fun_GetId("plfl","get")%>" title="编辑"><i class="icon-pencil bigger-130"></i></a>
<a class="red" href="?type=del&id=<%=exe.RS(0)%>" onclick="return confirm('请注意，删除后不可恢复！\n\n您真的确定要删除此条数据吗?')" class="tooltip-error" data-rel="tooltip" title="删除"><i class="icon-trash bigger-130"></i></a>
</div>
</td>
</tr>
<%
exe.rs.movenext
next
end If
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
</div>
<%exe.OverRS():exe.OverConn()%>                                           
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