package com.jiang.web.pre;

import com.jiang.pojo.Order;
import com.jiang.pojo.User;
import com.jiang.pojo.pre.Cart;
import com.jiang.service.Impl.OrderServiceImpl;
import com.jiang.service.OrderService;
import com.jiang.web.BaseServlet;
import sun.util.resources.cldr.ebu.CalendarData_ebu_KE;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * @author 22498 jiangBoss
 * @create 2021-06-05
 * @time 10:42
 * 处理用户生成订单的操作
 */
public class ClientOrderServlet extends BaseServlet {
    OrderService orderService=new OrderServiceImpl();
    /**
     * 生成订单的操作
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void createOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //处理生成订单
        System.out.println("生成订单的 请求过来了");
        //要获取session中的cart购物车和login用户名的对象
        String address = req.getParameter("address");//获取订单的地址
        Cart cart =(Cart) req.getSession().getAttribute("cart");
//        System.out.println(cart);
        User login = (User) req.getSession().getAttribute("login");
        //处理订单的的业务
        Order order=orderService.creatOrder(cart,login,address);
        System.out.println("订单生成完成！");
        req.setAttribute("orderInfo",order);
        req.getRequestDispatcher("/frontdesk/buycar/BuyCar_Three.jsp").forward(req,resp);
    }
}
