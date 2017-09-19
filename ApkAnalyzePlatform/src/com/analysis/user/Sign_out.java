package com.analysis.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Sign_out
 */
@WebServlet("/Sign_out")
public class Sign_out extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sign_out() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("UTF-8");
		request.getSession().setAttribute("user_id", null); 
    	request.getSession().setAttribute("username", null); 
    	request.getSession().setAttribute("is_admin", null); 
    	request.getSession().setAttribute("file_size", null);
    	request.getSession().setAttribute("download", null);
    	request.getSession().setAttribute("upload", null);
    	response.sendRedirect("/ApkAnalyzePlatform/login.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("UTF-8");
		request.getSession().setAttribute("user_id", null); 
    	request.getSession().setAttribute("username", null); 
    	request.getSession().setAttribute("is_admin", null); 
    	request.getSession().setAttribute("file_size", null);
    	request.getSession().setAttribute("download", null);
    	request.getSession().setAttribute("upload", null);
    	response.sendRedirect("/ApkAnalyzePlatform/login.jsp");
		
	}

}
