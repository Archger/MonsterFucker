package com.analysis.hibernate;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;


//学习Configuration对象
// Configuration功能: 配置加载类.用于加载主配置,orm元数据加载
public class demo {

	@Test
	public void fun1(){
		String password ="123456";
		String username = "Arch";
		
		Configuration conf = new Configuration().configure();
		//2 根据配置信息,创建 SessionFactory对象
		SessionFactory sf = conf.buildSessionFactory();
		//3 获得session
		Session session = sf.openSession();
		//4 session获得操作事务的Transaction对象
		//获得操作事务的tx对象
		//Transaction tx = session.getTransaction();
		//开启事务并获得操作事务的tx对象(建议使用)
		Transaction tx2 = session.beginTransaction();
		//----------------------------------------------
		User user = new User();  
        Query q = session.createQuery("from User where username=? and password=?");  
        q.setString(0, username);  
        q.setString(1, password);  
        user = (User)q.uniqueResult(); 
        List<User> list=q.list();
        for(int i=0;i<list.size();i++)
        {
        	System.out.println(list.get(i).toSting());
        }
		//----------------------------------------------
		tx2.commit();//提交事务
		//tx2.rollback();//回滚事务
		session.close();//释放资源
	}
}
