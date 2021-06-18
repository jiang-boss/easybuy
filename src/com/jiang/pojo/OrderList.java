package com.jiang.pojo;

/**
 * @author jiangboss
 * @create 2021-05-27-16:56
 * 管理员的订单管理 显示订单项的信息
 */
public class OrderList {
  private Integer id;//订单号
  private String name;//产品名称
  private String fileName;//商品图片
  private Integer quantity;//数量
  private Integer cost;//消费

    public OrderList() {
    }

    public OrderList(Integer id, String name, String fileName, Integer quantity, Integer cost) {
        this.id = id;
        this.name = name;
        this.fileName = fileName;
        this.quantity = quantity;
        this.cost = cost;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getCost() {
        return cost;
    }

    public void setCost(Integer cost) {
        this.cost = cost;
    }

    @Override
    public String toString() {
        return "OrderList{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", fileName='" + fileName + '\'' +
                ", quantity=" + quantity +
                ", cost=" + cost +
                '}';
    }
}
