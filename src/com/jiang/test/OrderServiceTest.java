package com.jiang.test;

import com.jiang.pojo.Order;
import com.jiang.service.Impl.OrderServiceImpl;
import com.jiang.service.OrderService;
import org.junit.Test;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-27-13:58
 */
public class OrderServiceTest {
    OrderService orderService=new OrderServiceImpl();
    @Test
    public void test(){
        List<Order> orderList = orderService.findOrderList();
        orderList.forEach(System.out::println);
    }


}
