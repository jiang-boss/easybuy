package com.jiang.test;

import com.jiang.dao.Impl.OrderDaoImpl;
//import com.jiang.dao.Impl.OrderListDaoImpl;
import com.jiang.dao.OrderDao;
import com.jiang.pojo.OrderList;
import org.junit.Test;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-27-14:35
 */
public class OrderDaoTest {
    OrderDao orderDao=new OrderDaoImpl();
//    OrderListDao orderListDao=new OrderListDaoImpl();
    @Test
    public void test(){
        List<OrderList> orders = orderDao.findOrders();
        orders.forEach(System.out::println);
    }

}
