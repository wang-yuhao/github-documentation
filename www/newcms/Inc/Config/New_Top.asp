<div class="navbar navbar-default" id="navbar">
<script type="text/javascript">try{ace.settings.check('navbar' , 'fixed')}catch(e){}</script>
<div id="navbar-container">
<div class="navbar-header pull-left">
<a href="<%=Inc_Index%>" class="navbar-brand"><small><i class="icon-leaf"></i> <%=Inc_Title%></small></a>
</div>
<div class="navbar-header pull-right" role="navigation">
<ul class="nav ace-nav">
<li class="grey" style="cursor:pointer">
<a class="dropdown-toggle" onclick='Sz.style.display="block"' ><i class="icon-cog bigger-150"></i></a>
<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close" id="Sz">
<li class="dropdown-header"><i class="icon-ok"></i>后台风格设置</li>
<div style="padding: 0px 14px; border-bottom: 1px dashed #A9A9A9;">
<form method="post" action="">
<div class="pull-left">   
<select id="skin-colorpicker" class="hide" name="style">
<option data-skin="default" value="#438EB9">#438EB9</option>
<option data-skin="skin-1" value="#222A2D">#222A2D</option>
<option data-skin="skin-2" value="#C6487E">#C6487E</option>
<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
</select>
</div>
<span style="padding: 0px 10px;"> 背景颜色</span>
<input style="line-height: 50%;width: auto;height: 20px;border-color: #CFC1C1;border-width: 1px;border-style: solid;" type="submit" name="button" id="button" value=" GO " />
</form>
</div>
<div style="padding: 0px 14px;border-bottom: 1px dashed #A9A9A9;">
<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
<label class="lbl" for="ace-settings-navbar"><span style="padding: 0px 10px;">固定导航</span></label>
</div>
<div style="padding: 0px 14px;border-bottom: 1px dashed #A9A9A9;">
<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
<label class="lbl" for="ace-settings-sidebar"><span style="padding: 0px 10px;">固定栏目</span></label>
</div>
<div style="padding: 0px 14px;border-bottom: 1px dashed #A9A9A9;">
<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
<label class="lbl" for="ace-settings-breadcrumbs"><span style="padding: 0px 10px;">固定面包屑</span></label>
</div>
<div style="padding: 0px 14px;border-bottom: 1px dashed #A9A9A9;">
<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
<label class="lbl" for="ace-settings-rtl"><span style="padding: 0px 10px;">左到右审阅</span></label>
</div>
<div style="padding: 0px 14px;border-bottom: 1px dashed #A9A9A9;">
<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
<label class="lbl" for="ace-settings-add-container"><span style="padding: 0px 10px;">窄版风格</span></label>
</div>
<div style="text-align:center;margin:0 auto;">
<span><a onclick='Sz.style.display="none"'>退出设置</a> <i class="icon-arrow-right"></i></span>
</div>
</ul>
</li>
<li class="light-blue">
<a data-toggle="dropdown" class="dropdown-toggle">
<img class="nav-user-photo" src="<%=touxiang%>" alt="Jason's Photo" />
<span class="user-info"><small>欢迎您，</small><%=nickname%></span><i class="icon-caret-down"></i>
</a>
<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
<li><a href="<%=Inc_CoreSettings%>"><i class="icon-cog"></i>核心参数</a></li>
<li><a href="<%=Inc_UserList%>"><i class="icon-user"></i>用户管理</a></li>
<li><a href="<%=New_Root%>/" target="_blank"><i class="icon-home home-icon"></i>网站首页</a></li>	
<li class="divider"></li>
<li><a href="<%=Inc_TuiChu%>"><i class="icon-off"></i>退出登录</a></li>
</ul>
</li>
</ul>
</div>
</div>
</div>