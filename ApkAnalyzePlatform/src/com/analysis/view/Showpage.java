package com.analysis.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;

import com.analysis.cfg.HibernateSessionFactory;
import com.analysis.hibernate.Apk;
import com.analysis.hibernate.User;
import com.analysis.search.Page;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.*;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class Showpage extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
        Apk apk = (Apk)session.getAttribute("apk");
        session.setAttribute("apk",apk);
		String no = request.getParameter("pageNo");
		int pageSize = 10;
		int pageNo = 1;
		if(no != null && no != ""){
			pageNo = Integer.valueOf(no);
		}
		int totalCount = 35;
		Page page = new Page(pageSize,pageNo,totalCount);
		request.setAttribute("pageNo",pageNo);
		request.setAttribute("pag",page);
		System.out.println(Integer.toString(pageNo) + "%%%%%%%%%%");
		request.getRequestDispatcher("upload_message.jsp").forward(request,response);
	}

}
