<!--#include file="Inc/Class.asp" -->
<%
If Fun_GetId("type","get") = "add" Then
If Fun_Null(Fun_GetId("name","post")) Then InfoStr Inc_500,Inc_Title,"请填写栏目名称！","back"
If Fun_Null(Fun_GetId("enname","post")) Then InfoStr Inc_500,Inc_Title,"请填写栏目英文名称！","back"
dim Navid,fileid
Navid=split(request.form("Nav"),"|")(0)
fileid=split(request.form("Nav"),"|")(2)
exe.StrRS "SELECT TOP 1 * FROM {Acc}Nav ORDER BY id DESC","r3"
exe.rs.addnew
exe.rs("property")   = Navid
exe.rs("fileid") = fileid+1
exe.rs("type")    = request.form("type")
exe.rs("url")     = request.form("url")
exe.rs("sort")    = request.form("sort")
exe.rs("name")    = request.form("name")
exe.rs("enname")  = request.form("enname")
exe.rs("title")   = request.form("title")
exe.rs("keyword") = Replace(Replace(trim(request.form("keyword")),",","，")," ","，")
If Fun_Num(Fun_GetId("descstr","post")) And Fun_Null(Fun_GetId("idesc","post")) Then
exe.rs("idesc") = Fun_Html(Fun_GetId("info","post"),cint(Fun_GetId("descstr","post")))
else
exe.rs("idesc") = Fun_GetId("idesc","post")
End If
exe.rs("target")  = request.form("target")
exe.rs("ifile")	  = exe.rs("id")
exe.rs("temp")	  = request.form("temp")
exe.rs("retemp")= request.form("retemp")
dim info,iimg
If Fun_GetId("down","post")<>1 Then info=ReplaceInfo(Fun_ImgLink(Fun_GetId("info","post"))) else info=ReplaceInfo(Fun_GetId("info","post"))
exe.rs("info") = info
If Fun_Num(Fun_GetId("imgstr","post")) And Fun_Null(Fun_GetId("img","post")) Then 
iimg=sjpeg(Fun_StrImg(info,Fun_GetId("imgstr","post")),0) 
Else 
iimg=Fun_GetID("img","post")
End If
exe.rs("img")=iimg
exe.rs("info") 	  = request.form("info")
exe.rs("addtime") = Now()
exe.rs("display") = request.form("display")
exe.RS("address") = Fun_GetId("address","post")
exe.rs("listlink")= trim(Replace(trim(request.form("listlink")),",",""))
exe.rs("infolink")= trim(Replace(trim(request.form("infolink")),",",""))
exe.rs.update
exe.OverRS()
exe.StrRS "SELECT TOP 1 ID FROM {Acc}Nav ORDER BY ID DESC","exe"
NavTopId(exe.RS(0)&","&NavRoot(exe.RS(0)))
StrNavRoot(exe.rs(0))

InfoStr Inc_200,Inc_title,"栏目创建成功！",Inc_ColumnList
End If
%><!DOCTYPE html>
<html>
<head>	
<title>新增栏目<%=SEO_conn&Inc_CMD%></title>
<!--#include file="Inc/Config/New_Head.asp" -->
<link rel="stylesheet" href="edit/themes/default/default.css" />
<script charset="utf-8" src="edit/kindeditor-min.js"></script>
<script charset="utf-8" src="edit/lang/zh_CN.js"></script>
<script>
KindEditor.ready(function(K) {
editor = K.create('textarea[id="editor_id"]', {
allowFileManager : true
});
});
			KindEditor.ready(function(K) {
				var uploadbutton = K.uploadbutton({
					button : K('#uploadButton')[0],
					fieldName : 'imgFile',
					url : 'edit/asp/upload.asp?type=read',
					afterUpload : function(data) {
						if (data.error === 0) {
							var url = K.formatUrl(data.url, 'absolute');
							K('#url').val(url);
						} else {
							alert(data.message);
						}
					},
					afterError : function(str) {
						alert('上传失败');
					}
				});
				uploadbutton.fileBox.change(function(e) {
					uploadbutton.submit();
				});
			});
