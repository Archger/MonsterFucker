<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>手册 - Materialize - 助手</title>
    <!-- Favicons-->
    <!--<link rel="apple-touch-icon-precomposed" href="/images/favicon/apple-touch-icon-152x152.png">-->
    <!--<meta name="msapplication-TileColor" content="#FFFFFF">-->
    <!--<meta name="msapplication-TileImage" content="/images/favicon/mstile-144x144.png">-->
    <!--<link rel="icon" href="/images/favicon/favicon-32x32.png" sizes="32x32">-->
    <!--  Android 5 Chrome Color-->
    <!--<meta name="theme-color" content="#EE6E73">-->
    <!-- CSS-->
    <!--<link href="/css/prism.css" rel="stylesheet">-->
    <!--<link href="/css/ghpages-materialize.css" type="text/css" rel="stylesheet" media="screen,projection">-->
    <!-- materializecss-font.css -->
    <!--<link href="/css/materializecss-font.css" rel="stylesheet" type="text/css">-->
    <!-- 
    <link href="http://fonts.googleapis.com/css?family=Inconsolata" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     -->
     

    <!-- CORE CSS-->    
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection">

    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script>
      window.liveSettings = {
        api_key: "a0b49b34b93844c38eaee15690d86413",
        picker: "bottom-right",
        detectlang: true,
        dynamic: true,
        autocollect: true
      };
    </script>
    
  </head>
  <body>
    <header>
        
    <nav class="top-nav">
    <div class="container">
    <div class="nav-wrapper"><a class="page-title">助手</a></div>
    </div>
    </nav>        
      <div class="container"><a href="#" data-activates="nav-mobile" class="button-collapse top-nav waves-effect waves-light circle hide-on-large-only"><i class="material-icons">menu</i></a></div>
      <ul id="nav-mobile" class="side-nav fixed">
        <li class="logo"><a id="logo-container" href="index.html" class="brand-logo">
            <object id="front-page-logo" type="image/svg+xml" data="/res/materialize.svg">你的浏览器不支持SVG</object></a></li>
        <li class="search">
          <div class="search-wrapper card">
            <input id="search"><i class="material-icons">search</i>
            <div class="search-results"></div>
          </div>
        </li>
        <li class="bold "><a href="/about.html" class="waves-effect waves-teal">关于我们</a></li>
        <li class="bold "><a href="/getting-started.html" class="waves-effect waves-teal">开始学习</a></li>
        <li class="no-padding">
          <ul class="collapsible collapsible-accordion">
            <li class="bold active"><a class="collapsible-header active waves-effect waves-teal">CSS</a>
              <div class="collapsible-body">
                <ul>
                  <li class=''><a href="/color.html">颜色</a></li>
                  <li class=''><a href="/grid.html">网格</a></li>
                  <li class='active'><a href="/helpers.html">助手</a></li>
                  <li class=''><a href="/media-css.html">媒体</a></li>
                  <li class=''><a href="/sass.html">Sass</a></li>
                  <li class=''><a href="/shadow.html">阴影效果</a></li>
                  <li class=''><a href="/table.html">表格</a></li>
                  <li class=''><a href="/typography.html">字体样式</a></li>
                </ul>
              </div>
            </li>
            <li class="bold "><a class="collapsible-header   waves-effect waves-teal">组件</a>
              <div class="collapsible-body">
                <ul>
                  <li class=''><a href="/badges.html">徽章</a></li>
                  <li class=''><a href="/buttons.html">按钮</a></li>
                  <li class=''><a href="/breadcrumbs.html">路径导航</a></li>
                  <li class=''><a href="/cards.html">卡片</a></li>
                  <li class=''><a href="/chips.html">信息块</a></li>
                  <li class=''><a href="/collections.html">集合</a></li>
                  <li class=''><a href="/footer.html">页脚</a></li>
                  <li class=''><a href="/forms.html">表单</a></li>
                  <li class=''><a href="/icons.html">图标</a></li>
                  <li class=''><a href="/navbar.html">导航条</a></li>
                  <li class=''><a href="/pagination.html">分页组件</a></li>
                  <li class=''><a href="/preloader.html">预加载组件</a></li>
                </ul>
              </div>
            </li>
            <li class="bold "><a class="collapsible-header  waves-effect waves-teal">JavaScript</a>
              <div class="collapsible-body">
                <ul>
                  <li class=''><a href="/carousel.html">轮播组件</a></li>
                  <li class=''><a href="/collapsible.html">折叠</a></li>
                  <li class=''><a href="/dialogs.html">对话框</a></li>
                  <li class=''><a href="/dropdown.html">下拉列表</a></li>
                  <li class=''><a href="/media.html">媒体</a></li>
                  <li class=''><a href="/modals.html">模态</a></li>
                  <li class=''><a href="/parallax.html">视差</a></li>
                  <li class=''><a href="/pushpin.html">图钉</a></li>
                  <li class=''><a href="/scrollfire.html">滚动显示</a></li>
                  <li class=''><a href="/scrollspy.html">滚动监听</a></li>
                  <li class=''><a href="/side-nav.html">侧边导航</a></li>
                  <li class=''><a href="/tabs.html">标签</a></li>
                  <li class=''><a href="/transitions.html">透明</a></li>
                  <li class=''><a href="/waves.html">波纹效果</a></li>
                </ul>
              </div>
            </li>
          </ul>
        </li>
        <li class="bold "><a href="/mobile.html" class="waves-effect  waves-teal">手机</a></li>
        <li class="bold "><a href="/showcase.html" class="waves-effect  waves-teal">案例展示</a></li>
      </ul>
    </header>
        <main><div class="container">
  <div class="row">

    <div class="col s12 m9 l10">

      <!--  Valign Section-->
      <div id="valign" class="section scrollspy">
        <h2 class="header">对齐</h2>
        <p class="caption">我们使用几个简单的类来是你的页面进行对齐。</p>

        <h5 class="light">垂直对齐</h5>
        <p>通过增加 <code class="language-markup">valign-wrapper</code>类来使包裹的内容垂直居中。</p>
        <div class="valign-demo valign-wrapper">
          <h5 class="valign center" style="width: 100%;">这个应该垂直居中对齐</h5>
        </div>
        <pre><code class="language-markup">
