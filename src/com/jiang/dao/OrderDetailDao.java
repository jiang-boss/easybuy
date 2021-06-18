package com.jiang.dao;

import com.jiang.pojo.OrderDetail;

/**
 * @author 22498 jiangBoss
 * @create 2021-06-05
 * @time 14:09
 * //订单项的添加
 */
public interface OrderDetailDao {
    public Integer saveDetail(OrderDetail orderDetail);
}
