<!--#include file="Inc/Class.asp" -->
<%
If Fun_URLID("type") = "edit" Then 
If Fun_Null(Fun_GetId("addtime","post")) Then addtime=Now() Else addtime=Fun_GetId("addtime","post")
EditData "{Acc}Set",1,"name,logo,ico,title,keyword,idesc,url,slogan,icp,mail,qq,tel,iuser,notice,copy,stat,foot,fax,phone,company,address,support,addtime|"&addtime&",edittime|"&Now()&",ip|"&Fun_GetIP()&""
InfoStr Inc_200,Inc_title,"基本信息修改成功！",Inc_BasicSettings
End If
dim name,logo,ico,title,keyword,idesc,url,slogan,icp,mail,qq,tel,iuser,notice,copy,stat,foot,addtime,fax,phone,company,address,support
ReadData "{Acc}Set","","name,logo,ico,title,keyword,idesc,url,slogan,icp,mail,qq,tel,iuser,notice,copy,stat,foot,addtime,fax,phone,company,address,support"
If Fun_Null(url) Then url=Fun_Dname
%><!DOCTYPE html>
<html>
<head>	
<title>基本设置<%=SEO_Conn&Inc_CMD%></title>
<!--#include file="Inc/Config/New_Head.asp" -->
<link rel="stylesheet" href="edit/themes/default/default.css" />
<script charset="utf-8" src="edit/kindeditor-min.js"></script>
<script>
KindEditor.ready(function(K) {
				var uploadbutton = K.uploadbutton({
					button : K('#uploadButton')[0],
					fieldName : 'imgFile',
					url : 'edit/asp/upload.asp?type=logo',
					afterUpload : function(data) {
						if (data.error === 0) {
							var url = K.formatUrl(data.url, 'absolute');
							K('#logo').val(url);
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
KindEditor.ready(function(K) {
				var uploadbutton = K.uploadbutton({
					button : K('#uploadico')[0],
					fieldName : 'imgFile',
					url : 'edit/asp/upload.asp?type=ico',
					afterUpload : function(data) {
						if (data.error === 0) {
							var url = K.formatUrl(data.url, 'absolute');
							K('#ico').val(url);
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
<!--#include file="Inc/Config/New_Top.asp" --><%exe.OverConn()%>
<div class="main-container" id="main-container">
<script type="text/javascript">try{ace.settings.check('main-container' , 'fixed')}catch(e){}</script>
<div class="main-container-inner">
<a class="menu-toggler" id="menu-toggler" href="#"><span class="menu-text"></span></a>
<!--#include file="Inc/Config/New_Sidebar.asp" -->
<div class="main-content">
<div class="breadcrumbs" id="breadcrumbs">
<script type="text/javascript">try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}</script>
<ul class="breadcrumb">
<li><i class="icon-home home-icon"></i><a href="<%=Inc_Index%>">首页</a>
<li>基本设置</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<div class="col-xs-12">
<div class="table-responsive">
<form method="post" action="?type=edit" >
<table id="sample-table-2" class="table table-striped table-bordered table-hover">
<thead>
</thead>
<tbody>
<tr>
<td width="15%">网站名称：</td>
<td><input style="width:100%" name="name" type="text" value="<%=name%>" /></td>
</tr>
<tr >
<td>网站口号：</td>
<td><input style="width:100%" name="slogan" type="text" value="<%=slogan%>"/></td>
</tr>
<tr >
<td>LOGO图：</td>
<td><input name="logo" class="ke-input-text" type="text" id="logo" value="<%=logo%>" /> <input type="button" id="uploadButton" value="上传" /></td>
</tr>
<tr >
<td>网站 ico：</td>
<td><input name="ico" class="ke-input-text" type="text" id="ico" value="<%=ico%>" /> <input type="button" id="uploadico" value="上传" /></td>
</tr>
<tr>
<td>首页标题：</td>
<td><input style="width:100%" name="title" type="text" value="<%=title%>"/></td>
</tr>
<tr>
<td>首页标签：</td>
<td><input style="width:100%" name="keyword" type="text" value="<%=keyword%>"/></td>
</tr>
<tr>
<td>首页描述：</td>
<td><textarea style="width:100%" name="idesc" rows="2"><%=idesc%></textarea></td>
</tr>
<tr>
<td>网站网址：</td>
<td><input style="width:100%" name="url" type="text" value="<%=Url%>"/></td>
</tr>
<tr>
<td>网站站长：</td>
<td><input style="width:100%"  name="iuser" type="text" value="<%=iuser%>"/></td>
</tr>
<tr>
<td>站长Q Q：</td>
<td><input style="width:100%" name="qq" type="text" value="<%=qq%>"/></td>
</tr>
<tr>
<td>站长邮箱：</td>
<td><input style="width:100%" name="mail" type="text" value="<%=mail%>"/></td>
</tr>
<tr>
<td>公司名称：</td>
<td><input style="width:100%" name="company" type="text" value="<%=company%>"/></td>
</tr>
<tr>
<td>公司地址：</td>
<td><input style="width:100%" name="address" type="text" value="<%=address%>"/></td>
</tr>
<tr>
<td>公司电话：</td>
<td><input style="width:100%" name="tel" type="text" value="<%=tel%>"/></td>
</tr>
<tr>
<td>公司传真：</td>
<td><input style="width:100%" name="fax" type="text" value="<%=fax%>"/></td>
</tr>
<tr>
<td>公司手机：</td>
<td><input style="width:100%" name="phone" type="text" value="<%=phone%>"/></td>
</tr>
<tr>
<td>技术支持：</td>
<td><input style="width:100%" name="support" type="text" value="<%=support%>"/></td>
</tr>
<tr>
<td>建站日期：</td>
<td><input style="width:100%" name="addtime" type="text" value="<%=addtime%>"/></td>
</tr>
<tr>
<td>备案信息：</td>
<td><input style="width:100%" name="icp" type="text" value="<%=icp%>"/></td>
</tr>
<tr>
<td>网站公告：</td>
<td><textarea style="width:100%" name="notice" rows="4"><%=notice%></textarea></td>
</tr>
<tr>
<td>版权信息：</td>
<td><textarea style="width:100%" name="copy" rows="4"><%=copy%></textarea></td>
</tr>
<tr>
<td>页尾导航：</td>
<td><textarea style="width:100%" name="foot" rows="4"><%=foot%></textarea></td>
</tr>
<tr>
<td>统计代码：</td>
<td><textarea style="width:100%" name="stat" rows="4"><%=stat%></textarea></td>
</tr>
<tr>
<tr>
<td>提交重置：</td>
<td><input type="submit" value="提交" /> <input type="reset" value="重置" /> </td>
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