&lt;div class="valign-wrapper">
  &lt;h5 class="valign">这个应该垂直居中对齐&lt;/h5>
&lt;/div>
        </code></pre><br>

        <h5 class="light">文本对齐</h5>
        <p>这些类用于水平对齐内容。我们有 <code class="language-markup">.left-align</code>, <code class="language-markup">.right-align</code> 和 <code class="language-markup">.center-align</code></p>
        <div class="talign-demo">
          <br>
          <h5 class="left-align">这个应该左对齐</h5>
        </div>
        <br>
        <div class="talign-demo">
          <br>
          <h5 class="right-align">这个应该右对齐</h5>
        </div>
        <br>
        <div class="talign-demo">
          <br>
          <h5 class="center-align">这个应该居中对齐</h5>
        </div>
        <pre><code class="language-markup">
  &lt;div>
    &lt;h5 class="left-align">这个应该左对齐&lt;/h5>
  &lt;/div>
  &lt;div>
    &lt;h5 class="right-align">这个应该右对齐&lt;/h5>
  &lt;/div>
  &lt;div>
    &lt;h5 class="center-align">这个应该居中对齐&lt;/h5>
  &lt;/div>
        </code></pre><br>

        <h5 class="light">快速浮动</h5>
        <p>快速浮动通过添加类<code class="language-markup">left</code> 或 <code class="language-markup">right</code>到元素中。<code class="language-markup">!important</code>常用避免特殊问题。</p>
        <pre><code class="language-markup">
&lt;div class="left">...&lt;/div>
&lt;div class="right">...&lt;/div>
        </code></pre><br>

      </div><!--  End Valign Section  -->

      <!--  Hiding Section-->
      <div id="hiding" class="section scrollspy">
        <h2 class="header">隐藏内容</h2>
        <p>我们提供易于使用的类来隐藏特定屏幕大小的内容。</p>
        <table class="striped">
          <thead>
            <tr>
              <th></th>
              <th>屏幕种类</th>
            </tr>
          </thead>
            <tbody>
            <tr>
              <td><code class="language-markup"><strong>.hide</strong></code></td>
              <td>隐藏，所有设备有效。</td>
            </tr>
            <tr>
              <td><code class="language-markup"><strong>.hide-on-small-only</strong></code></td>
              <td>隐藏，仅手机设备有效。</td>
            </tr>
            <tr>
              <td><code class="language-markup"><strong>.hide-on-med-only</strong></code></td>
              <td>隐藏，仅平板设备有效。</td>
            </tr>
            <tr>
              <td><code class="language-markup"><strong>.hide-on-med-and-down</strong></code></td>
              <td>隐藏，桌面设备及以下尺寸的设备有效</td>
            </tr>
            <tr>
              <td><code class="language-markup"><strong>.hide-on-med-and-up</strong></code></td>
              <td>隐藏，仅桌面设备及以上尺寸有效。</td>
            </tr>
            <tr>
              <td><code class="language-markup"><strong>.hide-on-large-only</strong></code></td>
              <td>隐藏，仅桌面设备隐藏。</td>
            </tr>
          </tbody>
        </table>
        <br>
        <h5 class="light">用法</h5>
        <pre><code class="language-markup">
  &lt;div class="hide-on-small-only">&lt;/div>
        </code></pre><br>

      </div><!--  End Hiding Section  -->



      <!--  Formatting Section-->
      <div id="formatting" class="section scrollspy">
        <h2 class="header">格式</h2>
        <p>这些类用于格式话网站上的不同内容。</p>

        <h5 class="light">截尾</h5>
        <p>清空一行中溢出的文本并用省略号代替，添加类<code class="language-markup">truncate</code>到包含内容的标签里。 看下面一个卡片标题头被截断的例子。</p>

        <div class="row">
          <div class="col s6 offset-s3 m6 offset-m3">
            <div class="card-panel">
              <h4 class="truncate">这是一个长长的标题头被截断。</h4>
            </div>
          </div>
        </div>

        <pre><code class="language-markup">
  &lt;h4 class="truncate">这是一个长长的标题头被截断。&lt;/h4>
        </code></pre><br>

        <h5 class="light">悬浮</h5>
        <p><code class="language-markup">hoverable</code>是一个悬浮类，给盒子增加一个动态的阴影就像下面。 它可以用在很多元素中，并不意味着只能用于卡片中。</p>
        <div class="card hoverable small">
          <div class="card-image">
            <img src="images/sample-1.jpg">
            <span class="card-title">卡片标题</span>
          </div>
          <div class="card-content">
            <p>我是一个非常简单的卡片。我擅长展示小部分的内容。 我很方便， 因为我包含一个标记效果。</p>
          </div>
          <div class="card-action">
            <a href="#">这是一个链接</a>
          </div>
        </div>

        <pre><code class="language-markup">
  &lt;div class="card-panel hoverable"> 可悬浮卡片面板&lt;/div>
        </code></pre>

      </div><!--  End Formatting Section  -->

      <!--  Browser Default Section-->
      <div id="browser-default" class="section scrollspy">
        <h2 class="header">浏览器默认</h2>
        <p>因为我们重写很多默认的浏览器样式与元素，我们提供<code class="language-markup">.browser-default</code>类来还原为浏览器默认的样式或元素。</p>

        <table class="striped">
          <thead>
            <tr>
              <th>元素名称</th>
              <th>关联的样式</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>UL</td>
              <td>子弹点</td>
            </tr>
            <tr>
              <td>SELECT</td>
              <td>浏览器select元素</td>
            </tr>
          </tbody>
        </table>
      </div><!--  End Browser Default Section  -->


    </div>

    <div class="col hide-on-small-only m3 l2">
      <div class="toc-wrapper">
        
        <div style="height: 1px;">
          <ul class="section table-of-contents">
            <li><a href="#valign">对齐</a></li>
            <li><a href="#hiding">隐藏内容</a></li>
            <li><a href="#formatting">格式</a></li>
            <li><a href="#browser-default">浏览器默认</a></li>
          </ul>
        </div>
      </div>
    </div>

  </div>
