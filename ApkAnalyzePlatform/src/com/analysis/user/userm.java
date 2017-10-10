package com.analysis.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.analysis.cfg.HibernateSessionFactory;
import com.analysis.hibernate.User;

public class userm extends HttpServlet {

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String button = request.getParameter("Submit");
		if(button.equals("删除") )
		{
			String []st = request.getParameterValues("delete");
			if(st!=null)
			{
				Session session = HibernateSessionFactory.getSession();
			    Transaction tx2 = session.beginTransaction();
				for(int i = 0;i < st.length;i ++)
				{
					User u  = (User)session.get(User.class,Integer.parseInt(st[i]));
					if(u != null)
					{
					    session.delete(u);
					}
				}
				tx2.commit();
				session.close();
			}
			request.getRequestDispatcher("usermanager.jsp").forward(request,response);
		}
		else if(button.equals("修改"))
		{
			Session session = HibernateSessionFactory.getSession();
		    Transaction tx2 = session.beginTransaction();
		    String hql = "from User";
		    Query q = session.createQuery(hql);
		    List<User> list = q.list();
	    	Object user_id=request.getSession().getAttribute("user_id");
		    for(int i = 0;i < list.size();i ++)
		    {
		    	if(list.get(i).getUserId()==(Integer)user_id) continue;
		    	System.out.println(i);
		    	User u = (User) session.get(User.class, list.get(i).getUserId());
		    	String res2 = request.getParameter("filesize" + Integer.toString(list.get(i).getUserId()));
		    //	System.out.println("Flosses" + Integer.toString(list.get(i).getUserId()) + "!!");
				if(res2 != null && res2.length() > 0)
				{
				    int val = Integer.parseInt(res2);
				    if(u != null) u.setFileSize(val);
				}
				if(u != null)
				{
				    session.update(u);
				}
		    	String []res = request.getParameterValues(Integer.toString(list.get(i).getUserId()));
		    	if(u != null){ 
		    		u.setDownload(false);
		    	    u.setIsAdmin(false);
		    	    u.setUpload(false);
		    	    session.update(u);
		    	}
		    	if(res == null || res.length == 0) continue;
		    	for(int j = 0;j < res.length;j ++)
		    	{
		    		
		    		if(res[j].equals("download") && u != null) u.setDownload(true);
		    		if(res[j].equals("upload") && u != null) u.setUpload(true);
		    		if(res[j].equals("is_admin") && u != null) u.setIsAdmin(true);
		    	}
		    	if(u != null) session.update(u);
		    	session.flush();
				session.clear();
				tx2.commit();
				tx2=session.beginTransaction();

		    }
		    tx2.commit();
			session.close();
			request.getRequestDispatcher("usermanager.jsp").forward(request,response);
	}
	}
}