</script>
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
<li>新增栏目</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<div class="col-xs-12">
<div class="table-responsive">
<form method="post" action="?type=add">
<table id="sample-table-2" class="table table-striped table-bordered table-hover">
<thead>
</thead>
<tbody>
<tr>
<td width="15%">栏目名称：</td>
<td><input name="name" type="text" style="width: 100%;"/></td>
</tr>
<tr>
<td width="15%">英文名称：</td>
<td><input name="enname" type="text" style="width: 100%;"/></td>
</tr>
<tr>
<td>顶级分类：</td>
<td>
<%Inc_NavSEl 0,0,0,0,"顶级菜单",0%>
</td>
</tr>
<tr>
<td width="15%">栏目类型：</td>
<td>
<label for="type" style="width:100%">
<select name="type" size="" style="width:100%" id="sortType" onChange="setInput(sortType.value)">
<option value="0"> 单篇</option>
<option value="1" selected="selected"> 内容</option>
<option value="2"> 链接</option>
</select>
</label>
<Script type="text/javascript">
function setInput(t)
{
 document.getElementById("temp").value="readlist.html";
 document.getElementById("retemp").value="read.html";
 document.getElementById("hid1").style.display="";
 document.getElementById("hid2").style.display="";
 document.getElementById("hid3").style.display="";
 document.getElementById("hid4").style.display="";
 document.getElementById("hid5").style.display="";
 document.getElementById("hid6").style.display="";
 document.getElementById("hid7").style.display="none";
 document.getElementById("hid8").style.display="";
switch(t)
   {
   case "0":
     document.getElementById("temp").value="page.html";
	 document.getElementById("retemp").value="";
	 document.getElementById("listlink").name="";
	 document.getElementById("listlink2").name="listlink";
	 document.getElementById("infolink").name="";
     document.getElementById("hid1").style.display="none";
	 document.getElementById("hid2").style.display="";  
     document.getElementById("hid3").style.display="none";
	 document.getElementById("hid4").style.display=""; 
     document.getElementById("hid5").style.display="none";  
	 document.getElementById("hid6").style.display="";
	 document.getElementById("hid7").style.display="";
	 document.getElementById("hid8").style.display="none";
     break
   case "1":
     document.getElementById("temp").value="readlist.html";
     document.getElementById("retemp").value="read.html";
	 document.getElementById("infolink").name="infolink";
     document.getElementById("hid1").style.display="none";
	 document.getElementById("hid2").style.display="";  
	 document.getElementById("hid3").style.display="";    
	 document.getElementById("hid4").style.display="";  
	 document.getElementById("hid5").style.display=""; 	 
	 document.getElementById("hid6").style.display="none";
	 document.getElementById("hid7").style.display="none";
	 document.getElementById("hid8").style.display="";
     break
   case "2": 
     document.getElementById("temp").value="";
     document.getElementById("retemp").value="";
	 document.getElementById("hid2").style.display="none";  
	 document.getElementById("hid3").style.display="none";    
	 document.getElementById("hid4").style.display="none";  
	 document.getElementById("hid5").style.display="none"; 	 
	 document.getElementById("hid6").style.display="none";
     document.getElementById("hid7").style.display="none";
	 document.getElementById("hid8").style.display="none";
	 document.getElementById("listlink").name="";
	 document.getElementById("listlink2").name="";
	 document.getElementById("infolink").name="";
     break
   default:
     document.getElementById("hid1").style.display="none";
     document.getElementById("hid2").style.display="none";
     document.getElementById("hid3").style.display="none";
     document.getElementById("hid4").style.display="none";
     document.getElementById("hid5").style.display="none";
	 document.getElementById("hid6").style.display="none";
	 document.getElementById("hid7").style.display="none";
	 document.getElementById("hid8").style.display="none";
   }
}
</script>
</td>
</tr>
<tr id="hid1">
<td>链接地址：</td>
<td><input name="url" type="text" style="width: 100%;"/></td>
</tr>
<tr id="hid2">
<td>列表模板：</td>
<td><%=Fun_FileList("temp","readlist.html",0)%></td>
</tr>
<tr id="hid3">
<td>内容模板：</td>
<td><%=Fun_FileList("retemp","read.html",0)%></td>
</tr>
<tr id="hid4">
<td>列表地址：</td>
<td id="hid7" style="display:none">
<label style="width:100%">
<select id="listlink2" name="listlink2" size="" style="width:100%">
<option value="/?pid=[type:id]&page=[type:page]&type=[type:class]">纯动态：例 /?pid=1&page=2&type=wap </option>
<option value="/page/[type:id]/[type:page]/[type:class]/">伪静态：例 /page/2/1/wap/ </option>
<option value="/page/[type:id]/[type:page]/[type:class][type:html]">伪静态：例 /page/2/1/wap<%=SEO_Bak%> </option>
<option value="/page-[type:id]-[type:page]-[type:class]/">伪静态：例 /page-2-1-wap/ </option>
<option value="/page-[type:id]-[type:page]-[type:class][type:html]">伪静态：例 /page-2-1-wap<%=SEO_Bak%> </option>
<option value="/[type:en]/[type:page]/[type:class]/">伪静态：例 /栏目英文名称/2/1/wap/ </option>
<option value="/[type:en]/[type:page]/[type:class][type:html]">伪静态：例 /栏目英文名称/2/1/wap<%=SEO_Bak%> </option>
<option value="/[type:en]-[type:page]-[type:class]/">伪静态：例 /栏目英文名称-2/wap/ </option>
<option value="/[type:en]-[type:page]-[type:class][type:html]">伪静态：例 /栏目英文名称-2-wap<%=SEO_Bak%> </option>
</select>
</label>
</td>
<td id="hid8">
<label style="width:100%">
<select id="listlink" name="listlink" size="" style="width:100%">
<option value="/?cat=[type:id]&page=[type:page]&type=[type:class]">纯动态：例 /?list=1&page=2&type=wap </option>
<option value="/list/[type:id]/[type:page]/[type:class]/">伪静态：例 /list/1/2/wap/ </option>
<option value="/list/[type:id]/[type:page]/[type:class][type:html]">伪静态：例 /list/1/2/wap<%=SEO_Bak%> </option>
<option value="/list-[type:id]-[type:page]-[type:class]/">伪静态：例 /list-1-2-wap/ </option>
<option value="/list-[type:id]-[type:page]-[type:class][type:html]">伪静态：例 /list-1-2-wap<%=SEO_Bak%> </option>
<option value="/[type:en]/[type:page]/[type:class]/">伪静态：例 /栏目英文名称/2/wap/ </option>
<option value="/[type:en]/[type:page]/[type:class][type:html]">伪静态：例 /栏目英文名称/2/wap<%=SEO_Bak%> </option>
<option value="/[type:en]-[type:page]-[type:class]/">伪静态：例 /栏目英文名称-1-wap/ </option>
<option value="/[type:en]-[type:page]-[type:class][type:html]">伪静态：例 /栏目英文名称-2-wap<%=SEO_Bak%> </option>
</select>
</label>
</td>
</tr>
<tr id="hid5">
<td>内容地址：</td>
<td>
<label for="infolink" style="width:100%">
<select id="infolink" name="infolink" size="" style="width:100%">
<option value="/?p=[type:id]&page=[type:page]&type=[type:class]">纯动态：例 /?p=2&page=1&type=wap </option>
<option value="/[type:id]/[type:page]/[type:class]/">伪静态：例 /2/1/wap/ </option>
<option value="/[type:id]/[type:page]/[type:class][type:html]">伪静态：例 /2/1/wap<%=SEO_Bak%> </option>
<option value="/[type:id]-[type:page]/[type:class]/">伪静态：例 /2-1-wap/ </option>
<option value="/[type:id]-[type:page]-[type:class][type:html]">伪静态：例 /2-1-wap<%=SEO_Bak%> </option>
<option value="/[type:en]/[type:id]/[type:page]/[type:class]/">伪静态：例 /chanping/2/1/wap/ </option>
<option value="/[type:en]/[type:id]/[type:page]/[type:class][type:html]">伪静态：例 /chanping/2/1/wap<%=SEO_Bak%> </option>
<option value="/[type:en]-[type:id]-[type:page]-[type:class]/">伪静态：例 /chanping-1-wap/ </option>
<option value="/[type:en]-[type:id]-[type:page]-[type:class][type:html]">伪静态：例 /chanping-1-wap<%=SEO_Bak%> </option>
</select>
</label>
</td>
</tr>
<tr>
<td>是否显示：</td>
<td>
<label for="display"style="width:100%">
<select name="display" size="" style="width:100%">
<option value="0"> 显示</option>	
<option value="1"> 隐藏</option>
<option value="2"> 禁用</option>	
</select>
</label>
</td>
</tr>
 <tr>