</div>

    </main>    
    <footer class="page-footer">
      <div class="container">
        <div class="row">
          <div class="col l4 s12">
            <h5 class="white-text">相关网站</h5>
            <ul>
              <li><a class="white-text" target='_blank' href="http://www.okgoes.com">完美起航</a></li>
              <li><a class="white-text" target='_blank' href="http://note.okgoes.com/">起航笔记</a></li>
              <li><a class="white-text" target='_blank' href="http://www.vuematerial.com/">Vue Material中文</a></li>
	      <li><a class="white-text" target='_blank' href="http://blog.okgoes.com/">起航博客</a></li>
            </ul>
          </div>
          <div class="col l4 s12">
            <h5 class="white-text">学习交流</h5>
            <p class="grey-text text-lighten-4">我们为此开发了一个关于Materialize UI框架学习的论坛，你可以在这个论坛分享你的学习经验，同时得到我们的技术帮助。</p>
            <a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=a483a26b5f09e710a058154e816b89366870562955be319050b7d096ffe0f9c2"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="materialize学习交流" title="materialize学习交流"></a>
            <br/>
            <a class="btn waves-effect waves-light red lighten-3" target="_blank" href="http://forum.okgoes.com/forum.php?mod=forumdisplay&fid=66">论坛</a>
          </div>
          <div class="col l4 s12" style="overflow: hidden;">
            <h5 class="white-text">联系我们</h5>
            <!-- 
            <iframe src="http://ghbtns.com/github-btn.html?user=dogfalo&repo=materialize&type=watch&count=true&size=large" allowtransparency="true" frameborder="0" scrolling="0" width="170" height="30"></iframe>
             -->
             <a href="http://wpa.qq.com/msgrd?V=3&amp;uin=473166512&amp;Site=完美起航&amp;Menu=yes&amp;from=okgoes" target="_blank" title="QQ"><img src="/images/site_qq.jpg" alt="QQ" style="vertical-align: middle;"></a>
            <br>
            <a href="mailto:473166512@qq.com" class="twitter-follow-button" data-show-count="true" data-size="large" data-dnt="true">473166512@qq.com</a>
            <br>
            <div><h5 class="white-text">网站信息</h5></div>
            <div><a class="white-text" href="http://www.miitbeian.gov.cn/">赣ICP备15002760号-4</a></div>
            <div class="g-follow" data-annotation="bubble" data-height="24" data-href="https://plus.google.com/108619793845925798422" data-rel="publisher"></div>
          </div>
        </div>
      </div>
      <div class="footer-copyright">
        <div class="container">
        © 2014-2016 Materialize, All rights reserved.
        <a class="grey-text text-lighten-4 right" href="https://github.com/Dogfalo/materialize/blob/master/LICENSE">MIT License</a>
        </div>
      </div>
    </footer>

    <!-- count -->
    <script src='http://manual.okgoes.com/index/count'></script>
    <script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?478902902272d2025e064ebc5eb6c99c";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
    <!--  Scripts-->

    <script type="text/javascript" src="/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
  </body>
</html>