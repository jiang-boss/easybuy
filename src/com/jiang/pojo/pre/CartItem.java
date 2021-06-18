package com.jiang.pojo.pre;

/**
 * @author jiangboss
 * @create 2021-06-02-16:24
 * 购物车的商品项  要包含（商品id  商品名称 商品的单价  商品总价 商品数量  ）
 */
public class CartItem {
    private String fileName;
    private Integer id; //商品id
    private  String name;
    private  Float price; //商品单价
    private  Float totalPrice; //商品项的总价
    private  Integer count;

    public CartItem() {
    }

    public CartItem(String fileName, Integer id, String name, Float price, Float totalPrice, Integer count) {
        this.fileName = fileName;
        this.id = id;
        this.name = name;
        this.price = price;
        this.totalPrice = totalPrice;
        this.count = count;
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

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "fileName='" + fileName + '\'' +
                ", id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", totalPrice=" + totalPrice +
                ", count=" + count +
                '}';
    }
}
