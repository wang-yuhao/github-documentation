<!--#include file="Inc/Class.asp" -->
<%
If Fun_GetId("type","get")="edit" Then
If len(Fun_GetId("Pic_color","post"))<>7 OR Instr(Fun_GetId("Pic_color","post"),"#")=0 Then InfoStr Inc_200,Inc_title,"水印颜色格式错误！","back"
If Pic_Link="" AND Fun_GetId("Pic_Type","post")=1 Then InfoStr Inc_200,Inc_title,"请上传水印图片！","back"
a=Fun_File(New_Root&"/inc/New_Config.asp")
a=reInfo(a,"Pic_ON=","'",Fun_GetId("Pic_ON","post"))
a=reInfo(a,"Pic_Make=","'",Fun_GetId("Pic_Make","post"))
a=reInfo(a,"Pic_Height=","'",Fun_GetId("Pic_Height","post"))
a=reInfo(a,"Pic_Width=","'",Fun_GetId("Pic_Width","post"))
a=reInfo(a,"Pin_Sy=","'",Fun_GetId("Pin_Sy","post"))
a=reInfo(a,"Pic_SltSy=","'",Fun_GetId("Pic_SltSy","post"))
a=reInfo(a,"Pic_Type=","'",Fun_GetId("Pic_Type","post"))
a=reInfo(a,"Pic_Link=","'",Fun_GetId("Pic_Link","post"))
a=reInfo(a,"Pic_Num=","'",Fun_GetId("Pic_Num","post"))
a=reInfo(a,"Pic_Word=","'",Fun_GetId("Pic_Word","post"))
a=reInfo(a,"Pic_Info=","'",Fun_GetId("Pic_Info","post"))
a=reInfo(a,"Pic_color=","'",Fun_GetId("Pic_color","post"))
a=reInfo(a,"Pic_Size=","'",Fun_GetId("Pic_Size","post"))
a=reInfo(a,"Pic_X=","'",Fun_GetId("Pic_X","post"))
a=reInfo(a,"Pic_Y=","'",Fun_GetId("Pic_Y","post"))
a=reInfo(a,"Pic_Ok=","'",Fun_GetId("Pic_Ok","post"))
a=reInfo(a,"Pic_Gif=","'",Fun_GetId("Pic_Gif","post"))
a=reInfo(a,"Pic_Png=","'",Fun_GetId("Pic_Png","post"))
a=reInfo(a,"Pic_Down=","'",Fun_GetId("Pic_Down","post"))
a=reInfo(a,"Pic_Imgtype=","'",Fun_GetId("Pic_Imgtype","post"))
Fun_FeText New_Root&"/inc/New_Config.asp",a
InfoStr Inc_200,Inc_title,"图片信息修改成功！",Inc_PictureSettings
End If
%><!DOCTYPE html>
<html>
<head>	
<title>图片水印<%=SEO_conn&Inc_CMD%></title>
<!--#include file="Inc/Config/New_Head.asp" -->
<link rel="stylesheet" href="edit/themes/default/default.css" />
<script charset="utf-8" src="edit/kindeditor-min.js"></script>
<script>
			KindEditor.ready(function(K) {
				var colorpicker;
				K('#colorpicker').bind('click', function(e) {
					e.stopPropagation();
					if (colorpicker) {
						colorpicker.remove();
						colorpicker = null;
						return;
					}
					var colorpickerPos = K('#colorpicker').pos();
					colorpicker = K.colorpicker({
						x : colorpickerPos.x,
						y : colorpickerPos.y + K('#colorpicker').height(),
						z : 19811214,
						selectedColor : 'default',
						click : function(color) {
							K('#color').val(color);
							colorpicker.remove();
							colorpicker = null;
						}
					});
				});
				K(document).click(function() {
					if (colorpicker) {
						colorpicker.remove();
						colorpicker = null;
					}
				});
			});
			KindEditor.ready(function(K) {
				var uploadbutton = K.uploadbutton({
					button : K('#uploadButton')[0],
					fieldName : 'imgFile',
					url : 'edit/asp/upload.asp?type=other',
					afterUpload : function(data) {
						if (data.error === 0) {
							var url = K.formatUrl(data.url, 'absolute');
							K('#Pic_Link').val(url);
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
<li>图片水印</li>
</ul>
</div>
<div class="page-content">
<div class="row">
<div class="col-xs-12">
<div class="table-responsive">
<form method="post" action="?type=edit">
<table id="sample-table-2" class="table table-striped table-bordered table-hover">
<thead>
</thead>
<tbody>
<td colspan="2"><strong>基本设置：</strong></td>
<tr>
<td width="15%">组件状态：</td>
<td><%If FunOK("jpeg")="√" Then echo "<font color='#69aa46'>支持jpeg组件</font>" Else echo "<font color='red'>空间不支持jpeg组件，请勿开启功能，否则会出现错误！</font>"%></td>
</tr>
<tr>
<td width="15%">缩略图功能开关：</td>
<td>
<input name="Pic_ON" type="radio" value="0" <%If Pic_ON=0 Then echo "checked=""checked""" End IF%>> 开启 
<input name="Pic_ON" type="radio" value="1" <%If Pic_ON=1 Then echo "checked=""checked""" End IF%>> 关闭
</td>
</tr>
<tr>
<td width="15%">缩略图功能模式：</td>
<td>
<input name="Pic_Make" type="radio" value="0" <%If Pic_Make=0 Then echo "checked=""checked""" End IF%>> 压缩 
<input name="Pic_Make" type="radio" value="1" <%If Pic_Make=1 Then echo "checked=""checked""" End IF%>> 裁剪
</td>
</tr>
<tr>
<td width="15%">缩略图添加水印：</td>
<td>
<input name="Pic_SltSy" type="radio" value="0" <%If Pic_SltSy=0 Then echo "checked=""checked""" End IF%>> 开启 
<input name="Pic_SltSy" type="radio" value="1" <%If Pic_SltSy=1 Then echo "checked=""checked""" End IF%>> 关闭
</td>
</tr>
<tr>
<td>缩略图图片尺寸：</td>
<td>
<input name="Pic_Height" type="text" value="<%=Pic_Height%>" size="15">
<input name="Pic_Width" type="text" value="<%=Pic_Width%>" size="15">
←高度→宽度
</td>
</tr>
<tr>
<td width="15%">自动存远程图片：</td>
<td>
<input name="Pic_Down" type="radio" value="0" <%If Pic_Down=0 Then echo "checked=""checked""" End IF%>> 开启 
<input name="Pic_Down" type="radio" value="1" <%If Pic_Down=1 Then echo "checked=""checked""" End IF%>> 关闭
</td>
</tr>
<td colspan="2"><strong>图片水印：</strong></td>
<tr>
<td>图片添加水印：</td>
<td>
<input name="Pin_Sy" type="radio" value="0" <%If Pin_Sy=0 Then echo "checked=""checked""" End IF%>/> 开启 
<input name="Pin_Sy" type="radio" value="1" <%If Pin_Sy=1 Then echo "checked=""checked""" End IF%>/> 关闭</td>
</tr>
<tr>
<td>图片水印类型：</td>
<td>
<input name="Pic_Type" type="radio" value="0" <%If Pic_Type=0 Then echo "checked=""checked""" End if%>> 文字 
<input name="Pic_Type" type="radio" value="1" <%If Pic_Type=1 Then echo "checked=""checked""" End if%>> 图片
</td>
</tr>
<tr>
<td>水印图片地址：</td>
<td>
<input name="Pic_Link" id="Pic_Link" class="ke-input-text" type="text" value="<%=Pic_Link%>" /> <input type="button" id="uploadButton" value="上传" />
</td>
</td>
</tr>
<tr>
<td>图片水印透明：</td>
<td>
<label for="Pic_Num" style="width:100%">
<select name="Pic_Num" size="" style="width:100%">
<option value="1"<%If Pic_Num=1 Then echo("    selected=""selected""")%> > 不透明</option>
<option value="0.9"<%If Pic_Num=.9 Then echo(" selected=""selected""")%> > 90%</option>
<option value="0.8"<%If Pic_Num=.8 Then echo(" selected=""selected""")%> > 80%</option>
<option value="0.7"<%If Pic_Num=.7 Then echo(" selected=""selected""")%> > 70%</option>
<option value="0.6"<%If Pic_Num=.6 Then echo(" selected=""selected""")%> > 60%</option>
<option value="0.5"<%If Pic_Num=.5 Then echo(" selected=""selected""")%> > 50%</option>
<option value="0.4"<%If Pic_Num=.4 Then echo(" selected=""selected""")%> > 40%</option>
<option value="0.3"<%If Pic_Num=.3 Then echo(" selected=""selected""")%> > 30%</option>
<option value="0.2"<%If Pic_Num=.2 Then echo(" selected=""selected""")%> > 20%</option>
<option value="0.1"<%If Pic_Num=.1 Then echo(" selected=""selected""")%> > 10%</option>
</select>
</label>
</td>
</tr>
<tr>
<td>水印文字字体：</td>
<td><input name="Pic_Word" type="text" value="<%=Pic_Word%>" size="15">
<input name="Pic_Info" type="text" value="<%=Pic_Info%>" size="15">
←水印字体→水印文字</td>
</tr>
<tr >
<td>字体颜色大小：</td>
<td>
<input name="Pic_color" type="text" id="color" value="<%=Replace(Pic_color,"&H","#")%>" size="15">
<input name="Pic_Size" type="text" value="<%=Pic_Size%>" size="15"> 
<input type="button" id="colorpicker" value="打开取色器" /> 
←字体颜色→字体大小
</td>
</tr>
<tr>
<td>图片水印位置：</td>
<td>
<label for="Pic_Imgtype" style="width:100%">
<select name="Pic_Imgtype" size="" style="width:100%">
<option value="1"<%If Pic_Imgtype=1 Then echo(" selected=""selected""")%> > 顶部居左</option>
<option value="2"<%If Pic_Imgtype=2 Then echo(" selected=""selected""")%> > 顶部居右</option>
<option value="3"<%If Pic_Imgtype=3 Then echo(" selected=""selected""")%> > 底部居左</option>
<option value="4"<%If Pic_Imgtype=4 Then echo(" selected=""selected""")%> > 底部居右</option>
</select>
</label>
</td>
</tr>
<tr>
<td>水印坐标偏移：</td>
<td><input name="Pic_X" type="text" value="<%=Pic_X%>" size="15">
<input name="Pic_Y" type="text" value="<%=Pic_Y%>" size="15">
←X坐标→Y坐标
</td>
</tr>
<td colspan="2"><strong>图片质量：</strong></td>
<tr >
<td>图片生成质量：</td>
<td>
<label for="Pic_Ok" style="width:100%">
<select name="Pic_Ok" size="" style="width:100%">
<option value="100"<%If Pic_Ok=100 Then echo("  selected=""selected""")%> > 100%</option>
<option value="95"  <%If Pic_Ok=95 Then echo("  selected=""selected""")%> >  95%</option>
<option value="90"  <%If Pic_Ok=90 Then echo("  selected=""selected""")%> >  90%</option>
<option value="85"  <%If Pic_Ok=85 Then echo("  selected=""selected""")%> >  85%</option>
<option value="80"  <%If Pic_Ok=80 Then echo("  selected=""selected""")%> >  80%</option>
<option value="75"  <%If Pic_Ok=75 Then echo("  selected=""selected""")%> >  75%</option>
<option value="70"  <%If Pic_Ok=70 Then echo("  selected=""selected""")%> >  70%</option>
<option value="65"  <%If Pic_Ok=65 Then echo("  selected=""selected""")%> >  65%</option>
<option value="60"  <%If Pic_Ok=60 Then echo("  selected=""selected""")%> >  60%</option>
<option value="55"  <%If Pic_Ok=55 Then echo("  selected=""selected""")%> >  55%</option>
<option value="50"  <%If Pic_Ok=50 Then echo("  selected=""selected""")%> >  50%</option>
</select>
</label>
</td>
</tr>
<tr>
<td>GIF 保留原图：</td>
<td>
<input name="Pic_Gif" type="radio" value="0" <%If Pic_Gif=0 Then echo "checked=""checked""" End IF%>/> 开启 
<input name="Pic_Gif" type="radio" value="1" <%If Pic_Gif=1 Then echo "checked=""checked""" End IF%>/> 关闭</td>
</tr>
<tr>
<td>PNG 保留原图：</td>
<td>
<input name="Pic_PNG" type="radio" value="0" <%If Pic_PNG=0 Then echo "checked=""checked""" End IF%>/> 开启 
<input name="Pic_PNG" type="radio" value="1" <%If Pic_PNG=1 Then echo "checked=""checked""" End IF%>/> 关闭
[PNG图片在处理过程中会失去透明效果，建议开启保留原图]
</td>
</tr>
<tr>
<td></td>
<td>
<input type="submit" value="提交" /> 
<input type="reset" value="重置" />
</td>
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
</body>
</html>