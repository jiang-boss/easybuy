package com.jiang.service;

import com.jiang.pojo.*;
import com.jiang.pojo.pre.Cart;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-27-13:49
 */
public interface OrderService {


    List<Order> findOrderList();
    Page<Order>findPageOrder(int pageNum, int pageSize);
    List<OrderList> findOrders();

    Order creatOrder(Cart cart, User login,String address);
}
