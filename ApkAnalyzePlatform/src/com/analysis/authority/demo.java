package com.analysis.authority;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

import com.analysis.hibernate.Message;


//学习Configuration对象
// Configuration功能: 配置加载类.用于加载主配置,orm元数据加载
public class demo {

	@Test
	public void fun1(){
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
		Message message = new Message();  
        Query q = session.createQuery("from Message where receiver_id=?");  
        q.setString(0, "1");  
        List<Message> list=q.list();
        if(list.size()>0)
        {
        	 for(int i=0;i<list.size();i++)
        	 {
        		 System.out.println(list.get(i).toString());
        	 }
        }
        else
        {
        	
        }
		//----------------------------------------------
		tx2.commit();//提交事务
		//tx2.rollback();//回滚事务
		session.close();//释放资源
	}
	
	public List<Message> getmessage()
	{
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
		Message message = new Message();  
        Query q = session.createQuery("from Message where receiver_id=?");  
        q.setString(0, "1");  
        List<Message> list=q.list();
		//----------------------------------------------
		tx2.commit();//提交事务
		//tx2.rollback();//回滚事务
		session.close();//释放资源

        return list;
	}
}
