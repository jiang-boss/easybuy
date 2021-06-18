package com.jiang.filter;

import com.jiang.pojo.User;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @author 22498 jiangBoss
 * @create 2021-06-05
 * @time 19:49
 * 这里处理权限管理
 */
public class ManagerFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        Object login = httpServletRequest.getSession().getAttribute("login");
        System.out.println(login);
        System.out.println("进入了过滤器！");
        if (login == null) {
            httpServletRequest.getRequestDispatcher("/frontdesk/User/Login.jsp").forward(servletRequest, servletResponse);
        } else {
            filterChain.doFilter(servletRequest, servletResponse);//放行
        }
    }
    @Override
    public void destroy() {
    }
}
