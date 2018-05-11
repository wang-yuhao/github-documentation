<!--#include file="Inc/Class.asp" -->
<%
If Not Fun_Null(Fun_GetId("type","get")) AND Not Fun_Null(Fun_GetId("id","get")) Then
exe.StrRS "SELECT display,NoFollow FROM {Acc}Link WHERE id="&Fun_GetId("id","get")&"","r3"
If Fun_GetId("type","get")="none" Then 
exe.RS(0)=1
elseIf Fun_GetId("type","get")="block" Then
exe.RS(0)=0
elseIf Fun_GetId("type","get")="nofoyes" Then
exe.RS(1)=" rel=""nofollow"""
elseIf Fun_GetId("type","get")="nofono" Then
exe.RS(1) =""
End If
exe.rs.update:exe.OverRS()
End If
if Fun_GetId("type","get")="del" AND Fun_Num(Fun_GetId("id","post")) OR Fun_GetId("type","get")="del" AND Fun_Num(Fun_GetId("id","get")) then
DelData "{Acc}link",Fun_GetId("id","post")&Fun_GetId("id","get")
InfoStr Inc_200,Inc_title,"已成功删除选定的数据！",Fun_LaiLu
END IF
%><!DOCTYPE html>
<html>
<head>	
<title>友链列表<%=SEO_conn&Inc_CMD%></title>
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
							<li>链接列表</li>
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
<th>名称</th>
<th>链接</th>
<th>NoFollow</th>
<th>分组</th>
<th>状态</th>
<th class="hidden-480"><i class="icon-time bigger-110 hidden-480"></i>时间</th>															
<th>操作</th>
</tr>
</thead>
<tbody>
<%
dim display,NoFollow
exe.StrRS "SELECT id,name,url,logo,ico,NoFollow,display,address,addtime FROM {Acc}link ORDER BY id DESC","exe"
If exe.rs.eof Then
Echo "<tr><td></td><td>没有任何内容！</td></tr>"
Else
do While Not exe.rs.eof
If instr(exe.RS(5),"nofollow")=0 then NoFollow="<a href=""?type=nofoyes&id="&exe.rs(0)&"&page="&Fun_GetId("page","get")&"&Rnd="&Now()&"&key="&Fun_GetId("key","get")&"&size="&Fun_GetId("size","get")&"&plfl="&Plfl&"&list="&list&"&fype="&fype&"""><font style='color: #46B11F;'>否</font></a>" else NoFollow="<a href=""?type=nofono&id="&exe.rs(0)&"&page="&Fun_GetId("page","get")&"&Rnd="&Now()&"&key="&Fun_GetId("key","get")&"&size="&Fun_GetId("size","get")&"&plfl="&Plfl&"&list="&list&"&fype="&fype&"""><font color='#FF0000'>是</font></a>"
if exe.RS(6)=0 then display = "<a href=""?type=none&id="&exe.rs(0)&"&page="&Fun_GetId("page","get")&"&Rnd="&Now()&"&key="&Fun_GetId("key","get")&"&size="&Fun_GetId("size","get")&"&plfl="&Plfl&"&list="&list&"&fype="&fype&"""><font color='#69aa46'>显示</font></a>" else display = "<a href=""?type=block&id="&exe.rs(0)&"&page="&Fun_GetId("page","get")&"&Rnd="&Now()&"&key="&Fun_GetId("key","get")&"&size="&Fun_GetId("size","get")&"&plfl="&Plfl&"&list="&list&"&fype="&fype&"""><font color='#FF0000'>隐藏</font></a>"
%>
<tr>
<td class="center"><input type="checkbox" name="id" value="<%=exe.rs(0)%>" class="ace" /><span class="lbl"></span></td>
<td><a href="<%=exe.rs(2)%>" target="_blank"><%=exe.rs(1)%></a></td>
<td><%=exe.rs(2)%></td>
<td><%=NoFollow%></td>
<td><%=exe.rs(7)%></td>
<td><%=display%></td>
<td class="hidden-480"><%=exe.rs(8)%></td>
<td>
<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
<a class="blue" href="<%=exe.rs(2)%>" target="_blank" title="查看"><i class="icon-zoom-in bigger-130"></i></a>
<a class="green" href="<%=Inc_Link & exe.rs(0)%>" title="编辑"><i class="icon-pencil bigger-130"></i></a>
<a class="red" href="?type=del&id=<%=exe.rs(0)%>" onclick="return confirm('请注意，删除后不可恢复！\n\n您真的确定要删除此条数据吗?')" class="tooltip-error" data-rel="tooltip" title="删除"><i class="icon-trash bigger-130"></i></a>
</div>
<div class="visible-xs visible-sm hidden-md hidden-lg">
<div class="inline position-relative">
<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
<i class="icon-caret-down icon-only bigger-120"></i>
</button>
<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
<li><a href="<%=exe.rs(2)%>" class="tooltip-info" data-rel="tooltip" title="查看"><span class="blue"><i class="icon-zoom-in bigger-120"></i></span></a></li>
<li><a href="<%=Inc_Link & exe.rs(0)%>" class="tooltip-success" data-rel="tooltip" title="编辑"><span class="green"><i class="icon-edit bigger-120"></i></span></a></li>
<li><a href="?delete=" onclick="return confirm('请注意，删除后不可恢复！\n\n您真的确定要删除此条数据吗?')" class="tooltip-error" data-rel="tooltip" title="?type=del&id=<%=exe.rs(0)%>"><span class="red"><i class="icon-trash bigger-120"></i></span></a></li>
</ul>
</div>
</div>
</td>
</tr>
<%exe.rs.movenext:loop:end If:exe.OverRS():exe.OverConn%>
</tbody>
</table>
<div class="delete">
<input onclick="return confirm('请注意，删除后不可恢复！\n\n您真的确定要删除吗?')" class="tooltip-error" type="submit"  value="删除所选" />
</div>
</form>                                      
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