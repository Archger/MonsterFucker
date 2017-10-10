package com.analysis.search;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.analysis.cfg.HibernateSessionFactory;
import com.analysis.hibernate.Apk;

/**
 * Servlet implementation class DashBoardSearch
 */
@WebServlet("/DashBoardSearch")
public class DashBoardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashBoardSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String apkName=request.getParameter("apkName");
		
		Session session= HibernateSessionFactory.getSession();
		Transaction tx=session.beginTransaction();
		//-------------------------------------------------------
		
			Criteria cri=session.createCriteria(Apk.class);
			String s="%"+apkName+"%";
			cri.add(Restrictions.like("apkName",s));
			List<Apk> apkList=cri.list();
	
		//-------------------------------------------------------
		tx.commit();
		HibernateSessionFactory.closeSession();
		request.setAttribute("apkList", apkList);
		// 跳转到dashboard.jsp
        getServletContext().getRequestDispatcher("/dashboard.jsp").forward(
                request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
