# 一、项目基本介绍
  这是一个学校在线学习平台。大部分页面和样式都是直接使用原官网的官网，部分的页面是自定义的，该项目主要是注重后台管理和前段逻辑的实现。原官网链接为
[优课联盟](http://www.uooc.net.cn/league/union)
# 二、环境依赖
  python3.6
  mysql
# 三、文件目录
uooc
│  manage.py	#启动程序
│  uooc.sql    #原数据库数据
|  requirements.txt  #相关依赖
├─apps
│  │  __init__.py
│  │  
│  ├─schoolapp 
│  │  │  adminx.py   #xadmin后台管理相关配置
│  │  │  apps.py
│  │  │  models.py   #学校app相关model
│  │  │  tests.py
│  │  │  urls.py
│  │  │  views.py
│  │  │  __init__.py
│  │  │  
│  │  ├─migrations   
│  │  │          
│  │  ├─templatetags
│  │          
│  ├─userapp
│  │  │  admin.py
│  │  │  adminx.py
│  │  │  apps.py
│  │  │  forms.py
│  │  │  models.py
│  │  │  tests.py
│  │  │  urls.py
│  │  │  views.py
│  │  │  __init__.py
│  │  │  
│  │  
│  ├─utlis
│  │  │__vcode.py  #生成验证码
│  │          
│          
├─extra_apps  #第三方库
│  │  __init__.py
│  │  
│  └─xadmin  #xadmin是一个封装了admin的更方便，功能更加强大的Django后台管理库
│              
├─media  # 存放用户相关文件，主要是图片
│  │  
│  ├─avatars  
│  ├─background 
│  ├─banner   
│  │              
│  ├─course
│  │ 
│  ├─school
│  │              
│  │          
│  └─tch_avatar
│                  
├─static
│  │  __init__.py
│  │  
│  ├─css
│  │      about-fe1f14e04c.css
│  │      animate-8b03ef312e.css
│  │      bootstrap.min.css
		....
│  │      
│  ├─font
│  │      kumo.ttf  #验证码相关字体
│  │      
│  ├─img
│  │      1270899c-aa66-4d80-8b8e-c20c5e49b999_thumb.png
│  │      170804073254_cf88a5_ae6d6118-18fb-48f2-bccf-d31789a3ba1d_thumb.png
│  │      170804073500_86c444_071b9c9b-3291-49af-824f-1f42abd4975c_thumb.png
│  │      ....
│  └─js
│          114.js
│          angular-ui-router.js
│          angular.js
│          app-4a4d239128.js
│          .....
├─templates
│  │  404.html
│  │  about.html
│  │  course.html
│  │  course_list.html
│  │  header.html
│  │  home.html
│  │  index.html
│  │  login.html
│  │  org_list.html
│  │  register.html
│  │  student_msg.html
│  │  test.html
│          
├─uooc
│  │  settings.py
│  │  urls.py
│  │  wsgi.py
│  │  __init__.py
│  │  
│  └─__pycache__
│          settings.cpython-36.pyc
│          urls.cpython-36.pyc
│          wsgi.cpython-36.pyc
│          __init__.cpython-36.pyc
│          
└─utils
        __init__.py
# 四、第三方包相关介绍
1. 生成验证码相关包：pillow,io
   pillow主要是用于生成验证码图片，io是python内置的库，在该项目的应用主要是，将生成图片，保存在内存中，返回给前端。
2.  django-pure-pagination
    实现分页相关功能
3.  DjangoUeditor
    这是一个富文本编辑器，用于教师上传课程编辑课程详情页。
    
# 五、一些坑
1. 主要是DjangoUeditor使用的时候，回报错，一直导入错误，不存在某些模块。原因就是因为官方提供的包依旧还不能兼容python3，解决方法如下：
  在GitHub上搜索DjangoUeditor3，然后clone下来，这里面还有个坑，安装方法，不建议使用`python setup.py install` 因为这样依旧会使用官网的包，安装方式是直接找到相关环境的包存放目录即site-packages，直接将clon下来的包放进去就可以。
2. 建立数据库时，要指明编码是utf8不然可能会发现一些图片加载不了的情况，因为某些图片路径包含中文
