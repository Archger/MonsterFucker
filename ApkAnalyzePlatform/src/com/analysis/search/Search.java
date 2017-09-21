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

public class Search extends HttpServlet {

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
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		Session session2 = HibernateSessionFactory.getSession();
		Transaction tx = session2.beginTransaction();
		Criteria cri = session2.createCriteria(Apk.class);
		String que  = request.getParameter("apkName");
		if(que != null && que.length() > 0) cri.add(Restrictions.like("apkName","%"+que+"%"));
		que  = request.getParameter("apkType");
		if(que != null && que.length() > 0) cri.add(Restrictions.like("apkType","%"+que+"%"));
		que  = request.getParameter("versionName");
		if(que != null && que.length() > 0) cri.add(Restrictions.like("versionName","%"+que+"%"));
		String tmp = request.getParameter("developer_name");
		HttpSession session = request.getSession(true);
	/*		for(int i = 0;i < que.length;i ++){
				String strict = request.getParameter(que[i]);
				if(strict != null && strict.length() > 0)
				{
					if(!que[i].equals("developer_name")){
						cri.add(Restrictions.like(que[i],"%"+strict+"%"));
					}
					else 
					{
						tmp = strict;
					}
				}
			}*/
			List<Apk> list = cri.list(),res = new ArrayList<Apk>();
			if(tmp != null && tmp.length() > 0)
			{
				Criteria cri2 = session2.createCriteria(User.class);
				cri2.add(Restrictions.like("username","%"+tmp+"%"));
				List<User> l = cri.list();
				for(int i = 0;i < l.size();i++){
					for(int j  = 0;j < list.size();j ++){
						if(list.get(j).getDeveloperId() == l.get(i).getUserId()){
							res.add(list.get(j));
						}
					}
				}
			}
			else{
				if(list != null) res.addAll(list);
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
