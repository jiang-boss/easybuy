package com.jiang.test;

import com.jiang.dao.Impl.OrderDetailDaoImpl;
import com.jiang.dao.OrderDetailDao;
import com.jiang.pojo.OrderDetail;
import org.junit.Test;

/**
 * @author 22498 jiangBoss
 * @create 2021-06-05
 * @time 14:27
 */
public class OrderDetailTest {
    OrderDetailDao orderDetailDao =new OrderDetailDaoImpl();
    @Test
    public  void savaDetail(){
        orderDetailDao.saveDetail(new OrderDetail(null,19,3,7898,789343f));
    }
}
