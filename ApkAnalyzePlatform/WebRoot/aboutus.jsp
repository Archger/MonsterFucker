<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.hibernate.Query" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import="com.analysis.hibernate.Message"%>
<%@ page import="com.analysis.hibernate.User"%>
<%@ page import="com.analysis.cfg.HibernateSessionFactory"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<title>关于我们</title>
		<meta charset="utf-8" />
    	<link href="css/materialdesignicons.min.css" media="all" rel="stylesheet" type="text/css" />
		<!--Import Google Icon Font-->
		<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
		<!--Import materialize.css-->
		<link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
		<!--Let browser know website is optimized for mobile-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<script type="text/javascript" src="FusionCharts/js/fusioncharts.js"></script>
		<script type="text/javascript" src="FusionCharts/js/themes/fusioncharts.theme.fint.js"></script>

		<style>
			.parallax-container {
      height: 500px;
   }
		</style>

	</head>

	<body>
		<!--java start-->
		<%
//request.setCharacterEncoding("utf-8");
Object user_id=request.getSession().getAttribute("user_id");
Object username=request.getSession().getAttribute("username");
Object is_admin=request.getSession().getAttribute("is_admin");
System.out.println(username+" "+is_admin);
int un_read_num=0;
Session session2=HibernateSessionFactory.getSession();
Transaction tx2 = session2.beginTransaction();
//----------------------------------------------
Message message = new Message();  
Query q = session2.createQuery("from Message where receiver_id = ?");  
q.setParameter(0, user_id.toString());
System.out.println("user_id = "+user_id.toString());
List<Message> list=q.list();
System.out.println("list size = "+list.size());
for(int i=0;i<list.size();i++)
{
	if(!list.get(i).getIsRead())
		un_read_num++;
}
System.out.println(un_read_num);
tx2.commit();
HibernateSessionFactory.closeSession();
 %>
		<!--java end-->

		<!--Import jQuery before materialize.js-->
		<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="js/materialize.min.js"></script>

		<div class="fixed-action-btn">
			<a class="btn-floating btn-large red" href="dashboard.jsp">
				<i class="large mdi mdi-24px mdi-light mdi-replay"></i>
			</a>
		</div>

		<main>
			<div class="parallax-container">
				<div class="parallax"><img src="images/loginback.jpg"></div>
			</div>
			<div class="section white">
				<div class="row container">
					<h2 class="header">MonsterFighter Team</h2>
					<h6 class="flow-text grey-text text-darken-3 lighten-3">MonsterFighter developer：Arch , Krypton , ST</h6>
					<h4 class="header">联系我们</h5>
					<h6 class="flow-text grey-text text-darken-3 lighten-3">
						Email: MonsterFighter@gmail.com<br />
						QQ: 669143142<br />
						期待您能给我们提供宝贵的意见,同时也期待您的加入<br />
					</h6>
					<h6 class="flow-text">MonsterFighter for a better tomorrow.</h6>
				</div>
			</div>
			<div class="parallax-container">
				<div class="parallax"><img src="images/loginback.jpg"></div>
			</div>
		</main>

		<!--foot start-->
		<footer class="page-footer">
			<div class="footer-copyright">
				<div class="container">
					Copyright MonsterFighter Team © 2017 All rights reserved.
					<span class="right"> Design and Developed by  MonsterFighter</span>
				</div>
			</div>
		</footer>
		<!--foot end-->

	</body>

	<!--Script start-->
	<script type="text/javascript">
		$(".button-collapse").sideNav();
		$(document).ready(function() {
			$('.scrollspy').scrollSpy();
		});
		$(document).ready(function() {
			$('.parallax').parallax();
		});

		////////////////////
		var options = [{
				selector: '#staggered-test',
				offset: 50,
				callback: function(el) {
					Materialize.toast("This is our ScrollFire Demo!", 1500);
				}
			},
			{
				selector: '#staggered-test',
				offset: 205,
				callback: function(el) {
					Materialize.toast("Please continue scrolling!", 1500);
				}
			},
			{
				selector: '#staggered-test',
				offset: 400,
				callback: function(el) {
					Materialize.showStaggeredList($(el));
				}
			},
			{
				selector: '#image-test',
				offset: 500,
				callback: function(el) {
					Materialize.fadeInImage($(el));
				}
			}
		];
		Materialize.scrollFire(options);
	</script>

	<!--Script End-->

</html>