<td>显示分组：</td>
<td>
<label for="address" style="width: 100%;">
<select name="address" size="" style="width: 100%;">
<option value="0"> 0</option>
<option value="1"> 1</option>	
<option value="2"> 2</option>	
<option value="3"> 3</option>
<option value="4"> 4</option>	
<option value="5"> 5</option>	
<option value="6"> 6</option>	
<option value="7"> 7</option>	
<option value="8"> 8</option>	
<option value="9"> 9</option>								
</select>
</label>
</td>
</tr>
<tr>
<td>打开方式：</td>
<td>
<label for="target"style="width:100%">
<select name="target" size="" style="width:100%">
<option value=''> 默认</option>
<option value=' target="_blank"'> _blank</option>	
<option value=' target="_self"'> _self</option>	
<option value=' target="_parent"'> _parent</option>	
<option value=' target="_top"'> _top</option>	
</select>
</label>
</td>
</tr>
<tr>
<td>栏目排序：</td>
<td><input name="sort" type="text" class="text" value="0" style="width: 100%;" /></td>
</tr>
<tr>
<td>栏目标题：</td>
<td ><input name="title" type="text" style="width: 100%;" /></td>
</tr>
<td>栏目图片：</td>
<td><input name="img" class="ke-input-text" type="text" id="url" value=""/> <input type="button" id="uploadButton" value="上传"/> &nbsp;&nbsp; 设置内容第<input style="width:30px" name="imgstr" type="text" value=""/>张为缩略图</td>
</tr>
<tr>
<td>栏目标签：</td>
<td><input name="keyword" type="text"  placeholder="请使用中文逗号，隔开（栏目关键词）" style="width: 100%;"/></td>
</tr>
<tr>
<tr>
<td>栏目描述：</td>
<td><textarea name="idesc" rows="3" style="width: 100%;"></textarea></td>
</tr>
<tr id="hid6">
<td>详细内容：<br /><br /><a>插入分页<br />{new:page}</a></td>
<td><input name="down" type="checkbox" value="1" <%If Pic_Down=1 Then echo "checked "%>/> 不保存远程图片 &nbsp;&nbsp; &nbsp;&nbsp; 自动摘取前<input style="width:35px" name="descstr" type="text" value="<%=SEO_Desc%>"/>字到描述<textarea id="editor_id" name="info" style="width:100%;height:400px;" ></textarea></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="提交" />  <input type="reset" value="重置" /></td>
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