package com.jiang.pojo;

/**
 * 订单项
 * @author jiangboss
 * @create 2021-05-24-10:30
 * 订单id  商品ID  数量  消费
 */
public class OrderDetail {
    private Integer id;
    private Integer orderId;//订单主键 外键关联
    private Integer productId;//商品主键id
    private Integer quantity;//数量
    private Float cost;//消费

    public OrderDetail() {
    }

    public OrderDetail(Integer id, Integer orderId, Integer productId, Integer quantity, Float cost) {
        this.id = id;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.cost = cost;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Float getCost() {
        return cost;
    }

    public void setCost(Float cost) {
        this.cost = cost;
    }
    @Override
    public String toString() {
        return "OrderDetail{" +
                "id=" + id +
                ", orderId=" + orderId +
                ", productId=" + productId +
                ", quantity=" + quantity +
                ", cost=" + cost +
                '}';
    }
}
