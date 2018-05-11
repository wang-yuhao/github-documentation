<div class="sidebar" id="sidebar">
<script type="text/javascript">try{ace.settings.check('sidebar' , 'fixed')}catch(e){}</script>
<div class="sidebar-shortcuts" id="sidebar-shortcuts">
<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
<button onclick="javascript:window.location.href='<%=Sidebar_1%>'" class="btn btn-success"><i class="icon-signal"></i></button>
<button onclick="javascript:window.location.href='<%=Sidebar_2%>'" class="btn btn-info"><i class="icon-pencil"></i></button>
<button onclick="javascript:window.location.href='<%=Sidebar_3%>'" class="btn btn-warning"><i class="icon-group"></i></button>
<button onclick="javascript:window.location.href='<%=Sidebar_4%>'" class="btn btn-danger"><i class="icon-cogs"></i></button>
</div>
<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
<span class="btn btn-success"></span>
<span class="btn btn-info"></span>
<span class="btn btn-warning"></span>
<span class="btn btn-danger"></span>
</div>
</div>
<ul class="nav nav-list">
<li <%If Inc_Id = 0 Then echo"class=""active""" %>>
<a href="<%=Inc_Index%>"><i class="icon-desktop"></i><span class="menu-text"> 系统首页 </span></a>
</li>
<li <%If Inc_Id = 1 Then echo"class=""active""" %>>
<a href="" class="dropdown-toggle"><i class="icon-edit"></i><span class="menu-text"> 内容维护</span><b class="arrow icon-angle-down"></b></a>
<ul class="submenu">
<li><a href="<%=Inc_AddRead%>"><i class="icon-double-angle-right"></i> 发表内容</a></li>
<li><a href="<%=Inc_ReadList%>"><i class="icon-double-angle-right"></i> 内容列表</a></li>
<li>
</ul>
</li>
<li <%If Inc_Id = 2 Then echo"class=""active""" %>>
<a href="" class="dropdown-toggle"><i class="icon-list"></i><span class="menu-text"> 栏目管理 </span><b class="arrow icon-angle-down"></b></a>
<ul class="submenu">
<li><a href="<%=Inc_AddColumn%>"><i class="icon-double-angle-right"></i> 新增栏目</a></li>
<li><a href="<%=Inc_ColumnList%>"><i class="icon-double-angle-right"></i> 栏目列表</a></li>
</ul>
</li>
<li <%If Inc_Id = 3 Then echo"class=""active""" %>>
<a href="" class="dropdown-toggle"><i class="icon-list-alt"></i><span class="menu-text"> 用户管理 </span><b class="arrow icon-angle-down"></b></a>
<ul class="submenu">
<li><a href="<%=Inc_AddUser%>"><i class="icon-double-angle-right"></i> 新增用户</a></li>
<li><a href="<%=Inc_UserList%>"><i class="icon-double-angle-right"></i> 用户列表</a></li>
</ul>
</li>
<li <%If Inc_Id = 4 Then echo"class=""active""" %>>
<a href="" class="dropdown-toggle"><i class="icon-tag"></i><span class="menu-text"> 标签管理 </span><b class="arrow icon-angle-down"></b></a>
<ul class="submenu">
<li><a href="<%=Inc_AddTags%>"><i class="icon-double-angle-right"></i> 新增标签</a></li>
<li><a href="<%=Inc_TagsList%>"><i class="icon-double-angle-right"></i> 标签列表</a></li>
</ul>
</li>
<li <%If Inc_Id = 5 Then echo"class=""active""" %>>
<a href="" class="dropdown-toggle"><i class="icon-calendar" ></i><span class="menu-text"> 扩展功能 </span><b class="arrow icon-angle-down"></b></a>
<ul class="submenu">
<li><a href="<%=Inc_Dela%>"><i class="icon-double-angle-right"></i> 清空缓存</a></li>
<li><a href="<%=Inc_Data%>"><i class="icon-double-angle-right"></i> 数据管理</a></li>
<li><a href="<%=Inc_Temp%>"><i class="icon-double-angle-right"></i> 模板管理</a></li>
<li><a href="<%=Inc_Safe%>"><i class="icon-double-angle-right"></i> 安全防护</a></li>
<li><a href="<%=Inc_TagsDesc%>"><i class="icon-double-angle-right"></i> 标签大全</a></li>
<!--<li><a href="#"><i class="icon-double-angle-right"></i> 功能列表</a></li>-->
</ul>
</li>	
<li <%If Inc_Id = 6 Then echo"class=""active""" %>>
<a href="" class="dropdown-toggle"><i class="icon-picture" ></i><span class="menu-text"> 广告管理 </span><b class="arrow icon-angle-down"></b></a>
<ul class="submenu">
<li><a href="<%=Inc_AddAd%>"><i class="icon-double-angle-right"></i> 新增广告</a></li>
<li><a href="<%=Inc_AdList%>"><i class="icon-double-angle-right"></i> 广告列表</a></li>
</ul>
</li>
<li <%If Inc_Id = 7 Then echo"class=""active""" %>>
<a href="" class="dropdown-toggle"><i class="icon-text-width" ></i><span class="menu-text"> 友链管理 </span><b class="arrow icon-angle-down"></b></a>
<ul class="submenu">
<li><a href="<%=Inc_AddLink%>"><i class="icon-double-angle-right"></i> 新增友链</a></li>
<li><a href="<%=Inc_LinkList%>"><i class="icon-double-angle-right"></i> 友链列表</a></li></ul>
</li>		
<li <%If Inc_Id = 8 Then echo"class=""active""" %>>
<a href="<%=Inc_CommentList%>" class="dropdown-toggle"><i class="icon-file-alt" ></i><span class="menu-text"> 互动管理 </span><b class="arrow icon-angle-down"></b></a>
<ul class="submenu">
<li><a href="<%=Inc_CommentList%>?plfl=0&"><i class="icon-double-angle-right"></i> 留言列表</a></li>
<li><a href="<%=Inc_CommentList%>?plfl=1&"><i class="icon-double-angle-right"></i> 评论列表</a></li>
</ul>
</li>					
<li <%If Inc_Id = 9 Then echo"class=""active""" %>>
<a href="" class="dropdown-toggle"><i class="icon-dashboard" ></i><span class="menu-text"> 系统设置 </span><b class="arrow icon-angle-down"></b></a>
<ul class="submenu">
<li><a href="<%=Inc_BasicSettings%>"><i class="icon-double-angle-right"></i> 基本设置</a></li>
<li><a href="<%=Inc_CoreSettings%>"><i class="icon-double-angle-right"></i> 核心参数</a></li>
<li><a href="<%=Inc_PictureSettings%>" class="dropdown-toggle"><i class="icon-double-angle-right"></i> 图片水印</a></li>
<li><a href="<%=Inc_MailSettings%>" class="dropdown-toggle"><i class="icon-double-angle-right"></i> 互动设置</a></li>
<!--<li><a href="<%=Inc_TemplateSettings%>"><i class="icon-double-angle-right"></i> 模板设置</a></li>-->
<li><a href="<%=Inc_SeoSettings%>"><i class="icon-double-angle-right"></i> SEO设置</a></li>
</ul>
</li>
<div class="sidebar-collapse" id="sidebar-collapse">
<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
</div>
<script type="text/javascript">try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}</script>
</ul>
</div>