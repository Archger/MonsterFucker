package com.analysis.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

import com.analysis.cfg.HibernateSessionFactory;
import com.analysis.hibernate.User;

/**
 * Servlet implementation class loginJudge
 */
@WebServlet(
		urlPatterns = { "/loginJudge" }, 
		initParams = { 
				@WebInitParam(name = "loginJudge", value = "")
		})
public class loginJudge extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginJudge() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Test
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//request.setCharacterEncoding("utf-8")
		System.out.println("ok is in login post");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("ok dopost success!");
		Session session=HibernateSessionFactory.getSession();
		Transaction tx = session.beginTransaction();
		String password =request.getParameter("password");
		String username = request.getParameter("username");
		System.out.println(username+" ok and "+password+" ok");
		//----------------------------------------------
		User user = new User();  
        Query q = session.createQuery("from User where username=? and password=?");  
        q.setString(0, username);  
        q.setString(1, password);  
        List<User> list=q.list();
        System.out.println(list.size());
        if(list.size()>0)
        {
        	request.getSession().setAttribute("user_id", list.get(0).getUserId()); 
        	request.getSession().setAttribute("username", username); 
        	request.getSession().setAttribute("is_admin", list.get(0).getIsAdmin()); 
        	request.getSession().setAttribute("file_size", list.get(0).getFileSize());
        	request.getSession().setAttribute("download", list.get(0).getDownload());
        	request.getSession().setAttribute("upload", list.get(0).getUpload());
        	response.sendRedirect("/ApkAnalyzePlatform/dashboard.jsp");
        }
        else
        {
        	response.getWriter().print("<script>alert(\"usename or passwords is wrong.\");window.history.back();</script>");
        }
		//----------------------------------------------
		/*tx2.commit();//提交事务
		//tx2.rollback();//回滚事务
		session.close();//释放资源*/
        tx.commit();
        HibernateSessionFactory.closeSession();
	}

}
