package com.jiang.dao.Impl;

import com.jiang.dao.OrderDao;
import com.jiang.pojo.Order;
import com.jiang.pojo.OrderList;

import java.util.List;

/**
 *  private Integer id;//主键
 *     private Integer userId;//用户的主键  这里是外键
 *     private String loginName;//用户的登录名
 *     private String userAddress;//用户的地址
 *     private Date createTime;//创建时间
 *     private Float cost;//总消费
 *     private String serialNumber;//订单号
 * @author jiangboss
 * @create 2021-05-27-13:35
 */
public class OrderDaoImpl extends BaseDao implements OrderDao {
    /**
     * 存储订单
     * @param order
     * @return
     */
    @Override
    public int savaOrder(Order order) {
        String sql="insert into easybuy_order (`userId`,`loginName`,`userAddress`,`createTime`,`cost`,`serialNumber`) values(?,?,?,?,?,?)";
         return  update(sql,order.getUserId(),order.getLoginName(),order.getUserAddress(),order.getCreateTime(),order.getCost(),order.getSerialNumber());
    }

    /**
     * 生成订单全部信息
     * @return
     */
    @Override
    public List<Order> getOrderList() {
        String sql ="select `id`,`userId`,`loginName`,`userAddress`,`createTime`,`cost`,`serialNumber` from easybuy_order";
        return qureyForList(Order.class, sql);
    }

    /**
     * 订单的总数
     * @return
     */
    @Override
    public Integer getOrderCount() {
        String sql ="select count(*) from easybuy_order";
      Number number =(Number) queryForSingleValue(sql);
      return number.intValue();
    }
    /**
     * 分页查询
     * @param begin
     * @param pageSize
     * @return
     */
    @Override
    public List<Order> getOrderPageList(int begin, int pageSize) {
        String sql ="select `id`,`userId`,`loginName`,`userAddress`,`createTime`,`cost`,`serialNumber` from easybuy_order limit ?,?";
       return qureyForList(Order.class, sql, begin, pageSize);
    }
    @Override
    public List<OrderList> findOrders() {
        String sql="SELECT eo.id,ep.name,ep.fileName,ed.quantity,ed.cost from easybuy_order eo,easybuy_order_detail ed,easybuy_product ep " +
                " where eo.id=ed.orderId AND ed.productId = ep.id";
        return qureyForList(OrderList.class, sql);
    }

    /**
     * 通过订单的订单号找到订单的Id
     * @param orderser
     * @return
     */
    @Override
    public Order findOrdersByOrderNumber(String orderser) {
        String sql="select `id`,`userId`,`loginName`,`userAddress`,`createTime`,`cost`,`serialNumber` from easybuy_order where `serialNumber`=? ";
         return  queryForOne(Order.class,sql,orderser);
    }
}
