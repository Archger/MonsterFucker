package com.analysis.search;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;

import com.analysis.cfg.HibernateSessionFactory;
import com.analysis.hibernate.Apk;
import com.analysis.hibernate.User;

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
		List<Apk> res = new ArrayList<Apk>();
		res.addAll((List<Apk>)session.getAttribute("res"));
		System.out.println("woow");
		String no = request.getParameter("pageNo");
		int pageSize = 5;
		int pageNo = 1;
		if(no != null && no != ""){
			pageNo = Integer.valueOf(no);
		}
		int totalCount = res.size();
		Page page = new Page(pageSize,pageNo,totalCount);
		List<Apk> list2 = new ArrayList<Apk>();
		for(int i = (pageNo - 1) * pageSize ;i < pageNo * pageSize && i < totalCount;i ++){
			list2.add(res.get(i));
		}
		if(list2 != null){
			request.setAttribute("list2",list2);
			request.setAttribute("res", res);
			request.setAttribute("page",page);
		}
		request.getRequestDispatcher("search.jsp").forward(request,response);
	}

}
