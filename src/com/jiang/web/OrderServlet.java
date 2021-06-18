package com.jiang.web;

import com.jiang.pojo.*;
import com.jiang.service.Impl.OrderServiceImpl;
import com.jiang.service.OrderService;
import com.jiang.utils.webUtils;
import org.junit.Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-27-14:52
 */
public class OrderServlet extends BaseServlet{
    OrderService orderService=new OrderServiceImpl();
    /**
     * 订单的分页显示
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("请求过来了");
        int pageNum = webUtils.parseInt(req.getParameter("pageNum"), 1);
        int pageSize = webUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        Page<Order> pageOrder = orderService.findPageOrder(pageNum, pageSize);
        //这里获得全部的订单信息列表
        List<OrderList> orders = orderService.findOrders();
        req.setAttribute("orders",orders);
        req.setAttribute("pages",pageOrder);
        pageOrder.setUri("manager/orderServlet?action=page");
        req.getRequestDispatcher("/backend/order/orderList.jsp").forward(req,resp);
    }
    /**
     * 查看详细订单 将详细订单
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void orderDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<OrderList> orders = orderService.findOrders();
        req.setAttribute("id",req.getParameter("id"));
//        System.out.println(req.getParameter("id"));
        req.setAttribute("detail",orders);
        req.getRequestDispatcher("/backend/order/orderDetailList.jsp").forward(req,resp);
    }
//    @Test
//    public void cehng(){
//        for (int i=1;i<=9;i++){
//            for (int j=1;j<=i;j++){
//                System.out.print(j+"X"+i+"="+i*j+" ");
//            }
//            System.out.println();
//        }
//    }
}
