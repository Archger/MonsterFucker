package com.analysis.cfg;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class SecurityFilter
 */
@WebFilter("/SecurityFilter")
public class SecurityFilter implements Filter {
	private String permitUrls[] = null; 

    private String gotoUrl = null; 

    public void destroy() { 

        // TODO Auto-generated method stub 
        permitUrls = null; 

        gotoUrl = null; 

    } 

    public void doFilter(ServletRequest request, ServletResponse response, 

            FilterChain chain) throws IOException, ServletException { 

        // TODO Auto-generated method stub 

		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("UTF-8");

        HttpServletRequest res=(HttpServletRequest) request; 

        HttpServletResponse resp=(HttpServletResponse)response; 

        if(!isPermitUrl(request)){ 

            if(filterCurrUrl(request)){ 

                System.out.println("--->请登录");
                resp.getWriter().print("<script>alert(\"Please Login in first.\");</script>");
                resp.sendRedirect(res.getContextPath()+gotoUrl); 
                return; 

            } 

        } 

        System.out.println("--->允许访问"); 

        chain.doFilter(request, response); 

    } 

    public boolean filterCurrUrl(ServletRequest request){ 


        boolean filter=false; 

        HttpServletRequest res=(HttpServletRequest) request; 
        String currentUrl = currentUrl(request); 
        
        Object user =  res.getSession().getAttribute("username"); 

        if(null==user) 
            filter=true; 
        else if(currentUrl.length()>=16&&currentUrl.substring(0, 16).equals("/usermanager.jsp")){
        	Object is_admin =  res.getSession().getAttribute("is_admin");
        	if(!(Boolean)is_admin){
        		filter=true;
        		gotoUrl="/dashboard.jsp";
        	}
        }
        else if(currentUrl.length()>=11&&currentUrl.substring(0, 11).equals("/upload.jsp")){
        	Object upload =  res.getSession().getAttribute("upload");
        	if(!(Boolean)upload){
        		filter=true;
        		gotoUrl="/dashboard.jsp";
        	}
        }

        return filter;  

    }       

    public boolean isPermitUrl(ServletRequest request) { 


        boolean isPermit = false; 

        String currentUrl = currentUrl(request); 
        if(currentUrl.length()>=5&&currentUrl.substring(0, 4).equals("/js/")){
        	isPermit = true;
        }
        else if(currentUrl.length()>=7&&currentUrl.substring(0, 7).equals("/fonts/")){
        	isPermit = true;
        }
        else if(currentUrl.length()>=5&&currentUrl.substring(0, 5).equals("/css/")){
        	isPermit = true;
        }
        else if(currentUrl.length()>=8&&currentUrl.substring(0, 8).equals("/images/")){
        	isPermit = true;
        }
        else if (permitUrls != null && permitUrls.length > 0) { 

            for (int i = 0; i < permitUrls.length; i++) { 

                if (permitUrls[i].equals(currentUrl)) { 

                    isPermit = true; 

                    break; 

                } 

            } 

        } 

        return isPermit; 

    }        

    //请求地址 

    public String currentUrl(ServletRequest request) {   


        HttpServletRequest res = (HttpServletRequest) request; 

        String task = request.getParameter("task"); 

        String path = res.getContextPath(); 

        String uri = res.getRequestURI(); 

        if (task != null) {// uri格式 xx/ser 

            uri = uri.substring(path.length(), uri.length()) + "?" + "task="

                    + task; 

        } else { 

            uri = uri.substring(path.length(), uri.length()); 

        } 

        System.out.println("当前请求地址:" + uri); 

        return uri; 

    } 

    public void init(FilterConfig filterConfig) throws ServletException { 

        // TODO Auto-generated method stub 

        String permitUrls = filterConfig.getInitParameter("permitUrls"); 

        String gotoUrl = filterConfig.getInitParameter("gotoUrl"); 

  

        this.gotoUrl = gotoUrl; 

  

        if (permitUrls != null && permitUrls.length() > 0) { 

            this.permitUrls = permitUrls.split(","); 

        } 

    } 
}
