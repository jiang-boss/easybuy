package com.jiang.web;

import com.google.gson.Gson;
import com.jiang.pojo.User;
import com.jiang.pojo.UserAddress;
import com.jiang.pojo.pre.Address;
import com.jiang.pojo.pre.Cart;
import com.jiang.service.Impl.UserAddressServiceImpl;
import com.jiang.service.Impl.UserServiceImpl;
import com.jiang.service.UserAddressService;
import com.jiang.service.UserService;
import com.jiang.utils.webUtils;
import com.ndktools.javamd5.Mademd5;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

/**
 * @author jiangboss
 * @create 2021-05-17-10:10
 */
public class userServlet extends BaseServlet{

    UserService userService=new UserServiceImpl();
    UserAddressService userAddressService=new UserAddressServiceImpl();

    /**
     * 处理注册的功能
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Mademd5 mademd5=new Mademd5();
        //获取验证码
        String token = (String) req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);
        //处理注册的功能 获取请求参数
        String username = req.getParameter("userName");//真实姓名
        String loginName = req.getParameter("loginName");
//        String pwd = req.getParameter("pwd");
//        String rpwd = req.getParameter("rpwd");
        String email = req.getParameter("email");
        String tel = req.getParameter("mobile");
        String code=req.getParameter("code");
//       System.out.println(user+pwd+rpwd+email+tel);
       //判断是否可以注册 根据验证码判断
        Map<String, String[]> parameterMap = req.getParameterMap();
        User user = webUtils.copyParamToBean(parameterMap, new User());
        System.out.println(user);
        if(token!=null&&token.equalsIgnoreCase(code)){
            if(userService.exitUsername(username)){
                req.setAttribute("msg","用户名"+username+"已存在！");
                req.setAttribute("user",username);
                //有请求转发
                req.getRequestDispatcher("/frontdesk/User/Regist.jsp").forward(req,resp);
            }else {
                System.out.println("用户名可用！");
                String password = user.getPassword();
                String s = mademd5.toMd5(password);
                user.setPassword(s);
                userService.regist(user);
                req.getRequestDispatcher("/index.jsp").forward(req,resp);
            }
        }else {
            System.out.println("验证码错误");
            req.setAttribute("msg","验证码错误！");
            req.setAttribute("user",username);
            req.setAttribute("email",email);
            req.setAttribute("tel",tel);
            req.setAttribute("loginName",loginName);
            req.getRequestDispatcher("/frontdesk/User/Regist.jsp").forward(req,resp);
        }
    }
    /**
     * 这里处理用户登录的功能
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void login(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
//        System.out.println("请求过来了");
        Mademd5 mademd5=new Mademd5();
        String loginname = req.getParameter("loginname");
        String password = req.getParameter("password");
        String pwd = mademd5.toMd5(password);
        System.out.println(pwd);
        User login = userService.login(loginname,pwd);
        System.out.println(login);
        if(login!=null){
            //处理登录成功
            Integer type=login.getType();
            System.out.println("登录成功");
            //将登录的用户放到session中
            req.getSession().setAttribute("login",login);
            //登录成功就把 该用户的所有地址都存放到Session中
            List<UserAddress> addressList = userAddressService.getAddressList(login.getId());
            req.getSession().setAttribute("addressList",addressList);
            if(type==1){
                //管理员
                Cart cart=new Cart();
                req.getSession().setAttribute("cart",cart);
                req.getRequestDispatcher("/backend/user/userInfo.jsp").forward(req,resp);
            }else {

                Cart cart=new Cart();
                req.getSession().setAttribute("cart",cart);
                req.getRequestDispatcher("index.jsp").forward(req,resp);
            }

        }
        else {
            System.out.println("登陆失败");
            req.setAttribute("errmsg","用户名或密码错误");
            req.setAttribute("loginname",loginname);
            req.getRequestDispatcher("/frontdesk/User/Login.jsp").forward(req,resp);
        }
    }
    /**
     * 处理注册界面处理ajax请求
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void ajaxExitUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         System.out.println("请求过来了");
         String username = req.getParameter("username");
            boolean b=((username == "")||userService.exitUsername(username));
            Map<String,Object> resMap=new HashMap<>();
            resMap.put("exitname",b);
            Gson gson = new Gson();
            String s = gson.toJson(resMap);
            resp.getWriter().write(s);
    }
    /**
     * 判断密码的ajax请求正则表达式
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void ajaxExitPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String,Object> resMap=new HashMap<>();
        System.out.println("请求过来了");
        String password= req.getParameter("pws");
        String regex="^(?:\\d+|[a-zA-Z]+|[!@#$%^&*]+)$";
        boolean matches =(password ==""||password.matches(regex));
        resMap.put("exitpwd",matches);
        Gson gson = new Gson();
        String s = gson.toJson(resMap);
        resp.getWriter().write(s);
    }
    /**
     * 判断两次的密码是否一致
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void ajaxExitRpassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("请求过来了");
        String password = req.getParameter("pws");
        String rpws = req.getParameter("rpws");
        boolean b = password.equals(rpws);
        Map<String, Object> resMap = new HashMap<>();
        resMap.put("exitrpwd", b);
        Gson gson = new Gson();
        String s = gson.toJson(resMap);
        resp.getWriter().write(s);
    }

    /**
     *处理退出登录的操作
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void logOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("退出登录的操作过来了");
        req.getSession().invalidate();//删除session
        resp.sendRedirect(req.getContextPath());
    }
}
