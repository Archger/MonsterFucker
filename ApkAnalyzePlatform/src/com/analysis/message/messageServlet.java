package com.analysis.message;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.analysis.cfg.HibernateSessionFactory;
import com.analysis.hibernate.Message;
import com.analysis.hibernate.User;

/**
 * Servlet implementation class messageServlet
 */
@WebServlet("/ApkAnalyzePlatform/messageServlet")
public class messageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public messageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("UTF-8");
		Object user_id=request.getSession().getAttribute("user_id");
		String to =request.getParameter("to");
		String content =request.getParameter("content");
		Object is_admin=request.getSession().getAttribute("is_admin");
		//----------------------------------------------
		if(to.isEmpty())
		{
			response.getWriter().print("<script>alert(\"username shouldn't be void.\");window.history.back();</script>");
		}
		else if(content.isEmpty())
		{
			response.getWriter().print("<script>alert(\"content shouldn't be void.\");window.history.back();</script>");
		}
		else if(to.equals("all"))
		{
			if((Boolean)is_admin)
			{
				Session session=HibernateSessionFactory.getSession();
				Transaction tx = session.beginTransaction();
			
				Message message = new Message();
				message.setContent(content);
				message.setSenderId((Integer)user_id);
				message.setIsRead(false);
				
				Query q = session.createQuery("from User");  
		        List<User> list=q.list();
				for(int i=0;i<list.size();i++)
				{
					Message temp = message;
					temp.setReceiverId(list.get(i).getUserId());
					session.save(temp);
					session.flush();
					session.clear();
					tx.commit();
					tx=session.beginTransaction();
				}
				
		        HibernateSessionFactory.closeSession();
		        response.sendRedirect("/ApkAnalyzePlatform/message.jsp");
			}
			else
			{
				response.getWriter().print("<script>alert(\"You are not admin.\");window.history.back();</script>");
			}
		}
		else
		{
			Session session=HibernateSessionFactory.getSession();
			Transaction tx = session.beginTransaction();
		
			Message message = new Message();
			message.setContent(content);
			message.setSenderId((Integer)user_id);
			message.setIsRead(false);
			
			Query q = session.createQuery("from User where username=?");  
	        q.setString(0, to);   
	        List<User> list=q.list();
			for(int i=0;i<list.size();i++)
			{
				message.setReceiverId(list.get(i).getUserId());
				session.save(message);
			}
			
	        tx.commit();
	        HibernateSessionFactory.closeSession();
	        response.sendRedirect("/ApkAnalyzePlatform/message.jsp");
		}  
		
		
	}

}
