<!--#include file="Inc/Class.asp" -->
<%
Dim typeget,idget
ReadInfo "typeget|"&Fun_GETID("type","get")&",idget"&Fun_GETID("id","get")
If typeget="edit" AND Fun_Num(idget) Then 
If Fun_Null(Fun_GetId("name","post")) Then InfoStr Inc_500,Inc_Title,"请填写栏目名称！","back"
If Fun_Null(Fun_GetId("enname","post")) Then InfoStr Inc_500,Inc_Title,"请填写栏目英文名称！","back"
dim propertyi,Navid,fileid
Navid=split(request.form("Nav"),"|")(0)
propertyi=split(request.form("Nav"),"|")(1)
fileid=split(request.form("Nav"),"|")(2)
If propertyi=Fun_GETID("id","get") Then InfoStr Inc_500,Inc_Title,"顶级分类不能选择自己！","back"
exe.StrRS "SELECT TOP 1 * FROM [{Acc}Nav] WHERE id="&Fun_GETID("id","get")&"","r3"
exe.rs("property")   = Navid
exe.rs("fileid")   = fileid+1
exe.rs("type")    = Fun_GetID("type","post")
exe.rs("url")     = Fun_GetID("url","post")
If Fun_GetID("sort","post")="" Then exe.rs("sort")=0 Else exe.rs("sort")=Fun_GetID("sort","post")
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
dim iimg
If Fun_GetId("down","post")<>1 Then info=ReplaceInfo(Fun_ImgLink(Fun_GetId("info","post"))) else info=ReplaceInfo(Fun_GetId("info","post"))
exe.rs("info") = info
If Fun_Num(Fun_GetId("imgstr","post")) And Fun_Null(Fun_GetId("img","post")) Then 
iimg=sjpeg(Fun_StrImg(info,Fun_GetId("imgstr","post")),0) 
Else 
iimg=Fun_GetID("img","post")
End If
exe.rs("img")=iimg
exe.rs("addtime")=Now()
exe.rs("display")=request.form("display")
exe.RS("address")=Fun_GetId("address","post")
exe.rs("listlink")=Fun_GetId("listlink","post")
exe.rs("infolink")=request.form("infolink")
dim ifile:ifile=NavDownId(exe.rs("id"))
exe.RS("ifile")=left(ifile,len(ifile)-1)
exe.rs.update
exe.OverRS()
If Fun_GETID("NavTop","post")<>"-1" Then NavTopID Fun_GETID("NavTop","post")&","&NavRoot(Fun_GETID("NavTop","post"))
NavTopId(Fun_GETID("id","get")&","&NavRoot(Fun_GETID("id","get")))
StrNavRoot Fun_GETID("id","get")
InfoStr Inc_200,Inc_title,"栏目修改成功！",Inc_ColumnList
End IF


