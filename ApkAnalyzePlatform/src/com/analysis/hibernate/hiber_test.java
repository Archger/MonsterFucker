package com.analysis.hibernate;


import org.hibernate.*;
import org.hibernate.cfg.*;
import org.junit.Test;

public class hiber_test {

	@Test
	public void fun1(){
		//1 创建,调用空参构造
		Configuration conf = new Configuration();
		//2 读取指定主配置文件 => 空参加载方法,加载src下的hibernate.cfg.xml文件
		conf.configure();
		//3 读取指定orm元数据(扩展),如果主配置中已经引入映射配置.不需要手动加载
		//conf.addResource(resourceName);
		//conf.addClass(persistentClass);
		
		//4 根据配置信息,创建 SessionFactory对象
		SessionFactory sf = conf.buildSessionFactory();
		//--------------------------------------------------
		//5 获得session
		//打开一个新的session对象
		sf.openSession();
		//获得一个与线程绑定的session对象(明天讲解)
		sf.getCurrentSession();
	}
}

