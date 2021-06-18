package com.jiang.web;

import com.jiang.pojo.Page;
import com.jiang.pojo.User;
import com.jiang.service.Impl.UserServiceImpl;
import com.jiang.service.UserService;
import com.jiang.utils.webUtils;
import com.ndktools.javamd5.Mademd5;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
/**
 *管理员对用户的操作
 * @author jiangboss
 * @create 2021-05-26-11:14
 */
public class managerUserServlet extends BaseServlet {
    UserService userService=new UserServiceImpl();
    /**
     * 这里查找所有用户的的列表
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void userList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("请求进来了");
        List<User> userList = userService.findUserList();
        req.setAttribute("userlist", userList);
        req.getRequestDispatcher("/backend/user/userList.jsp").forward(req,resp);
    }

    /**
     * 做的是添加的操作
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void adduser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //得到用户分页的最后一页
        int pageNum = webUtils.parseInt(req.getParameter("pageNum"), 1);
        pageNum+=pageNum;
        //从页面获取需要增加的用户信息
        User user = webUtils.copyParamToBean(req.getParameterMap(), new User());
        userService.adduser(user);
        resp.sendRedirect(req.getContextPath()+"/manager/manageruserServlet?action=page&pageNum="+pageNum);
    }
    /**
     * 处理管理员的删除操作
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteuser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("请求过来了");
        int id = webUtils.parseInt(req.getParameter("id"), 1);
        userService.deleteUser(id);
        System.out.println("删除成功");
        resp.sendRedirect(req.getContextPath()+"/manager/manageruserServlet?action=page&pageNum="+req.getParameter("pageNum"));
    }
    /**
     * 得到用户的分页数据
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNum = webUtils.parseInt(req.getParameter("pageNum"), 1);
        int pageSize = webUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        Page<User> page = userService.findPage(pageNum, pageSize);
        req.setAttribute("pages", page);
        page.setUri("manager/manageruserServlet?action=page");
        //请求转发给全部用户列表界面
        req.getRequestDispatcher("/backend/user/userList.jsp").forward(req,resp);
    }
    /**
     * 修改用户信息
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void updateuser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("修改用户的信息请求过来了");
        Mademd5 mademd5=new Mademd5();
//        String username = req.getParameter("username");
////        System.out.println(username);
//        User user = userService.findUser(username);
        User user = webUtils.copyParamToBean(req.getParameterMap(), new User());
        String password = user.getPassword();
        String s = mademd5.toMd5(password);
        user.setPassword(s);
        userService.updateUser(user);
        resp.sendRedirect(req.getContextPath()+"/manager/manageruserServlet?action=page&pageNum="+req.getParameter("pageNum"));

    }
    /**
     * 得到要修改的用户信息回显给界面
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void finduser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        User user = userService.findUserByname(username);
        System.out.println(user);
        System.out.println("请求过来了");
        req.setAttribute("user",user);
        req.getRequestDispatcher("/backend/user/toUpdateUser.jsp").forward(req,resp);
    }

}
