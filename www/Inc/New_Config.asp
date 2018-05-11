<%
Rem /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Rem 程序名称：New Cms
Rem 程序作者：新成
Rem 作者博客：http://zhanxincheng.com/
Rem //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Dim StrTime:StrTime = timer()
'|核心类
Const New_SqlType=0'|0=Access 1=Mssql
Const New_NewAcc="New_"'|
Const New_Access="/data/#New_Cms.mdb"'|asp数据库路径
Const New_Server="localhost"'|sqlserver数据库地址
Const New_SQLName="sqlserver数据库名称"'|sqlserver数据库名称
Const New_SQLUser="sqlserver数据库账号"'|sqlserver数据库账号
Const New_SQLpwd="sqlserver数据库密码"'|sqlserver数据库密码
Const New_Root=""'|网站根目录请以/打头，末尾不需要加/
Const New_DataOver="Err：数据库连接失败！"'|
Const New_upLoad="/file"'|上传文件目录
Const New_Upsize=5'|图片上传大小
Const New_CharSet="UTF-8"'|
Const New_Cache=0'|缓存为0关闭 ,单位（分钟）
Const New_FeCache=0'|
Const New_CacheFe="/cache"	'|默认在New_upLoad指定目录下
Const New_Suffix="new"'|
Const New_nullimg="/file/img/nopic.png"
Const New_On=2'|网站开关 0开启，1关闭，2尚未安装
Const New_Info="Err：本网站因程序升级关闭中！"'|网站关闭说明
Const New_admin="/newcms"'|后台路径
Const New_Tempfile="/templet"'|默认存放路径
Const New_Temp="/xiaoxiao"'|模板目录
Const New_Tempf="/html"'|模板目录
Const New_404="Err：该页面不存在！"'|404页面
Const New_Close="Err：非法请求！"'|拦截页面
Const New_Gzip=1'|页面压缩
Const New_color="#FF0000"'|通知处理类
Const New_True=1'|
Const New_khd="windows,Windows<br>linux,Linux<br>android,Android<br>ipad,iPad<br>windows nt 5.0,Win 2000<br>windows nt 5.1,Win XP<br>windows nt 5.2,Win 2003<br>windows nt 6.0,Win Vista<br>windows nt 6.1,Win 7<br>windows nt 6.2,Win 8<br>windows nt 6.3,Win 8.1<br>windows nt 10.0,Win 10<br>windows nt 6.4,Win 10<br>huawei,华为<br>coolpad,酷派<br>coolpad sk1-01,ivvi<br>iphone,iPhone<br>xiaomi,小米<br>m3 note,魅蓝<br>spider,蜘蛛<br>bot,蜘蛛<br>crawler,蜘蛛<br>baiduspider,百度蜘蛛<br>yunguance,百度云观测<br>googlebot,谷歌蜘蛛<br>yisouspider,神马蜘蛛<br>yahoo! slurp,雅虎蜘蛛<br>sogou web spider,搜狗蜘蛛<br>bingbot,必应蜘蛛<br>360spider,360蜘蛛<br>msnbot,必应蜘蛛"'|

Const Str_Message=0'|留言开关：0开启，1关闭
Const Str_Comment=0'|评论开关：0开启，1关闭
Const Str_StopMessage=0'|留言审核开关：0开启，1关闭
Const Str_StopComment=0'|评论审核开关：0开启，1关闭
Const Str_TMessage=1'|留言通知站长：0开启，1关闭
Const Str_TComment=1'|评论通知站长：0开启，1关闭
Const Str_TFMessage=1'|留言通知访客：0开启，1关闭
Const Str_TFComment=1'|评论通知访客：0开启，1关闭
Const Str_Name="New Cms"'|发件人名称
Const Str_Mail="发件人邮箱"'|发件人邮箱
Const Str_User="登陆名称"'|登陆名称
Const Str_Pass="登陆秘密"'|登陆秘密
Const Str_SMTP="邮件服务器地址"'|邮件服务器地址
Const Str_Read="指定回信地址"'|指定回信地址
Const Str_Title="New Cms上有了新的[post:type]"'|通知站长使用的邮件标题
Const Str_FTitle="您在New Cms上的[post:type]有了新的回复"'|通知访客使用的邮件标题
Const Str_Stop=1'|参数过滤	0开启，1关闭
Const Str_Info="admin<br>sql"'|
Const Str_Txiang=0'|


