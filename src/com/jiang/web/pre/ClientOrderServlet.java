package com.jiang.web.pre;

import com.jiang.pojo.Order;
import com.jiang.pojo.User;
import com.jiang.pojo.pre.Cart;
import com.jiang.pojo.pre.CartItem;
import com.jiang.service.Impl.OrderServiceImpl;
import com.jiang.service.OrderService;
import com.jiang.utils.webUtils;
import com.jiang.web.BaseServlet;
import sun.util.resources.cldr.ebu.CalendarData_ebu_KE;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        String address = req.getParameter("address");//获取订单的地址
        User login = (User) req.getSession().getAttribute("login");
        //要获取session中的cart购物车和login用户名的对象
        Cart cart =(Cart) req.getSession().getAttribute("cart");
        Cart cart1=new Cart();
        Map<Integer,CartItem> listCart=new HashMap<>(cart.getCartItemMap());
        cart1.setCartItemMap(listCart);
//        System.out.println(cart1);
        //得到要购买的商品的id集合
        Order order=null;
        String productIds =(String) req.getSession().getAttribute("productIds");
        String[] split = productIds.split(",");//得到要购买哪些哪些商品
        System.out.println(productIds);
        //未购买商品的id
        String productsIdNotCheck =(String) req.getSession().getAttribute("productsIdNotCheck");
        String[] split1 = productsIdNotCheck.split(",");
        System.out.println(productsIdNotCheck);
        if (productsIdNotCheck==""){
           order=orderService.creatOrder(cart1,login,address);
        }else {
            for (String id:split1){
                //剩下购买的
                cart1.getCartItemMap().remove(Integer.parseInt(id));
            }
            order=orderService.creatOrder(cart1,login,address);
        }
        for (String id:split){
            //剩下未购买的
            cart.getCartItemMap().remove(Integer.parseInt(id));
        }
        System.out.println(cart);

//        //处理订单的的业务
//        Order order=orderService.creatOrder(cart,login,address);
        System.out.println("订单生成完成！");
        req.getSession().setAttribute("orderInfo",order);
        resp.sendRedirect(req.getContextPath()+"/frontdesk/buycar/BuyCar_Three.jsp");
//        req.getRequestDispatcher("/frontdesk/buycar/BuyCar_Three.jsp").forward(req,resp);
    }

    /**
     * 批量处理
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void createOrderBach(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //处理生成订单
        System.out.println("批量生成订单的 请求过来了");
        String productIds = req.getParameter("productIds");
        req.getSession().setAttribute("productIds",req.getParameter("productIds"));
        req.getSession().setAttribute("productsIdNotCheck",req.getParameter("productsIdNotCheck"));
        //得到所选购物的商品id
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        Map<Integer,CartItem> proList=new HashMap<>();

        String[] split = productIds.split(",");
        for (String id:split){
            //将选择的商品封装成集合
            CartItem cartItem=cart.getCartItemMap().get(Integer.parseInt(id));
            if (cartItem==null){
                resp.sendRedirect(req.getContextPath()+"/frontdesk/buycar/BuyCar_Three.jsp");
//                req.getRequestDispatcher("/frontdesk/buycar/BuyCar_three.jsp").forward(req,resp);
            }else {
                proList.put(Integer.parseInt(id),cartItem);
            }
        }
        req.getSession().setAttribute("proChecks",proList);
        int totalPrice=0;
        int totalcount=0;
        for (Map.Entry<Integer,CartItem> entry:proList.entrySet()){
            totalPrice+=entry.getValue().getTotalPrice();
        }
        for (Map.Entry<Integer,CartItem>entry:proList.entrySet()){
            totalcount+=entry.getValue().getCount();
        }
        req.getSession().setAttribute("totalPriceCheck",totalPrice);
        req.getSession().setAttribute("totalCountCheck",totalcount);
        req.getRequestDispatcher("/frontdesk/buycar/BuyCar_Two.jsp").forward(req,resp);
    }
    /**
     * 查找订单的操作
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void findMyOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("查找订单的操作过来！");
        //根据用户的id查找订单的集合
        int userId = webUtils.parseInt(req.getParameter("userId"), 0);
        List<Order>orderList=orderService.findOrdersByUserId(userId);
        req.setAttribute("orderList",orderList);
        req.getRequestDispatcher("/frontdesk/Member/Member_Order.jsp").forward(req,resp);
    }

}
