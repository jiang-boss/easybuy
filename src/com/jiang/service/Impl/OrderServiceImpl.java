package com.jiang.service.Impl;

import com.jiang.dao.Impl.OrderDaoImpl;
//import com.jiang.dao.Impl.OrderListDaoImpl;
import com.jiang.dao.Impl.OrderDetailDaoImpl;
import com.jiang.dao.OrderDao;
import com.jiang.dao.OrderDetailDao;
import com.jiang.pojo.*;
import com.jiang.pojo.pre.Cart;
import com.jiang.pojo.pre.CartItem;
import com.jiang.service.OrderService;
import sun.util.resources.cldr.ebu.CurrencyNames_ebu;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author jiangboss
 * @create 2021-05-27-13:53
 */
public class OrderServiceImpl implements OrderService {
    OrderDao orderDao=new OrderDaoImpl();
    OrderDetailDao orderDetailDao=new OrderDetailDaoImpl();
//    OrderListDao orderListDao=new OrderListDaoImpl();


    /**
     * 查询全部订单
     * @return
     */
    @Override
    public List<Order> findOrderList() {
        return orderDao.getOrderList();
    }

    public List<OrderList> findOrders(){
        return orderDao.findOrders();
    }
    /**
     * 创建订单的操作
     * @param cart
     * @param login
     * @return
     */
    @Override
    public Order creatOrder(Cart cart, User login,String address) {
        //处理订单的操作
        Date date=new Date();
        long time = date.getTime();
        Timestamp timestamp=new Timestamp(time); //时间的转化
        String orderser=time+""+login.getId();//生成订单号  用时间戳和用户的ID 就变成唯一标识
        Order order =new Order(null,login.getId(),login.getLoginName(),address,timestamp,cart.getTotalPrice(),orderser);
          orderDao.savaOrder(order);//生成订单接下来把购物车中的产品生成订单项
        Order order1= null;
        for (Map.Entry<Integer, CartItem> cartItemEntry:cart.getCartItemMap().entrySet()){
            //遍历每个购物车的商品项  然后将商品项转换为订单项   订单id  商品ID  数量  消费
            CartItem cartItem = cartItemEntry.getValue();//得到每个商品项
            //这里订单的id 不会用
            //获得该订单的id 可以通过订单号找到订单然后获取主键id 给订单项用
            order1= orderDao.findOrdersByOrderNumber(orderser);
           orderDetailDao.saveDetail(new OrderDetail(null,order1.getId(),cartItem.getId(),cartItem.getCount(),cartItem.getTotalPrice()));
        }
        cart.clear();
         return order1;
    }
    @Override
    public Page<Order> findPageOrder(int pageNum, int pageSize) {
        Page<Order> page=new Page<>();
        //设置每页最大显示数
        page.setPageSize(pageSize);
        //总记录数and 设置
        Integer orderCount = orderDao.getOrderCount();
        page.setPageTotal(orderCount);
        //总页码  and设置
       Integer pageTotal =orderCount/Page.PAGE_SIZE;
       if(orderCount%Page.PAGE_SIZE>0){
           pageTotal+=1;
       }
       page.setPageTotal(pageTotal);

       page.setPageNum(pageNum);
       //取出索引
        int begin=(page.getPageNum()-1)*pageSize;
        List<Order> orderList=orderDao.getOrderPageList(begin,pageSize);
        page.setItems(orderList);
        return page;
    }
}
