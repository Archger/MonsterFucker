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
		String order = request.getParameter("order");
		String typ = request.getParameter("type");
		int flag;
		if(typ == null || typ.length() == 0) flag = 1;
		else if(typ.equals("1")) flag = 1;
		else flag = -1;
		if(order != null && order.length() > 0 && res != null){
			System.out.println("order!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+Integer.toString(flag));
			System.out.println(flag);
			String ch1 = "2",ch2 = "244444";
			System.out.println(ch2.compareTo(ch1));
			for(int i = 0;i < res.size();i ++){
			    for(int j = i + 1;j < res.size();j ++){
			    	if(order.equals("apkName")){
			    		String tmp1 = res.get(i).getApkName(),tmp2 = res.get(j).getApkName();
			    		if(tmp1 != null && tmp2 != null)
			    		{
				    		if(tmp2.compareTo(tmp1) * flag < 0){
				    			Apk temp1 = res.get(i),temp2 = res.get(j);
				    			System.out.println(Integer.toString(i) + "&&&&&&&&&&&&&&&&"+Integer.toString(j));
				    			res.set(i,temp2);
				    			res.set(j, temp1);
				    		}
			    		}
			    		else if(tmp1 == null){
			    			Apk temp1 = res.get(i),temp2 = res.get(j);
			    			res.set(i,temp2);
			    			res.set(j, temp1);
			    		}
			    	}
			    	else if(order.equals("developer_Id")){
			    		Integer tmp1 = res.get(i).getDeveloperId(),tmp2 = res.get(j).getDeveloperId();
			    		if(tmp1 != null && tmp2 != null)
			    		{
				    		if(tmp2.compareTo(tmp1) * flag < 0){
				    			Apk temp1 = res.get(i),temp2 = res.get(j);
				    			res.set(i,temp2);
				    			res.set(j, temp1);
				    		}
			    		}
			    		else if(tmp1 == null){
			    			Apk temp1 = res.get(i),temp2 = res.get(j);
			    			res.set(i,temp2);
			    			res.set(j, temp1);
			    		}
			    	}
			    	else if(order.equals("apkType")){
			    		String tmp1 = res.get(i).getApkType(),tmp2 = res.get(j).getApkType();
			    		if(tmp1 != null && tmp2 != null)
			    		{
				    		if(tmp2.compareTo(tmp1) * flag < 0){
				    			Apk temp1 = res.get(i),temp2 = res.get(j);
				    			res.set(i,temp2);
				    			res.set(j, temp1);
				    		}
			    		}
			    		else if(tmp1 == null){
			    			Apk temp1 = res.get(i),temp2 = res.get(j);
			    			res.set(i,temp2);
			    			res.set(j, temp1);
			    		}
			    	}
			    	else if(order.equals("versionName")){
			    		String tmp1 = res.get(i).getVersionName(),tmp2 = res.get(j).getVersionName();
			    		if(tmp1 != null && tmp2 != null)
			    		{
				    		if(tmp2.compareTo(tmp1) * flag < 0){
				    			Apk temp1 = res.get(i),temp2 = res.get(j);
				    			res.set(i,temp2);
				    			res.set(j, temp1);
				    		}
			    		}
			    		else if(tmp1 == null){
			    			Apk temp1 = res.get(i),temp2 = res.get(j);
			    			res.set(i,temp2);
			    			res.set(j, temp1);
			    		}
			    	}
			    }
			}
		}

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
