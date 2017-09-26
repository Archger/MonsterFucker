package com.analysis.statistic;

import java.io.IOException;
import java.math.BigInteger;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.*;
import org.junit.Test;

import com.analysis.cfg.HibernateSessionFactory;

/**
 * Servlet implementation class ApkStatistics
 */
@WebServlet("/ApkStatistics")
public class ApkStatistics extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApkStatistics() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//字符集设置为utf-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String[] apkTypes=request.getParameterValues("ApkTypes");
		String[] permissions=request.getParameterValues("Permissions");
		String startMonth=request.getParameter("startMonth");
		String endMonth=request.getParameter("endMonth");
		String minSize=request.getParameter("minSize");
		String maxSize=request.getParameter("maxSize");
		
		//上传时间统计
		if(startMonth.isEmpty()==false&&endMonth.isEmpty()==false)
		{
			System.out.println(startMonth+endMonth);
			Map uploadDateMap=uploadDateStatistics(startMonth,endMonth);
			request.setAttribute("uploadDateMap", uploadDateMap);
		}
		
		//文件大小统计
		if(minSize.isEmpty()==false&&maxSize.isEmpty()==false)
		{
			Map fileSizeMap=fileSizeStatistics(minSize,maxSize);
			request.setAttribute("fileSizeMap", fileSizeMap);
		}
		
		//apk类型的统计信息
		if(apkTypes!=null)
		{
			Map typeMap= apkTypeStatistics(apkTypes);
			request.setAttribute("typeMap", typeMap);
		}
		
		//apk权限的统计信息
		if(permissions!=null)
		{
			Map permissionMap= permissionStatistics(permissions);
			request.setAttribute("permissionMap", permissionMap);
		}
		
        // 跳转到apk_statistics_charts.jsp
        getServletContext().getRequestDispatcher("/apk_statistics_charts.jsp").forward(
                request, response);
	}
	
	@SuppressWarnings("unchecked")
	public Map apkTypeStatistics(String[] apkTypes)
	{
		Session session= HibernateSessionFactory.getSession();
			Transaction tx=session.beginTransaction();
			//-------------------------------------------------------
			Map typeNum=new LinkedHashMap();
			for(String apktype:apkTypes)
			{
				String hql="select count(*) from Apk where apk_type=?";
				Query query=session.createQuery(hql);
				query.setParameter(0, apktype);
				Long num= (Long) query.uniqueResult();
				typeNum.put(apktype, num);
			}
			//-------------------------------------------------------
			tx.commit();
			HibernateSessionFactory.closeSession();
			return typeNum;
	}
	
	@SuppressWarnings("unchecked")
	public Map permissionStatistics(String[] permissions)
	{
		Session session= HibernateSessionFactory.getSession();
			Transaction tx=session.beginTransaction();
			//-------------------------------------------------------
			Map permissionNum=new LinkedHashMap();
			for(String permission:permissions)
			{
				String hql="select count(*) from Apk where "+permission+" =1";
				Query query=session.createQuery(hql);
				Long num= (Long) query.uniqueResult();
				permissionNum.put(permission, num);
			}
			//-------------------------------------------------------
			tx.commit();
			HibernateSessionFactory.closeSession();
			return permissionNum;
	}

	@SuppressWarnings("unchecked")
	public Map uploadDateStatistics(String startMonth,String endMonth)
	{
			Session session= HibernateSessionFactory.getSession();
			Transaction tx=session.beginTransaction();
			//-------------------------------------------------------
			Map monthNum=new LinkedHashMap();
			String sql="select DATE_FORMAT(upload_date,'%Y-%m') as month,count(apk_id) from apk where upload_date>= '"
					+startMonth+"' and upload_date<= '"+endMonth+"' group by DATE_FORMAT(upload_date,'%Y-%m') order by month ";
			SQLQuery query=session.createSQLQuery(sql);////////////这里有个mysql的坑：大于等于能取到下界，小于等于就取不到上界。 
			List<Object[]> list=query.list();
			for(Object[] objs:list)
			{
				monthNum.put((String)objs[0], (BigInteger)objs[1]);
			}
			//-------------------------------------------------------
			tx.commit();
			HibernateSessionFactory.closeSession();
			return monthNum;
	}
	
	@SuppressWarnings("unchecked")
	public Map fileSizeStatistics(String minSize,String maxSize)
	{
		Session session= HibernateSessionFactory.getSession();
			Transaction tx=session.beginTransaction();
			//-------------------------------------------------------
			Map fileSizeNum=new LinkedHashMap();
			int size=Integer.parseInt(minSize);
			int maxSizeInt=Integer.parseInt(maxSize);
			while(size<maxSizeInt)
			{
				int midSize=size+10;
				String sql="select count(apk_id) from apk where file_size>"+size+" and file_size<="+midSize;
				SQLQuery query = session.createSQLQuery(sql);
				BigInteger num=(BigInteger)query.uniqueResult();
				fileSizeNum.put(size, num);  //存的是区间左边界
				size+=10;
			}
			
			//-------------------------------------------------------
			tx.commit();
			HibernateSessionFactory.closeSession();
			System.out.println(fileSizeNum);
			return fileSizeNum;
	}
}