'|图片处理类
Const Pic_ON=1'|开启，1关闭
Const Pic_Height=155'|缩略图高度
Const Pic_Width=200'|缩略图宽度
Const Pic_Make=1'|0为压缩模式，1为裁剪模式
Const Pic_SltSy=1'|开启，1关闭
Const Pic_Down=1'|开启，1关闭
Const Pin_Sy=1'|开启，1关闭
Const Pic_Type=0'|0文字，1图片
Const Pic_Link=""'|图片地址
Const Pic_Num=1'|1不透明，0.1，0.2，0.3 不同透明度
Const Pic_Word="黑体"'|水印字体
Const Pic_Info="New Cms"'|水印文字
Const Pic_color="#9933E5"'|水印颜色
Const Pic_Size=16'|水印字体大小
Const Pic_X=0'|水印X坐标
Const Pic_Y=0'|水印Y坐标
Const Pic_Ok=100'|图片质量，100保留原图，99，98，97，96等压缩图片等级，数字越小图片体积越小，同时图片质量也越次。
Const Pic_Gif=0'|开启，1关闭 GIF保留原图
Const Pic_Png=1'|开启，1关闭 
Const Pic_Imgtype=4'| 位置


'|SEO优化类
Const SEO_ReWrite=1'|伪静态开关：0开启 1关闭
Const SEO_DATEId=0'|0id 1日期id
Const SEO_ReP="?"		'|伪静态判断条件，谨慎修改
Const SEO_301=1'|集中网站权重，0开启1关闭
Const SEO_http="http://"'|集中网站权重
Const SEO_Url=""'|集中网站权重
Const SEO_ReNum=1'|内容替换开关 0开启1关闭
Const SEO_ReInfo=""'|替换内容
Const SEO_Bak=".html"'|文件后错名
Const SEO_Size=15'|	输出列表数量
Const SEO_Conn=" - "'|连接符
Const SEO_Nav=" | "'|面包屑导航连接符
Const SEO_Post=0'|主动推送
Const SEO_desc=150'|智能描述
Const SEO_Site=""'|验证域名
Const SEO_token=""'|准入密钥
Const SEO_tags="/?tags=[type:id]&page=[type:page]&type=[type:class]"'|
Const SEO_date="/?date=[type:id]&page=[type:page]&type=[type:class]"'|
Const SEO_search="/?s=[type:id]&page=[type:page]&type=[type:class]"'|
Const SEO_author="/?author=[type:id]&page=[type:page]&type=[type:class]"'|
Const SEO_Wap=1'|
'Const SEO_wapurl="m.zhanxincheng.com"'|

'|安全防护类
Const Safe_Allq=1'|
Const Safe_Lailunum=1'|
Const Safe_Lailu=""'|
Const Safe_ipnum=1'|
Const Safe_ip=""'|
Const Safe_khdnum=1'|
Const Safe_khd=""'|
Const Safe_Allh=0'|
Const Safe_hLailunum=1'|
Const Safe_hLailu=""'|
Const Safe_hipnum=1'|
Const Safe_hip=""'|
Const Safe_hkhdnum=1'|
Const Safe_hkhd=""'|

Const Inc_vers="1.0.161011"'|
Const Inc_Title="New Cms"'|
Const Inc_CMD="New Cms V1.0.161011 公测版"'|
Const Inc_keys="NEWCMS201611005000000ZXC"'|
%>