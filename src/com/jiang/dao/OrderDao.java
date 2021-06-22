package com.jiang.dao;

import com.jiang.pojo.Order;
import com.jiang.pojo.OrderList;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-27-13:35
 */
public interface OrderDao {
    public int savaOrder(Order order);

    List<Order> getOrderList();

    Integer getOrderCount();

    List<Order> getOrderPageList(int begin, int pageSize);


    List<OrderList> findOrders();
    //通过订单号找到该订单的主键
    Order findOrdersByOrderNumber(String orderser);

    List<Order> finOrdersById(int userId);
}
