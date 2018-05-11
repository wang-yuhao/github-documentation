/*! layer弹层组件拓展类 */
;!function(){layer.use("skin/layer.ext.css",function(){layer.layui_layer_extendlayerextjs=!0});var a=layer.cache||{},b=function(b){return a.skin?" "+a.skin+" "+a.skin+"-"+b:""};layer.prompt=function(a,c){a=a||{},"function"==typeof a&&(c=a);var d,e=2==a.formType?'<textarea class="layui-layer-input">'+(a.value||"")+"</textarea>":function(){return'<input type="'+(1==a.formType?"password":"text")+'" class="layui-layer-input" value="'+(a.value||"")+'">'}();return layer.open($.extend({btn:["&#x786E;&#x5B9A;","&#x53D6;&#x6D88;"],content:e,skin:"layui-layer-prompt"+b("prompt"),success:function(a){d=a.find(".layui-layer-input"),d.focus()},yes:function(b){var e=d.val();""===e?d.focus():e.length>(a.maxlength||500)?layer.tips("&#x6700;&#x591A;&#x8F93;&#x5165;"+(a.maxlength||500)+"&#x4E2A;&#x5B57;&#x6570;",d,{tips:1}):c&&c(e,b,d)}},a))},layer.tab=function(a){a=a||{};var c=a.tab||{};return layer.open($.extend({type:1,skin:"layui-layer-tab"+b("tab"),title:function(){var a=c.length,b=1,d="";if(a>0)for(d='<span class="layui-layer-tabnow">'+c[0].title+"</span>";a>b;b++)d+="<span>"+c[b].title+"</span>";return d}(),content:'<ul class="layui-layer-tabmain">'+function(){var a=c.length,b=1,d="";if(a>0)for(d='<li class="layui-layer-tabli xubox_tab_layer">'+(c[0].content||"no content")+"</li>";a>b;b++)d+='<li class="layui-layer-tabli">'+(c[b].content||"no  content")+"</li>";return d}()+"</ul>",success:function(b){var c=b.find(".layui-layer-title").children(),d=b.find(".layui-layer-tabmain").children();c.on("mousedown",function(b){b.stopPropagation?b.stopPropagation():b.cancelBubble=!0;var c=$(this),e=c.index();c.addClass("layui-layer-tabnow").siblings().removeClass("layui-layer-tabnow"),d.eq(e).show().siblings().hide(),"function"==typeof a.change&&a.change(e)})}},a))},layer.photos=function(a,c,d){function e(a,b,c){var d=new Image;d.onload=function(){d.onload=null,b(d)},d.onerror=function(a){d.onerror=null,c(a)},d.src=a}var f={};if(a=a||{},a.photos){var g=a.photos.constructor===Object,h=g?a.photos:{},i=h.data||[],j=h.start||0;if(f.imgIndex=j+1,g){if(0===i.length)return layer.msg("&#x6CA1;&#x6709;&#x56FE;&#x7247;")}else{var k=$(a.photos),l=function(){return i=[],k.find(a.img||"img").each(function(a){var b=$(this);i.push({alt:b.attr("alt"),pid:b.attr("layer-pid"),src:b.attr("layer-src")||b.attr("src"),thumb:b.attr("src")})}),arguments.callee}();if(0===i.length)return;if(c||k.on("click",a.img||"img",function(){var b=$(this),c=b.index();l(),layer.photos($.extend(a,{photos:{start:c,data:i,tab:a.tab},full:a.full}),!0)}),!c)return}f.imgprev=function(a){f.imgIndex--,f.imgIndex<1&&(f.imgIndex=i.length),f.tabimg(a)},f.imgnext=function(a,b){f.imgIndex++,f.imgIndex>i.length&&(f.imgIndex=1,b)||f.tabimg(a)},f.keyup=function(a){if(!f.end){var b=a.keyCode;a.preventDefault(),37===b?f.imgprev(!0):39===b?f.imgnext(!0):27===b&&layer.close(f.index)}},f.tabimg=functiner .swiper-notification {
  position: absolute;
  left: 0;
  top: 0;
  pointer-events: none;
  opacity: 0;
  z-index: -1000;
}
/* IE10 Windows Phone 8 Fixes */
.swiper-wp8-horizontal {
  -ms-touch-action: pan-y;
  touch-action: pan-y;
}
.swiper-wp8-vertical {
  -ms-touch-action: pan-x;
  touch-action: pan-x;
}
/* Arrows */
.swiper-button-prev,
.swiper-button-next {
  position: absolute;
  top: 50%;
  width: 27px;
  height: 44px;
  margin-top: -22px;
  z-index: 10;
  cursor: pointer;
  -moz-background-size: 27px 44px;
  -webkit-background-size: 27px 44px;
  background-size: 27px 44px;
  background-position: center;
  background-repeat: no-repeat;
  
}


.swiper-button-prev.swiper-button-disabled,
.swiper-button-next.swiper-button-disabled {
  opacity: 0.35;
  cursor: auto;
  pointer-events: none;
}
.swiper-button-prev,
.swiper-container-rtl .swiper-button-next {
  background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23007aff'%2F%3E%3C%2Fsvg%3E");
  left: -30px;
  right: auto;
  transition:all 0.5s;-webkit-transition:all 0.5s;
}
.swiper-container:hover .swiper-button-prev{left:10px;transition:all 0.5s;-webkit-transition:all 0.5s;}

.swiper-button-prev.swiper-button-black,
.swiper-container-rtl .swiper-button-next.swiper-button-black {
  background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23000000'%2F%3E%3C%2Fsvg%3E");
}
.swiper-button-prev.swiper-button-white,
.swiper-container-rtl .swiper-button-next.swiper-button-white {
  background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23ffffff'%2F%3E%3C%2Fsvg%3E");
}
.swiper-button-next,
.swiper-container-rtl .swiper-button-prev {
  background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23007aff'%2F%3E%3C%2Fsvg%3E");
  right: -30px;
  left: auto;
  z-index:10;
}
.swiper-container:hover .swiper-button-next{right:10px;transition:all 0.5s;-webkit-transition:all 0.5s;}

.swiper-button-next.swiper-button-black,
.swiper-container-rtl .swiper-button-prev.swiper-button-black {
  background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44