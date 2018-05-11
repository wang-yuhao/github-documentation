<!--#include file="../Inc/New_Data.asp"-->
<!--#include file="../Inc/New_Temp.asp"-->
<!--#include file="../Inc/New_Function.asp"-->
<%
Rem /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Rem 程序名称：New Cms
Rem 程序作者：新成
Rem 作者博客：http://zhanxincheng.com/
Rem //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
If Not Fun_Null(Fun_File(New_Root&"/install/index.html")) Then 
InfoStr "已经安装成功",Inc_title,"已经安装成功，无需安装！，如果想重新安装请删除"&New_Root&"/install/index.html",""
End If
If Fun_GetID("type","get")="all" Then
strhtml=Fun_File(New_Root&"/inc/New_Config.asp")
strhtml=reInfo(strhtml,"New_On=","'|",0)
Fun_FeText New_Root&"/inc/New_Config.asp",strhtml
exe.StrRS "SELECT * FROM {Acc}User","r3"
exe.RS("name")=Fun_GetID("user","post")
exe.RS("pass")=MD5(Fun_GetID("pass","post"))
exe.RS("nickname")=Fun_GetID("nickname","post")
exe.RS("addtime")=Now()
exe.RS("edittime")=Now()
exe.RS("ip")=Fun_GetIP()
exe.RS.update
exe.OverRS()
exe.StrRS "SELECT * FROM {Acc}Set","r3"
exe.RS("title")=Fun_GetID("title","post")
exe.RS("name")=Fun_GetID("name","post")
exe.RS("addtime")=Now()
exe.RS("edittime")=Now()
exe.RS("ip")=Fun_GetIP()
exe.RS.update
exe.OverRS()
Fun_FeText New_Root&"/install/index.html","New Cms <a href=""http://zhanxincheng.com/"">新成博客</a> 提供技术支持"
InfoStr "安装成功",Inc_title,"安装成功，正在跳转到登陆，请稍等！",New_Root&New_admin&"/login.asp"
End If
%>
<!DOCTYPE html >
<html>
<head>
<title>程序安装<%=SEO_Conn&Inc_Cmd%></title>
<meta charset="UTF-8" />
<style>
*{font-family: 微软雅黑;}
input[type="text"]{width: 300px;}
</style>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="robots" content="none"/>
<link rel="stylesheet" href="<%=New_Root&New_upLoad%>/css/userskin.css"/>
<link rel="shortcut icon" href="<%=New_Root&New_upLoad%>/img/favicon.ico"/>
<script src="<%=New_Root&New_upLoad%>/js/jquery.js"></script>
<script src="<%=New_Root&New_upLoad%>/js/layer.js"></script>
<script>
$(function() {
	$("#submit").click(function() {
		var title = $("#title");
		var name = $("#name");
		var url = $("#url");
		var nickname = $("#nickname");
		var user = $("#user");
		var pass = $("#pass");
		var keys = $("#keys");

		if (title.length > 0) {
			if (title.val() == "") {
				layer.msg("请填写网站标题", {
					icon: 5
				});
				title.css({
					border: "1px solid #f60",
					background: "#f2f2f2"
				});
				return false
			} 
		}
		
		if (name.length > 0) {
			if (name.val() == "") {
				layer.msg("请填写网站名称", {
					icon: 5
				});
				name.css({
					border: "1px solid #f60",
					background: "#f2f2f2"
				});
				return false
			} 
		}
		
		if (nickname.length > 0) {
			if (nickname.val() == "") {
				layer.msg("请填写账号昵称", {
					icon: 5
				});
				nickname.css({
					border: "1px solid #f60",
					background: "#f2f2f2"
				});
				return false
			} 
		}
		
		if (user.length > 0) {
			if (user.val() == "") {
				layer.msg("请填写账号", {
					icon: 5
				});
				user.css({
					border: "1px solid #f60",
					background: "#f2f2f2"
				});
				return false
			} 
		}
		
		if (pass.length > 0) {
			if (pass.val() == "") {
				layer.msg("请填写密码", {
					icon: 5
				});
				pass.css({
					border: "1px solid #f60",
					background: "#f2f2f2"
				});
				return false
			} else {
				if (pass.val().length < 7) {
					layer.msg("密码最低6位", {
						icon: 5
					});
					pass.css({
						border: "1px solid #f60",
						background: "#f2f2f2"
					});
					return false
				}
			}
		}
				
		if (keys.length > 0) {
			if (keys.val() == "") {
				layer.msg("请填写密匙<br />免费密匙：NEWCMS201611005000000ZXC", {
					icon: 5
				});
				keys.css({
					border: "1px solid #f60",
					background: "#f2f2f2"
				});
				return false
			} else {
				if (keys.val().length != 24) {
					layer.msg("密匙输入错误<br />免费密匙：NEWCMS201611005000000ZXC", {
						icon: 5
					});
					keys.css({
						border: "1px solid #f60",
						background: "#f2f2f2"
					});
					return false
				} else {
					if (keys.val().indexOf("NEWCMS")==-1) {
					layer.msg("密匙输入错误<br />免费密匙：NEWCMS201611005000000ZXC", {
						icon: 5
					});
					keys.css({
						border: "1px solid #f60",
						background: "#f2f2f2"
					});
					return false
					}
					}
			}
		}
	});

});
</script>
</head>
<br />
<br />
<br />
<br />
<br />
<center>
<h2>New Cms 系统安装</h2>
<h5><a href="http://zhanxincheng.com/">新成博客</a> 提供技术支持</h5>
</center>
<center>
<form action="?type=all" method="post" >
<p>首页标题：<input type="text" name="title" id="title" /></p>
<p>网站名称：<input type="text" name="name" id="name" /></p>
<p>网站地址：<input type="text" name="url" id="url" value="<%=Fun_Dname%>"/></p>
<p>账号昵称：<input type="text" name="nickname" id="nickname" /></p>
<p>后台账号：<input type="text" name="user" id="user" /></p>
<p>后台密码：<input type="text" name="pass" id="pass" /></p>
<p>系统密匙：<input type="text" name="keys" id="keys" value="NEWCMS201611005000000ZXC" readonly="readonly" /></p>
<p><input type="submit" class="btn" value="提交信息" id="submit" /></p>
<small>采用New Cms 强力驱动 版本号：<%=Inc_vers%></small>
</form>
</center>
</body>
</html>