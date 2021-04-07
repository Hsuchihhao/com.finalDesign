package com.finalDesign.config;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session=request.getSession();
        if(request.getRequestURI().contains("toLogin")){
            return true;
        }
        if(request.getRequestURI().contains("login")){
            return true;
        }
        if(session.getAttribute("userLoginInfo")!=null){
            return true;
        }

        if(session.getAttribute("userLoginInfo")==null){
                                            //web/WEB-INF/jsp/login.jsp
          request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
            return  false;
        }
        return true;
    }
}
