package com.jiang.dao.Impl;

import com.jiang.dao.OrderDetailDao;
import com.jiang.pojo.OrderDetail;

/**
 * @author 22498 jiangBoss
 * @create 2021-06-05
 * @time 14:11
 */
public class OrderDetailDaoImpl extends BaseDao implements OrderDetailDao {
    /**
     * 处理订单项的添加
     * @param orderDetail
     */
    @Override
    public Integer saveDetail(OrderDetail orderDetail) {
        String sql="insert into easybuy_order_detail (`orderId`,`productId`,`quantity`,cost) value(?,?,?,?)";
        return update(sql,orderDetail.getOrderId(),orderDetail.getProductId(),orderDetail.getQuantity(),orderDetail.getCost());
    }
}
