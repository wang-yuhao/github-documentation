<!--#include file="Inc/Class.asp" -->
<!DOCTYPE html>
<html>
<head>	
<title>标签大全<%=SEO_conn&Inc_CMD%></title>
<!--#include file="Inc/Config/New_Head.asp" -->
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
<li>标签大全</li>
</div>
<div class="page-content">
<div class="row">
<div class="col-xs-12">
<div class="table-responsive">
<form name="form" method="post" action="?type=del">
<table id="sample-table-2" class="table table-striped table-bordered table-hover">
<thead>


</thead>
<tbody>
<tr>
<td colspan="2" id="qjbq"><strong>一、全局标签：</strong></td>
</tr>
<tr>
<td colspan="2" id="jbbq"><strong>1.基本标签：</strong></td>
</tr>
<tr>
<td>
{new:name}<br />
{new:conn}<br />
{new:logo}<br />
{new:ico}<br />
{new:temp}<br />
{new:root}<br />
{new:title}<br />
{new:keyword}<br />
{new:desc}<br />
{new:url}<br />
{new:slogan}<br />
{new:user}<br />
{new:icp}<br />
{new:mail}<br />
{new:qq}<br />
{new:tel}<br />
{new:fax}<br />
{new:phone}<br />
{new:company}<br />
{new:address}<br />
{new:support}<br />
{new:notice}<br />
{new:copy}<br />
{new:stat}<br />
{new:foot}<br />
{new:size}<br />
{new:navconn}<br />
{new:addtime}<br />
{new:calendar}<br />
{new:cndate}<br />
{new:gap}<br />
{new:client}<br />
{new:visit}<br />
{new:infonum}<br /> 
{new:messagenum}<br />
{new:commentnum}<br /> 
{new:commentall}<br />
{new:tagsnum}<br />
{new:navnum}<br />
</td>
<td>
网站名称<br />
连接符<br />
logo<br />
ico<br />
模板目录<br />
根目录<br />
标题<br />
关键词<br />
描述<br />
网址<br />
网站口号<br />
网站站长<br />
备案信息<br />
电子邮箱<br />
QQ号码<br />
电话<br />
传真<br />
手机<br />
公司名称<br />
公司地址<br />
技术支持<br />
网站公告<br />
版权信息<br />
统计代码<br />
底部信息<br />
输出数量<br />
面包屑链接符<br />
建站时间<br />
日历<br />
农历<br />
建站距离今天的时间<br />
当前设备客户端<br />
浏览量<br />
内容数量<br />
留言数量<br />
评论数量<br />
留言+评论数量<br />
标签数量<br />
栏目数量<br />
</td>
</tr>
<tr>
<td colspan="2" id="fzmb"><strong>2.辅助模板：</strong></td>
</tr>
<tr>
<td>{newcms:template src=xxx.html}</td>
<td>辅助模板</td>
</tr>
<tr>
<td colspan="2" id="ggbq"><strong>3.广告标签：</strong></td>
</tr>
<tr>
<td>{new:ad id=1}</td>
<td>广告调用标签，id为编号</td>
</tr>
<td colspan="2" id="tjpd"><strong>4.条件判断：</strong></td>
</tr>
<tr>
<td>
{if:0=1}a{else}b{end if} 
<br />
{if:"真"="真"}a{end if}
</td>
<td>
输出结果：b
<br />
输出结果：a  字符形式判断请加英文""。
</td>
</tr>
<tr>
<td colspan="2" id="xhsc"><strong>5.循环输出：</strong></td>
</tr>
<tr>
<td>{for:5}0{next} </td>
<td>输出结果：00000</td>
</tr>
<tr>
<td colspan="2" id="wxjdh"><strong>6.无限极导航：</strong></td>
</tr>
<tr>
<td>
{new:navlist num=10 id=1 type=0 class=0}<br />
&nbsp;&nbsp;&nbsp;&nbsp;[navlist:id]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[navlist:name len=10]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[navlist:enname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[navlist:target]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[navlist:img]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[navlist:info len=100]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[navlist:link]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[navlist:down]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{new:2navlist type=[navlist:id]}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[2navlist:id]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[2navlist:name len=10]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[2navlist:enname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[2navlist:target]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[2navlist:img]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[2navlist:info len=100]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[2navlist:link]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{new:3navlist type=[2navlist:id]}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[3navlist:id]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[3navlist:name len=10]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[3navlist:enname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[3navlist:target]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[3navlist:img]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[3navlist:info len=100]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[3navlist:link]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{/new:3navlist}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{/new:2navlist}<br />
{/new:list}<br />
 </td>
<td>
num：输出数量，可选&nbsp;&nbsp;&nbsp;&nbsp;id：输出顶级id下导航 可选&nbsp;&nbsp;&nbsp;&nbsp;type：输出下级导航 可选&nbsp;&nbsp;&nbsp;&nbsp;class：0-9（分组）可选<br />
&nbsp;&nbsp;&nbsp;&nbsp;编号<br />
&nbsp;&nbsp;&nbsp;&nbsp;导航名称&nbsp;&nbsp;&nbsp;&nbsp;len：输出数量，可选<br />
&nbsp;&nbsp;&nbsp;&nbsp;导航英文名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;导航打开方式<br />
&nbsp;&nbsp;&nbsp;&nbsp;导航图片<br />
&nbsp;&nbsp;&nbsp;&nbsp;导航内容&nbsp;&nbsp;&nbsp;&nbsp;len：输出数量，可选<br />
&nbsp;&nbsp;&nbsp;&nbsp;导航链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;存在下降导航返回ture<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2级：num：输出数量，可选&nbsp;&nbsp;&nbsp;&nbsp;id：输出顶级id下导航 可选&nbsp;&nbsp;&nbsp;&nbsp;type：输出下级导航 可选&nbsp;&nbsp;&nbsp;&nbsp;class：0-9（分组）可选<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编号<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2级：导航名称&nbsp;&nbsp;&nbsp;&nbsp;len：输出数量，可选<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2级：导航英文名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2级：导航打开方式<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2级：导航图片<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2级：导航内容&nbsp;&nbsp;&nbsp;&nbsp;len：输出数量，可选<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2级：导航链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3级：num：输出数量，可选&nbsp;&nbsp;&nbsp;&nbsp;id：输出顶级id下导航 可选&nbsp;&nbsp;&nbsp;&nbsp;type：输出下级导航 可选&nbsp;&nbsp;&nbsp;&nbsp;class：0-9（分组）可选<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3级：编号<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3级：导航名称&nbsp;&nbsp;&nbsp;&nbsp;len：输出数量，可选<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3级：导航英文名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3级：导航打开方式<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3级：导航图片<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3级：导航内容&nbsp;&nbsp;&nbsp;&nbsp;len：输出数量，可选<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3级：导航链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3级：闭合标签<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2级：闭合标签<br />
闭合标签<br />
</td>
</tr>
<tr>
<td colspan="2" id="ddlmdy"><strong>7.单独栏目调用：</strong></td>
</tr>
<tr>
<td>
{new:nav id=1}<br />         
&nbsp;&nbsp;&nbsp;&nbsp;[nav:id]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[nav:name len=10]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[nav:enname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[nav:link]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[nav:target]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[nav:img]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[nav:info len=100]<br />
{/new:nav}
</td>
<td>
id：栏目编号，必填<br />
&nbsp;&nbsp;&nbsp;&nbsp;编号<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目名称 len：输出数量，可选<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目英文名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目打开方式<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目图片<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目内容 len：输出数量，可选<br />
闭合标签<br />
</td>
</tr>
<tr>
<td colspan="2" id="rqgd"><strong>8.日期归档：</strong></td>
</tr>
<tr>
<td>
{new:datefile}<br />
&nbsp;&nbsp;&nbsp;&nbsp;[datefile:year]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[datefile:month]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[datefile:num]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[datefile:link]<br />
{/new:datefile}<br />
</td>
<td>
开始标签<br />
&nbsp;&nbsp;&nbsp;&nbsp;年份<br />
&nbsp;&nbsp;&nbsp;&nbsp;月份<br />
&nbsp;&nbsp;&nbsp;&nbsp;数量<br />
&nbsp;&nbsp;&nbsp;&nbsp;链接<br />
闭合标签<br />
</td>
</tr>
<tr>
<td colspan="2" id="nrdy"><strong>9.内容调用：</strong></td>
</tr>
<tr>
<td>
{new:content num=10 id=0 order=id type=img date=year no=1 s=关键词}<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:id]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:strid]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:overid]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:name len=10]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:time type=博客日期格式]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:desc len=100]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:img]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:user]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:link]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:userlink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:i]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:commentnum]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:push]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:top]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:client]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:navname len=10]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:navenname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:infolink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:listlink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:title]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:info len=100]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:tags]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[content:tagslink]<br />
{/new:content}
</td>
<td>
id(指定栏目) order(id,i,time,sort,comment,top,push,toppush,random) type(img,top,push,imgtop,imgpush)<br />
&nbsp;&nbsp;&nbsp;&nbsp;编号<br />
&nbsp;&nbsp;&nbsp;&nbsp;循环id<br />
&nbsp;&nbsp;&nbsp;&nbsp;结束id<br />
&nbsp;&nbsp;&nbsp;&nbsp;名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;时间<br />
&nbsp;&nbsp;&nbsp;&nbsp;描述<br />
&nbsp;&nbsp;&nbsp;&nbsp;图片<br />
&nbsp;&nbsp;&nbsp;&nbsp;作者<br />
&nbsp;&nbsp;&nbsp;&nbsp;来源<br />
&nbsp;&nbsp;&nbsp;&nbsp;作者链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;浏览量<br />
&nbsp;&nbsp;&nbsp;&nbsp;评论数量<br />
&nbsp;&nbsp;&nbsp;&nbsp;推荐<br />
&nbsp;&nbsp;&nbsp;&nbsp;置顶<br />
&nbsp;&nbsp;&nbsp;&nbsp;客户端<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目英文名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;标题<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容<br />
&nbsp;&nbsp;&nbsp;&nbsp;标签<br />
&nbsp;&nbsp;&nbsp;&nbsp;带链接的标签<br />
闭合标签<br />
</td>
</tr>
<tr>
<td colspan="2" id="pldy"><strong>10.评论调用：</strong></td>
</tr>
<tr>
<td>
{new:comment num=10 class=1 id=20}<br />
&nbsp;&nbsp;&nbsp;&nbsp;[comment:name]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[comment:id]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[comment:t]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[comment:img]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[comment:mail]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[comment:qq]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[comment:url]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[comment:tel]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[comment:desc]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[comment:time]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[comment:link]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[comment:vip]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[comment:num]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[comment:client]<br />
{/new:comment}
</td>
<td>
num(输出数量) class(0留言,1评论) id(编号)<br />
&nbsp;&nbsp;&nbsp;&nbsp;名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;编号<br />
&nbsp;&nbsp;&nbsp;&nbsp;楼层<br />
&nbsp;&nbsp;&nbsp;&nbsp;头像<br />
&nbsp;&nbsp;&nbsp;&nbsp;邮箱<br />
&nbsp;&nbsp;&nbsp;&nbsp;Q Q<br />
&nbsp;&nbsp;&nbsp;&nbsp;网址<br />
&nbsp;&nbsp;&nbsp;&nbsp;电话<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容<br />
&nbsp;&nbsp;&nbsp;&nbsp;时间<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;等级<br />
&nbsp;&nbsp;&nbsp;&nbsp;评论数量<br />
&nbsp;&nbsp;&nbsp;&nbsp;客户端<br />
闭合标签
</td>
</tr>
<tr>
<td colspan="2" id="yqljdy"><strong>11.友情链接调用：</strong></td>
</tr>
<tr>
<td>
{new:link num=10 type=logo class=0}<br />
&nbsp;&nbsp;&nbsp;&nbsp;[link:name]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[link:url]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[link:logo]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[link:ico]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[link:desc]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[link:nofollow]<br /> 
&nbsp;&nbsp;&nbsp;&nbsp;[link:qq]<br />
{/new:link}
</td>
<td>
num(输出数量) type(ico,logo) class(0-9)<br />
&nbsp;&nbsp;&nbsp;&nbsp;名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;地址<br />
&nbsp;&nbsp;&nbsp;&nbsp;logo<br />
&nbsp;&nbsp;&nbsp;&nbsp;ico<br />
&nbsp;&nbsp;&nbsp;&nbsp;描述<br />
&nbsp;&nbsp;&nbsp;&nbsp;nofollow<br /> 
&nbsp;&nbsp;&nbsp;&nbsp;qq<br />
闭合标签
</td>
</tr>
<tr>
<td colspan="2" id="nrtpxhsc"><strong>12.内容图片循环输出：</strong></td>
</tr>
<tr>
<td>
{new:imgstr type=1 id=10 num=10}<br />
&nbsp;&nbsp;&nbsp;&nbsp;图片地址<br />
{/new:imgstr}
</td>
<td>
type(0单篇,1内容) id(编号) num(输出数量)<br />
&nbsp;&nbsp;&nbsp;&nbsp;图片地址<br />
闭合标签
</td>
</tr>
<tr>
<td colspan="2" id="tagsdy"><strong>13.Tags调用：</strong></td>
</tr>
<tr>
<td>
{new:tagslist num=10 order=id}<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tagslist:id]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tagslist:name]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tagslist:link]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tagslist:i]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tagslist:ii]<br />
{/new:tagslist}
</td>
<td>
num(输出数量) order(id,i,ii)<br />
&nbsp;&nbsp;&nbsp;&nbsp;编号<br />
&nbsp;&nbsp;&nbsp;&nbsp;名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;浏览量<br />
&nbsp;&nbsp;&nbsp;&nbsp;数量<br />
结束标签
</td>
</tr>
<tr>
<td colspan="2" id="nzhsdy"><strong>14.内置函数调用：</strong></td>
</tr>
<tr>
<td>
{%函数%}
</td>
<td>
例如：{%Now()%},{%SEO_Nav%}。调用asp内置函数
</td>
</tr>
<tr>
<td colspan="2" id="nrtpxhsc"><strong>二、列表页调用标签</strong></td>
</tr>
<tr>
<td>
{new:navid}<br />
{new:rootid}<br />
{new:navname}<br />
{new:navenname}<br />
{new:navtitle}<br />
{new:navkeyword}<br />
{new:navdesc}<br />
{new:recordcount}<br />
{new:pagecount}<br />
{new:pagination}<br />
{new:crumbs}<br />
{new:pagenum num=3,3}<br />
{new:list num=10 order=id}<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:name len=10]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:strid]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:overid]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:top]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:push]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:id]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:title]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:tags]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:tagslink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:desc len=100]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:img]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:info len=200]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:user]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:link]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:userlink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:i]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:time]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:commentnum] <br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:client]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:navname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:navenname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:infolink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[list:listlink]<br />
{/new:list}
</td>
<td>
栏目id<br />
栏目根id<br />
栏目名称<br />
栏目英文名称<br />
栏目标题<br />
栏目关键词<br />
栏目描述<br />
总数<br />
总页数<br />
当前页码<br />
面包屑导航<br />
分页<br />
num(输出数量) order(id,i,time,sort,comment,top,push,toppush,random)<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;循环id<br />
&nbsp;&nbsp;&nbsp;&nbsp;结束id<br />
&nbsp;&nbsp;&nbsp;&nbsp;置顶<br />
&nbsp;&nbsp;&nbsp;&nbsp;推荐<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容id<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容标题<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容标签<br />
&nbsp;&nbsp;&nbsp;&nbsp;带链接的标签<br />
&nbsp;&nbsp;&nbsp;&nbsp;描述<br />
&nbsp;&nbsp;&nbsp;&nbsp;图片<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容<br />
&nbsp;&nbsp;&nbsp;&nbsp;作者<br />
&nbsp;&nbsp;&nbsp;&nbsp;来源<br />
&nbsp;&nbsp;&nbsp;&nbsp;作者链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;浏览量<br />
&nbsp;&nbsp;&nbsp;&nbsp;时间<br />
&nbsp;&nbsp;&nbsp;&nbsp;评论数量<br />
&nbsp;&nbsp;&nbsp;&nbsp;客户端<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目英文名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目链接<br />
闭合标签
</td>
</tr>
<tr>
<td colspan="2" id="dpnrdy"><strong>三、单篇内容调用：</strong></td>
</tr>
<tr>
<td>
{new:navid}<br />
{new:rootid}<br />
{new:navname}<br />
{new:navenname}<br />
{new:navtitle}<br />
{new:navkeyword}<br />
{new:navdesc}<br />
{new:pagination}<br />
{new:crumbs}<br />
[page:title]<br />
[page:name]<br />
[page:enname]<br />
[page:keyword]<br />
[page:desc]<br />
[page:img]<br />
[page:info]<br />
</td>
<td>
栏目id<br />
栏目根id<br />
栏目名称<br />
栏目英文名称<br />
栏目标题<br />
栏目关键词<br />
栏目描述<br />
当前页码<br />
面包屑导航<br />
标题<br />
名称<br />
英文名称<br />
关键词<br />
描述<br />
图片<br />
内容
</td>
</tr>
<tr>
<td colspan="2" id="nrdy"><strong>四、内容调用：</strong></td>
</tr>
<tr>
<td>
{new:navid}<br />
{new:rootid}<br />
{new:navname}<br />
{new:navenname}<br />
{new:navtitle}<br />
{new:pagination}<br />
{new:crumbs}<br />
[read:name]<br />
[read:title]<br />
[read:keyword]<br />
[read:desc]<br />
[read:top]<br />
[read:push]<br />
[read:next]<br />
[read:nextname]<br />
[read:nextlink]<br />
[read:prev]<br />
[read:prevname]<br />
[read:prevlink]<br />
[read:id]<br />
[read:dateid]<br />
[read:tags]<br />
[read:tagslink]<br />
[read:img]<br />
[read:info]<br />
[read:user]<br />
[read:link]<br />
[read:userlink]<br />
[read:i]<br />
[read:time]<br />
[read:edittime]<br />
[read:commentnum]<br />
[read:push]<br />
[read:top]<br />
[read:client]<br />
[read:listlink]<br />
[read:infolink]
</td>
<td>
栏目id<br />
栏目根id<br />
栏目名称<br />
栏目英文名称<br />
栏目标题<br />
当前页码<br />
面包屑导航<br />
内容名称<br />
内容标题<br />
内容关键词<br />
内容描述<br />
置顶<br />
推荐<br />
下一篇<br />
下一篇名称<br />
下一篇链接<br />
上一篇<br />
上一篇名称<br />
上一篇链接<br />
内容id<br />
内容日期id<br />
标签<br />
带链接的标签<br />
图片<br />
内容<br />
作者<br />
来源<br />
作者链接<br />
浏览量<br />
时间<br />
修改时间<br />
评论数量<br />
推荐<br />
置顶<br />
客户端<br />
栏目链接<br />
内容链接
</td>
</tr>
<tr>
<td colspan="2" id="ssydybq"><strong>五、搜索页调用标签</strong></td>
</tr>
<tr>
<td>
{new:navid}<br />
{new:rootid}<br />
{new:navname}<br />
{new:navenname}<br />
{new:navtitle}<br />
{new:navkeyword}<br />
{new:navdesc}<br />
{new:recordcount}<br />
{new:pagecount}<br />
{new:pagination}<br />
{new:crumbs}<br />
{new:pagenum num=3,3}<br />
{search:list num=10 order=id}<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:name len=10]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:strid]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:overid]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:top]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:push]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:id]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:title]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:tags]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:tagslink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:desc len=100]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:img]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:info len=200]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:user]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:link]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:userlink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:i]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:time]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:commentnum] <br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:client]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:navname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:navenname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:infolink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[search:listlink]<br />
{/new:search}
</td>
<td>
栏目id<br />
栏目根id<br />
栏目名称<br />
栏目英文名称<br />
栏目标题<br />
栏目关键词<br />
栏目描述<br />
总数<br />
总页数<br />
当前页码<br />
面包屑导航<br />
分页<br />
num(输出数量) order(id,i,time,sort,comment,top,push,toppush,random)<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;循环id<br />
&nbsp;&nbsp;&nbsp;&nbsp;结束id<br />
&nbsp;&nbsp;&nbsp;&nbsp;置顶<br />
&nbsp;&nbsp;&nbsp;&nbsp;推荐<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容id<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容标题<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容标签<br />
&nbsp;&nbsp;&nbsp;&nbsp;带链接的标签<br />
&nbsp;&nbsp;&nbsp;&nbsp;描述<br />
&nbsp;&nbsp;&nbsp;&nbsp;图片<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容<br />
&nbsp;&nbsp;&nbsp;&nbsp;作者<br />
&nbsp;&nbsp;&nbsp;&nbsp;来源<br />
&nbsp;&nbsp;&nbsp;&nbsp;作者链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;浏览量<br />
&nbsp;&nbsp;&nbsp;&nbsp;时间<br />
&nbsp;&nbsp;&nbsp;&nbsp;评论数量<br />
&nbsp;&nbsp;&nbsp;&nbsp;客户端<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目英文名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目链接<br />
闭合标签
</td>
</tr>
<tr>
<td colspan="2" id="tagsdybq"><strong>六、tags页调用标签</strong></td>
</tr>
<tr>
<td>
{new:navid}<br />
{new:rootid}<br />
{new:navname}<br />
{new:navenname}<br />
{new:navtitle}<br />
{new:navkeyword}<br />
{new:navdesc}<br />
{new:recordcount}<br />
{new:pagecount}<br />
{new:pagination}<br />
{new:crumbs}<br />
{new:pagenum num=3,3}<br />
{tags:list num=10 order=id}<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:name len=10]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:strid]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:overid]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:top]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:push]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:id]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:title]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:tags]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:tagslink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:desc len=100]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:img]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:info len=200]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:user]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:link]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:userlink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:i]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:time]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:commentnum] <br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:client]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:navname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:navenname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:infolink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[tags:listlink]<br />
{/new:tags}
</td>
<td>
栏目id<br />
栏目根id<br />
栏目名称<br />
栏目英文名称<br />
栏目标题<br />
栏目关键词<br />
栏目描述<br />
总数<br />
总页数<br />
当前页码<br />
面包屑导航<br />
分页<br />
num(输出数量) order(id,i,time,sort,comment,top,push,toppush,random)<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;循环id<br />
&nbsp;&nbsp;&nbsp;&nbsp;结束id<br />
&nbsp;&nbsp;&nbsp;&nbsp;置顶<br />
&nbsp;&nbsp;&nbsp;&nbsp;推荐<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容id<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容标题<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容标签<br />
&nbsp;&nbsp;&nbsp;&nbsp;带链接的标签<br />
&nbsp;&nbsp;&nbsp;&nbsp;描述<br />
&nbsp;&nbsp;&nbsp;&nbsp;图片<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容<br />
&nbsp;&nbsp;&nbsp;&nbsp;作者<br />
&nbsp;&nbsp;&nbsp;&nbsp;来源<br />
&nbsp;&nbsp;&nbsp;&nbsp;作者链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;浏览量<br />
&nbsp;&nbsp;&nbsp;&nbsp;时间<br />
&nbsp;&nbsp;&nbsp;&nbsp;评论数量<br />
&nbsp;&nbsp;&nbsp;&nbsp;客户端<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目英文名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目链接<br />
闭合标签
</td>
</tr>
<tr>
<td colspan="2" id="rqgd"><strong>七、日期归档页调用标签</strong></td>
</tr>
<tr>
<td>
{new:navid}<br />
{new:rootid}<br />
{new:navname}<br />
{new:navenname}<br />
{new:navtitle}<br />
{new:navkeyword}<br />
{new:navdesc}<br />
{new:recordcount}<br />
{new:pagecount}<br />
{new:pagination}<br />
{new:crumbs}<br />
{new:pagenum num=3,3}<br />
{date:list num=10 order=id}<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:name len=10]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:strid]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:overid]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:top]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:push]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:id]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:title]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:tags]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:tagslink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:desc len=100]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:img]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:info len=200]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:user]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:link]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:userlink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:i]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:time]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:commentnum] <br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:client]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:navname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:navenname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:infolink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[date:listlink]<br />
{/new:date}
</td>
<td>
栏目id<br />
栏目根id<br />
栏目名称<br />
栏目英文名称<br />
栏目标题<br />
栏目关键词<br />
栏目描述<br />
总数<br />
总页数<br />
当前页码<br />
面包屑导航<br />
分页<br />
num(输出数量) order(id,i,time,sort,comment,top,push,toppush,random)<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;循环id<br />
&nbsp;&nbsp;&nbsp;&nbsp;结束id<br />
&nbsp;&nbsp;&nbsp;&nbsp;置顶<br />
&nbsp;&nbsp;&nbsp;&nbsp;推荐<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容id<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容标题<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容标签<br />
&nbsp;&nbsp;&nbsp;&nbsp;带链接的标签<br />
&nbsp;&nbsp;&nbsp;&nbsp;描述<br />
&nbsp;&nbsp;&nbsp;&nbsp;图片<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容<br />
&nbsp;&nbsp;&nbsp;&nbsp;作者<br />
&nbsp;&nbsp;&nbsp;&nbsp;来源<br />
&nbsp;&nbsp;&nbsp;&nbsp;作者链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;浏览量<br />
&nbsp;&nbsp;&nbsp;&nbsp;时间<br />
&nbsp;&nbsp;&nbsp;&nbsp;评论数量<br />
&nbsp;&nbsp;&nbsp;&nbsp;客户端<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目英文名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目链接<br />
闭合标签
</td>
</tr>
<tr>
<td colspan="2" id="zzzl"><strong>八、作者专栏页调用标签</strong></td>
</tr>
<tr>
<td>
{new:navid}<br />
{new:rootid}<br />
{new:navname}<br />
{new:navenname}<br />
{new:navtitle}<br />
{new:navkeyword}<br />
{new:navdesc}<br />
{new:recordcount}<br />
{new:pagecount}<br />
{new:pagination}<br />
{new:crumbs}<br />
{new:pagenum num=3,3}<br />
{author:list num=10 order=id}<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:name len=10]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:strid]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:overid]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:top]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:push]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:id]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:title]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:tags]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:tagslink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:desc len=100]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:img]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:info len=200]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:user]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:link]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:userlink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:i]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:time]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:commentnum] <br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:client]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:navname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:navenname]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:infolink]<br />
&nbsp;&nbsp;&nbsp;&nbsp;[author:listlink]<br />
{/new:author}
</td>
<td>
栏目id<br />
栏目根id<br />
栏目名称<br />
栏目英文名称<br />
栏目标题<br />
栏目关键词<br />
栏目描述<br />
总数<br />
总页数<br />
当前页码<br />
面包屑导航<br />
分页<br />
num(输出数量) order(id,i,time,sort,comment,top,push,toppush,random)<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;循环id<br />
&nbsp;&nbsp;&nbsp;&nbsp;结束id<br />
&nbsp;&nbsp;&nbsp;&nbsp;置顶<br />
&nbsp;&nbsp;&nbsp;&nbsp;推荐<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容id<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容标题<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容标签<br />
&nbsp;&nbsp;&nbsp;&nbsp;带链接的标签<br />
&nbsp;&nbsp;&nbsp;&nbsp;描述<br />
&nbsp;&nbsp;&nbsp;&nbsp;图片<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容<br />
&nbsp;&nbsp;&nbsp;&nbsp;作者<br />
&nbsp;&nbsp;&nbsp;&nbsp;来源<br />
&nbsp;&nbsp;&nbsp;&nbsp;作者链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;浏览量<br />
&nbsp;&nbsp;&nbsp;&nbsp;时间<br />
&nbsp;&nbsp;&nbsp;&nbsp;评论数量<br />
&nbsp;&nbsp;&nbsp;&nbsp;客户端<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目英文名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;内容链接<br />
&nbsp;&nbsp;&nbsp;&nbsp;栏目链接<br />
闭合标签
</td>
</tr>
</tbody>
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