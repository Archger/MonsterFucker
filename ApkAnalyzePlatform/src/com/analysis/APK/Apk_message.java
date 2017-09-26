package com.analysis.APK;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.analysis.cfg.HibernateSessionFactory;
import com.analysis.hibernate.Apk;
import com.analysis.hibernate.Message;
import com.analysis.hibernate.User;

/**
 * Servlet implementation class Apk_message
 */
@WebServlet("/Apk_message")
public class Apk_message extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Apk_message() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String Apkid = request.getParameter("apkid");
		
		Integer apkid=Integer.valueOf(Apkid);
		Session session=HibernateSessionFactory.getSession();
		Transaction tx = session.beginTransaction();
		Query q = session.createQuery("from Apk where apk_id = ?");  
		q.setParameter(0, apkid);
        List<Apk> list=q.list();
        if(list.size()>0)
        {
        	Apk apk=list.get(0);
        	request.setAttribute("apk",apk );
    		request.setAttribute("iconPath", apk.getIconDirectory());
        }
        tx.commit();
        HibernateSessionFactory.closeSession();
        request.getRequestDispatcher("apk_message.jsp").forward(request,response);
	}

}
