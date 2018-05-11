<!--#include file="Inc/Class.asp" --><%Call EditKeys()%>
<!DOCTYPE html>
<html>
<head>
<title>首页<%=SEO_Conn&Inc_CMD%></title>
<!--#include file="Inc/Config/New_Head.asp" -->
</head>
<body <%=Inc_Beijing%>>
<!--#include file="Inc/Config/New_Top.asp" -->
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
<li class="active">系统首页</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<div class="alert alert-block alert-success">
<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
<i class="icon-ok green"></i>欢迎使用
<strong class="green"><%=Inc_Title%></strong>，当前版本信息：<strong class="green"><%=Inc_vers%> <script src="http://zhanxincheng.com/app/api.asp?r=vers&vers=<%=inc_Vers%>"></script></strong>，授权类型：<strong class="green"><script src="http://zhanxincheng.com/app/api.asp?r=type&type=<%=Inc_keys%>"></script></strong>。	
</div>
<div class="col-xs-12">
<center>
<div class="infobox infobox-blue">
<div class="infobox-progress">
<div class="easy-pie-chart percentage easyPieChart" data-percent="42" data-size="46" style="width: 46px; height: 46px; line-height: 46px;">
<span class="percent" style="font-size: 23px;font-weight: 100;">内容</span>
<canvas width="46" height="46"></canvas></div>
</div>
<div class="infobox-data"><%HomeStr%>
<span>本月：<%=MRead_Num%></span>
<div class="infobox-content">
<span>全部：<%=Read_Num%></span>
</div>
</div>
</div>
<div class="infobox infobox-green2">
<div class="infobox-progress">
<div class="easy-pie-chart percentage easyPieChart" data-percent="42" data-size="46" style="width: 46px; height: 46px; line-height: 46px;">
<span class="percent" style="font-size: 23px;font-weight: 100;">栏目</span>
<canvas width="46" height="46"></canvas></div>
</div>
<div class="infobox-data">
<span>内容：<%=NavRead_Num%></span>
<div class="infobox-content">
<span>全部：<%=Nav_Num%></span>
</div>
</div>
</div>
<div class="infobox infobox-pink">
<div class="infobox-progress">
<div class="easy-pie-chart percentage easyPieChart" data-percent="42" data-size="46" style="width: 46px; height: 46px; line-height: 46px;">
<span class="percent" style="font-size: 23px;font-weight: 100;">互动</span>
<canvas width="46" height="46"></canvas></div>
</div>
<div class="infobox-data">
<span>评论：<%=Comment_Num%></span>
<div class="infobox-content">
<span>留言：<%=message_Num%></span>
</div>
</div>
</div>
<div class="infobox infobox-black">
<div class="infobox-progress">
<div class="easy-pie-chart percentage easyPieChart" data-percent="42" data-size="46" style="width: 46px; height: 46px; line-height: 46px;">
<span class="percent" style="font-size: 23px;font-weight: 100;">待审</span>
<canvas width="46" height="46"></canvas></div>
</div>
<div class="infobox-data">
<span>评论：<%=SComment_Num%></span>
<div class="infobox-content">
<span>留言：<%=Smessage_Num%></span>
</div>
</div>
</div>
<div class="infobox infobox-blue">
<div class="infobox-progress">
<div class="easy-pie-chart percentage easyPieChart" data-percent="42" data-size="46" style="width: 46px; height: 46px; line-height: 46px;">
<span class="percent" style="font-size: 23px;font-weight: 100;">友链</span>
<canvas width="46" height="46"></canvas></div>
</div>
<div class="infobox-data">
<span>本月：<%=MLink_Num%></span>
<div class="infobox-content">
<span>全部：<%=Link_Num%></span>
</div>
</div>
</div>
<div class="infobox infobox-red">
<div class="infobox-progress">
<div class="easy-pie-chart percentage easyPieChart" data-percent="42" data-size="46" style="width: 46px; height: 46px; line-height: 46px;">
<span class="percent" style="font-size: 23px;font-weight: 100;">标签</span>
<canvas width="46" height="46"></canvas></div>
</div>
<div class="infobox-data">
<span>本月：<%=MTags_Num%></span>
<div class="infobox-content">
<span>全部：<%=Tags_Num%></span>
</div>
</div>
</div>
<div class="infobox infobox-green">
<div class="infobox-progress">
<div class="easy-pie-chart percentage easyPieChart" data-percent="42" data-size="46" style="width: 46px; height: 46px; line-height: 46px;">
<span class="percent" style="font-size: 23px;font-weight: 100">广告</span>
<canvas width="46" height="46"></canvas></div>
</div>
<div class="infobox-data">
<span>到期：<%=ADq_Num%></span>
<div class="infobox-content">
<span>全部：<%=AD_Num%></span>
</div>
</div>
</div>
<div class="infobox infobox-green2">
<div class="infobox-progress">
<div class="easy-pie-chart percentage easyPieChart" data-percent="42" data-size="46" style="width: 46px; height: 46px; line-height: 46px;">
<span class="percent" style="font-size: 23px;font-weight: 100;">用户</span>
<canvas width="46" height="46"></canvas></div>
</div>
<div class="infobox-data">
<span>全部：<%=User_Num%>个</span>
<div class="infobox-content">
<span>作者：<%=author_Num%>人</span>
</div>
</div>
</div>
</center>
<div class="space-6"></div>
<center>
<div class="infobox infobox-green infobox-small infobox-dark" style="text-align: center;margin: 0 auto;padding: 13px 0px 0px 0;font-size: 16px;">
<a href="<%=Inc_AddRead%>" style="color:#fff">发布内容</a>
</div>
<div class="infobox infobox-blue infobox-small infobox-dark" style="text-align: center;margin: 0 auto;padding: 13px 0px 0px 0;font-size: 16px;">
<a href="<%=Inc_AddColumn%>" style="color:#fff">新增栏目</a>
</div>
<div class="infobox infobox-brown infobox-small infobox-dark" style="text-align: center;margin: 0 auto;padding: 13px 0px 0px 0;font-size: 16px;">
<a href="<%=Inc_AddLink%>" style="color:#fff">新增友链</a>
</div>
<div class="infobox infobox-blue2 infobox-small infobox-dark" style="text-align: center;margin: 0 auto;padding: 13px 0px 0px 0;font-size: 16px;">
<a href="<%=Inc_BasicSettings%>" style="color:#fff">基本设置</a>
</div>
<div class="infobox infobox-pink infobox-small infobox-dark" style="text-align: center;margin: 0 auto;padding: 13px 0px 0px 0;font-size: 16px;">
<a href="<%=Inc_SEOSettings%>" style="color:#fff">SEO设置</a>
</div>
<div class="infobox infobox-red infobox-small infobox-dark" style="text-align: center;margin: 0 auto;padding: 13px 0px 0px 0;font-size: 16px;">
<a href="<%=Inc_PictureSettings%>" style="color:#fff">图片水印</a>
</div>
<div class="infobox infobox-black infobox-small infobox-dark" style="text-align: center;margin: 0 auto;padding: 13px 0px 0px 0;font-size: 16px;">
<a href="<%=Inc_Tagsdesc%>" style="color:#fff">标签大全</a>
</div>
</center>
<div class="space-6"></div>
<div class="col-xs-12">
<div class="widget-box transparent" id="recent-box">
<div class="widget-header">
<h4 class="lighter smaller">
<i class="icon-rss orange"></i>
相关信息
</h4>
<div class="widget-toolbar no-border">
<ul class="nav nav-tabs" id="recent-tab">
<li class="active"><a data-toggle="tab" href="#task-tab">系统信息</a></li>
<li><a data-toggle="tab" href="#member-tab">程序相关</a></li>
<li><a data-toggle="tab" href="#comment-tab">使用协议</a></li>
</ul>
</div>
</div>
<div class="widget-body">
<div class="widget-main padding-4">
<div class="tab-content padding-8 overFlowNum-visible">
<div id="task-tab" class="tab-pane active">
<table class="table table-striped table-bordered table-hover">
<thead class="thin-border-bottom">
<tr>
<th>程序系统</th>
<th width="70%">信息版本</th>
</tr>
</thead>
<tbody>
<tr>
<td>激活密匙</td>
<td>
<form class="form-search" method="post" action="?keys=true">
<input name="Inc_keys" type="text" value="<%=Inc_keys%>" style="width:213px"/>
<button style="font-size: 12px;padding: 1px 10px;top: -2px;" class="btn" type="submit">提交</button> 
</form>
</td>
</tr>
<tr>
<td>网站绑定域名：</td>
<td><a><%=Fun_dname%></a></td>
</tr>
<tr>
<td>网站&nbsp; IP&nbsp; 端口：</td>
<td><a>IP:（<%=Request.ServerVariables("LOCAL_ADDR")%> ）端口：<%=Request.ServerVariables("SERVER_PORT")%> </a></td>
</tr>
<tr>
<td>站点物理路径：</td>
<td><a><%=request.ServerVariables("APPL_PHYSICAL_PATH")%></a></td>
</tr>
<tr>
<td>FSO文本读写：</td>
<td><a><%=FunOK("fso")%></a></td>
</tr>
<tr>
<td>JMail组件状态：</td>
<td><a><%=FunOK("jmail")%></a></td>
</tr>
<tr>
<td>ASPJpeg组件：</td>
<td><a><%=FunOK("jpeg")%></a></td>
</tr>
<tr>
<td>脚本解释引擎：</td>
<td><a><%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %> </a></td>
</tr>
<tr>
<td>服务器IIS版本：</td>
<td><a><%=Request.ServerVariables("SERVER_SOFTWARE")%></a></td>
</tr>
</tr>
<tr>
<td>服务协议版本：</td>
<td><a><%=Request.ServerVariables("SERVER_PROTOCOL")%></a></td>
</tr>
<tr>
<td>脚本超时时间：</td>
<td><a><%=Server.ScriptTimeout%>秒 </a></td>
</tr>
</tbody>
</table>										
</ul>
</div>
<div id="member-tab" class="tab-pane">
<table class="table table-striped table-bordered table-hover">
<thead class="thin-border-bottom">
<tr>
<th>授权密匙</th>
<th width="70%">
<%=Inc_keys%>
</th>
</tr>
<tr>
<th>授权类型</th>
<th width="70%"><script src="http://zhanxincheng.com/app/api.asp?r=type&type=<%=Inc_keys%>"></script></th>
</tr>
</thead>
<tbody>
<tr>
<td>程序名称：</td>
<td><a><%=Inc_title%></a></td>
</tr>
<tr>
<td>版本信息：</td>
<td><a><%=Inc_vers%></a></td>
</tr>
<tr>
<td>总策划者：</td>
<td><a href="http://zhanxincheng.com/?xincheng" target="_black">新成</a></td>
</tr>
<tr>
<td>程序团队：</td>
<td><a href="http://zhanxincheng.com/?xincheng" target="_black">新成</a></td>
</tr>
<tr>
<td>界面团队：</td>
<td><a href="http://zhanxincheng.com/?Ace" target="_black">Ace（后台UI）</a>
</td>
</tr>
</tbody>
</table>
</div>

<div id="comment-tab" class="tab-pane">
<div class="comments">
<div class="itemdiv commentdiv">
<%=NewCms()%>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row">
<div class="col-sm-6">
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="icon-double-angle-up icon-only bigger-110"></i></a>
</div>
</html>