IF Fun_Null(Fun_UrlID("id")) OR Not Fun_Num(Fun_UrlID("id")) Then InfoStr Inc_500,Inc_title,"访问出错！",Inc_Login End If
Dim id,iclass,itype,sort,name,enname,title,keyword,idesc,target,temp,retemp,img,info,display,url,infolink,listlink,address
exe.StrRS "SELECT id,property,type,sort,name,enname,title,keyword,idesc,target,temp,retemp,img,info,display,url,infolink,listlink,address FROM {Acc}Nav WHERE id="&Fun_UrlID("id")&"","exe"
If exe.RS.BOF Then InfoStr Inc_500,Inc_title,"访问出错！",Inc_Login
id=exe.RS(0)
iclass=exe.rs(1)
itype=exe.rs(2)
sort=exe.rs(3)
name=exe.rs(4)
enname=exe.rs(5)
title=exe.rs(6)
keyword=exe.rs(7)
idesc=exe.rs(8)
target=exe.rs(9)
temp=exe.rs(10)
retemp=exe.rs(11)
img=exe.rs(12)
info=exe.rs(13)
display=exe.rs(14)
url=exe.rs(15)
infolink=exe.rs(16)
listlink=exe.rs(17)
address=exe.RS(18)
exe.OverRS()
%><!DOCTYPE html>
<html>
<head>
<title>修改栏目<%=SEO_conn&Inc_CMD%></title>
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
<li class="active">修改栏目</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<form method="post" action="?type=edit&id=<%=Id%>" class="article">
<table id="sample-table-2" class="table table-striped table-bordered table-hover">
<thead>
</thead>
<tbody>
<tr>
<td width="15%">栏目名称：</td>
<td><input name="name" type="text" value="<%=name%>" style="width: 100%;"/></td>
</tr>
<tr>
<td width="15%">英文名称：</td>
<td><input name="enname" type="text" value="<%=enname%>" style="width: 100%;"/><input name="NavTop" type="hidden" value="<%=NavTop(id)%>"/></td>
</tr>
<tr>
<td>顶级分类：</td>
<td>
<%Inc_NavSEl 0,0,NavTop(id),0,"顶级分类",0%>
</td>
</tr>
<tr>
<td width="15%">栏目类型：</td>
<td>
<label for="type" style="width:100%">
<select name="type" size="" style="width:100%" id="sortType" onChange="setInput(sortType.value)">
<option value="0"<%If itype=0 Then echo " selected=""selected""" %> > 单篇</option>
<option value="1"<%If itype=1 Then echo " selected=""selected""" %> > 内容</option>
<option value="2"<%If itype=2 Then echo " selected=""selected""" %> > 链接</option>
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
	 document.getElementById("listlink").name="listlink";
	 document.getElementById("listlink2").name="listlink2";
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
<td><input name="url" type="text" value="<%=url%>" style="width: 100%;"/></td>
</tr>
<tr id="hid2">
<td>列表模板：</td>
<td><%=Fun_FileList("temp",temp,0)%></td>
</tr>
<tr id="hid3" style="<%If itype=0 Then echo "display:none"%>">
<td>内容模板：</td>
<td><%=Fun_FileList("retemp",retemp,0)%></td>
</tr>
<tr id="hid4">
<td>列表地址：</td>
<td id="hid7" style="<%If itype<>0 Then echo "display:none"%>">
<label style="width:100%">
<select id="listlink2" name="listlink<%If itype<>0 Then%>2<%end if%>" size="" style="width:100%">
<option <%If listlink="/?pid=[type:id]&page=[type:page]&type=[type:class]" Then echo " selected=""selected"" "%> value="/?pid=[type:id]&page=[type:page]&type=[type:class]">纯动态：例 /?pid=2&page=1&type=wap </option>
<option <%If listlink="/page/[type:id]/[type:page]/[type:class]/" Then echo " selected=""selected"" "%> value="/page/[type:id]/[type:page]/[type:class]/">伪静态：例 /page/2/1/wap/ </option>
<option <%If listlink="/page/[type:id]/[type:page]/[type:class][type:html]" Then echo " selected=""selected"" "%> value="/page/[type:id]/[type:page]/[type:class][type:html]">伪静态：例 /page/2/1/wap<%=SEO_Bak%> </option>
<option <%If listlink="/page-[type:id]-[type:page]-[type:class]/" Then echo " selected=""selected"" "%> value="/page-[type:id]-[type:page]-[type:class]/">伪静态：例 /page-2-1-wap/ </option>
<option <%If listlink="/page-[type:id]-[type:page]-[type:class][type:html]" Then echo " selected=""selected"" "%> value="/page-[type:id]-[type:page]-[type:class][type:html]">伪静态：例 /page-2-1-wap<%=SEO_Bak%> </option>
<option  <%If listlink="/[type:en]/[type:page]/[type:class]/" Then echo " selected=""selected"" "%> value="/[type:en]/[type:page]/[type:class]/">伪静态：例 /栏目英文名称/2/wap/ </option>
<option  <%If listlink="/[type:en]/[type:page]/[type:class][type:html]" Then echo " selected=""selected"" "%> value="/[type:en]/[type:page]/[type:class][type:html]">伪静态：例 /栏目英文名称/2/wap<%=SEO_Bak%> </option>
<option  <%If listlink="/[type:en]-[type:page]-[type:class]/" Then echo " selected=""selected"" "%> value="/[type:en]-[type:page]-[type:class]/">伪静态：例 /栏目英文名称-2-wap/ </option>
<option  <%If listlink="/[type:en]-[type:page]-[type:class][type:html]" Then echo " selected=""selected"" "%> value="/[type:en]-[type:id]-[type:page]-[type:class][type:html]">伪静态：例 /栏目英文名称-2-wap<%=SEO_Bak%> </option>
</select>
</label>
</td>
<td id="hid8" style="<%If itype=0 Then echo "display:none"%>">
<label style="width:100%">
<select id="listlink" name="listlink<%If itype=0 Then%>2<%end if%>" size="" style="width:100%">
<option  <%If listlink="/?cat=[type:id]&page=[type:page]&type=[type:class]" Then echo " selected=""selected"" "%> value="/?cat=[type:id]&page=[type:page]&type=[type:class]">纯动态：例 /?list=1&page=2&type=wap </option>
<option  <%If listlink="/list/[type:id]/[type:page]/[type:class]/" Then echo " selected=""selected"" "%> value="/list/[type:id]/[type:page]/[type:class]/">伪静态：例 /list/1/2/wap/ </option>
<option  <%If listlink="/list/[type:id]/[type:page]/[type:class][type:html]" Then echo " selected=""selected"" "%> value="/list/[type:id]/[type:page]/[type:class][type:html]">伪静态：例 /list/1/2/wap<%=SEO_Bak%> </option>
<option  <%If listlink="/list-[type:id]-[type:page]-[type:class]/" Then echo " selected=""selected"" "%> value="/list-[type:id]-[type:page]-[type:class]/">伪静态：例 /list-1-2-wap/ </option>
<option  <%If listlink="/list-[type:id]-[type:page]-[type:class][type:html]" Then echo " selected=""selected"" "%> value="/list-[type:id]-[type:page]-[type:class][type:html]">伪静态：例 /list-1-2-wap<%=SEO_Bak%> </option>
<option  <%If listlink="/[type:en]/[type:page]/[type:class]/" Then echo " selected=""selected"" "%> value="/[type:en]/[type:page]/[type:class]/">伪静态：例 /栏目英文名称/2/wap/ </option>
<option  <%If listlink="/[type:en]/[type:page]/[type:class][type:html]" Then echo " selected=""selected"" "%> value="/[type:en]/[type:page]/[type:class][type:html]">伪静态：例 /栏目英文名称/2/wap<%=SEO_Bak%> </option>
<option  <%If listlink="/[type:en]-[type:page]-[type:class]/" Then echo " selected=""selected"" "%> value="/[type:en]-[type:page]-[type:class]/">伪静态：例 /栏目英文名称-2-wap/ </option>
<option  <%If listlink="/[type:en]-[type:page]-[type:class][type:html]" Then echo " selected=""selected"" "%> value="/[type:en]-[type:id]-[type:page]-[type:class][type:html]">伪静态：例 /栏目英文名称-2-wap<%=SEO_Bak%> </option>
</select>
</label>
</td>
</tr>
<tr id="hid5" style="<%If itype=0 Then echo "display:none"%>">
<td>内容地址：</td>
<td>
<select name="infolink" size="" id="infolink" style="width:100%">
<option <%If infolink="/?p=[type:id]&page=[type:page]&type=[type:class]" Then echo " selected=""selected"" "%> value="/?p=[type:id]&page=[type:page]&type=[type:class]">纯动态：例 /?p=1&page=2&type=wap </option>
<option <%If infolink="/[type:id]/[type:page]/[type:class]/" Then echo " selected=""selected"" "%> value="/[type:id]/[type:page]/[type:class]/">伪静态：例 /1/2/wap/ </option>
<option <%If infolink="/[type:id]/[type:page]/[type:class][type:html]" Then echo " selected=""selected"" "%> value="/[type:id]/[type:page]/[type:class][type:html]">伪静态：例 /1/2/wap<%=SEO_Bak%> </option>
<option <%If infolink="/[type:id]-[type:page]-[type:class]/" Then echo " selected=""selected"" "%> value="/[type:id]-[type:page]-[type:class]/">伪静态：例 /1-2-wap/ </option>
<option <%If infolink="/[type:id]-[type:page]-[type:class][type:html]" Then echo " selected=""selected"" "%> value="/[type:id]-[type:page]-[type:class][type:html]">伪静态：例 /1-2-wap<%=SEO_Bak%> </option>
<option <%If infolink="/[type:en]/[type:id]/[type:page]/[type:class]/" Then echo " selected=""selected"" "%> value="/[type:en]/[type:id]/[type:page]/[type:class]/">伪静态：例 /栏目英文名称/1/2/wap/ </option>
<option <%If infolink="/[type:en]/[type:id]/[type:page]/[type:class][type:html]" Then echo " selected=""selected"" "%> value="/[type:en]/[type:id]/[type:page]/[type:class][type:html]">伪静态：例 /栏目英文名称/1/2/wap<%=SEO_Bak%> </option>
<option <%If infolink="/[type:en]/[type:id]-[type:page]-[type:class]/" Then echo " selected=""selected"" "%>value="/[type:en]/[type:id]-[type:page]-[type:class]/">伪静态：例 /栏目英文名称-1-2-wap/ </option>
<option <%If infolink="/[type:en]-[type:id]-[type:page]-[type:class][type:html]" Then echo " selected=""selected"" "%> value="/[type:en]-[type:id]-[type:page]-[type:class][type:html]">伪静态：例 /栏目英文名称-1-2-wap<%=SEO_Bak%> </option>
</select>
</label>
</td>
</tr>
<tr>
<td>是否显示：</td>
<td>
<label for="display"style="width:100%">
<select name="display" size="" style="width:100%">
<option value="0"<%If display=0 Then echo " selected=""selected"" " %>> 显示</option>	
<option value="1"<%If display=1 Then echo " selected=""selected"" " %>> 隐藏</option>
<option value="2"<%If display=2 Then echo " selected=""selected"" " %>> 禁用</option>	
</select>
</label>
</td>
</tr>
<tr>
<td>显示分组：</td>
<td>
<label for="address" style="width: 100%;">
<select name="address" size="" style="width: 100%;">
<option value="0"<%If address=0 Then echo " selected=""selected"" " %>> 0</option>
<option value="1"<%If address=1 Then echo " selected=""selected"" " %>> 1</option>	
<option value="2"<%If address=2 Then echo " selected=""selected"" " %>> 2</option>	
<option value="3"<%If address=3 Then echo " selected=""selected"" " %>> 3</option>
<option value="4"<%If address=4 Then echo " selected=""selected"" " %>> 4</option>	
<option value="5"<%If address=5 Then echo " selected=""selected"" " %>> 5</option>	
<option value="6"<%If address=6 Then echo " selected=""selected"" " %>> 6</option>	
<option value="7"<%If address=7 Then echo " selected=""selected"" " %>> 7</option>	
<option value="8"<%If address=8 Then echo " selected=""selected"" " %>> 8</option>	
<option value="9"<%If address=9 Then echo " selected=""selected"" " %>> 9</option>								
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
<option value=' target="_blank"'<%If Instr(target,"blank")>0 Then echo " selected=""selected""" %> > _blank</option>	
<option value=' target="_self"'<%If Instr(target,"self")>0 Then echo " selected=""selected""" %> > _self</option>	
<option value=' target="_parent"'<%If Instr(target,"parent")>0 Then echo " selected=""selected""" %> > _parent</option>	
<option value=' target="_top"'<%If Instr(target,"top")>0 Then echo " selected=""selected""" %> > _top</option>	
</select>
</label>
</td>
</tr>
<tr>
<td>栏目排序：</td>
<td><input name="sort" type="text" class="text" value="<%=sort%>" style="width: 100%;" /></td>
</tr>
<tr>
<td>栏目标题：</td>
<td ><input name="title" type="text" value="<%=title%>" style="width: 100%;" /></td>
</tr>
<tr >
<td>内容图片：</td>
<td><input name="img" class="ke-input-text" type="text" id="url" value="<%=img%>"/> <input type="button" id="uploadButton" value="上传"/> &nbsp;&nbsp; 设置内容第<input style="width:30px" name="imgstr" type="text" value=""/>张为缩略图</td>
</tr>
<tr>
<td>栏目标签：</td>
<td><input name="keyword" type="text" value="<%=keyword%>" placeholder="请使用英文逗号中文，隔开（栏目关键词）" style="width: 100%;"/></td>
</tr>
<tr>
<tr>
<td>栏目描述：</td>
<td><textarea name="idesc" rows="3" style="width: 100%;"><%=idesc%></textarea></td>
</tr>
<tr id="hid6">
<td>详细内容：<br /><br /><a>插入分页<br />{new:page}</a></td>
<td><input name="down" type="checkbox" value="1" <%If Pic_Down=1 Then echo "checked "%>/> 不保存远程图片 &nbsp;&nbsp; &nbsp;&nbsp; 自动摘取前<input style="width:35px" name="descstr" type="text" value="<%=SEO_Desc%>"/>字到描述<textarea id="editor_id" name="info" style="width:100%;height:400px;" ><%=info%></textarea></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="提交" />  <input type="reset" value="重置" /></td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
</div>
<a id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="icon-double-angle-up icon-only bigger-110"></i></a>
</div>
</body>
</html>