<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <html>
    <head>
      <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      
     <style>
      header, main, footer {
      padding-left: 300px;
    }

    @media only screen and (max-width : 992px) {
      header, main, footer {
        padding-left: 0;
      }
    }
     body {
    display: flex;
    min-height: 100vh;
    flex-direction: column;
  }

  main {
    flex: 1 0 auto;
  }
     </style>
      
      <script>
       $(".button-collapse").sideNav();
        $(document).ready(function(){
    $('.scrollspy').scrollSpy();
  });
      </script>
      
    </head>

    <body>
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      
      
      
      <header>
        
        <nav class="top-nav">
    <div class="container">
    <div class="nav-wrapper"><a class="page-title">页脚</a></div>
    </div>
    
    </nav>        
      <div class="container">
      <a href="#" data-activates="nav-mobile" class="button-collapse top-nav waves-effect waves-light circle hide-on-large-only"><i class="material-icons">menu</i></a></div>
      <ul id="slide-out" class="side-nav fixed">
        <li class="logo">
        <img src="images/materialize-logo.png" />
        </li>
        <li class="bold "><a href="/about.html" class="waves-effect waves-teal">关于我们</a></li>
        <li class="bold "><a href="/getting-started.html" class="waves-effect waves-teal">开始学习</a></li>
        <li class="no-padding">
          <ul class="collapsible collapsible-accordion">
            <li class="bold "><a class="collapsible-header  waves-effect waves-teal">CSS</a>
              <div class="collapsible-body">
                <ul>
                  <li class=''><a href="/color.html">颜色</a></li>
                  <li class=''><a href="/grid.html">网格</a></li>
                  <li class=''><a href="/helpers.html">助手</a></li>
                  <li class=''><a href="/media-css.html">媒体</a></li>
                  <li class=''><a href="/sass.html">Sass</a></li>
                  <li class=''><a href="/shadow.html">阴影效果</a></li>
                  <li class=''><a href="/table.html">表格</a></li>
                  <li class=''><a href="/typography.html">字体样式</a></li>
                </ul>
              </div>
            </li>
            <li class="bold active"><a class="collapsible-header active  waves-effect waves-teal">组件</a>
              <div class="collapsible-body">
                <ul>
                  <li class=''><a href="/badges.html">徽章</a></li>
                  <li class=''><a href="/buttons.html">按钮</a></li>
                  <li class=''><a href="/breadcrumbs.html">路径导航</a></li>
                  <li class=''><a href="/cards.html">卡片</a></li>
                  <li class=''><a href="/chips.html">信息块</a></li>
                  <li class=''><a href="/collections.html">集合</a></li>
                  <li class='active'><a href="/footer.html">页脚</a></li>
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
      	
      	<main>
      <div class="container">
      
      	<!--right start-->
      <div class="row">
    <div class="col s12 m9 l10">
      <div id="introduction" class="section scrollspy">
        <p>内容 </p>
      </div>

      <div id="structure" class="section scrollspy">
        <p>内容 </p>
      </div>

      <div id="initialization" class="section scrollspy">
        <p>内容 </p>
      </div>
    </div>
    <div class="col hide-on-small-only m3 l2">
      <ul class="section table-of-contents">
        <li><a href="#introduction">介绍</a></li>
        <li><a href="#structure">结构</a></li>
        <li><a href="#initialization">初始化</a></li>
      </ul>
    </div>
  </div>
  <!--right end-->
  
  <div class="file-field input-field">
      <div class="btn">
        <span>文件</span>
        <input type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>
  
  <nav>
    <div class="nav-wrapper">
      <form>
        <div class="input-field">
          <input id="search" type="search" required>
          <label class="label-icon" for="search"><i class="material-icons">search</i></label>
          <i class="material-icons">close</i>
        </div>
      </form>
    </div>
  </nav>
      
      </div>
      	
      	</main>
  
      	  
  <!--foot start-->
  
  <footer class="page-footer">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">页脚内容</h5>
                <p class="grey-text text-lighten-4">你可以用行和列来组织你的页脚内容。</p>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="white-text">链接</h5>
                <ul>
                  <li><a class="grey-text text-lighten-3" href="#!">链接 1</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">链接 2</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">链接 3</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">链接 4</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="footer-copyright">
            <div class="container">
            © 2014 Copyright 文本
            <a class="grey-text text-lighten-4 right" href="#!">更多链接</a>
            </div>
          </div>
        </footer>
  
  <!--foot end-->
      
      
    
  
  
      
    </body>
  </html>
