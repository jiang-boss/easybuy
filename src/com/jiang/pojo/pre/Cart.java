package com.jiang.pojo.pre;

import java.util.*;

/**
 * @author jiangboss
 * @create 2021-06-02-16:24
 * 购物车的模型 加入购物车  删除购物车 修改购物车 清空购物车（购买所有商品）
 */
public class Cart {
    private Map<Integer,CartItem> cartItemMap=new LinkedHashMap<>();
    public Integer getSpecies(){
        Integer species=0;
        species=cartItemMap.size();
        return species;
    }
    /**
     * 得到购物车的总数量
     * @return
     */
    public Integer getCount(){
        Integer count=0;
        for (Map.Entry<Integer,CartItem> entry:cartItemMap.entrySet()){

            count+=entry.getValue().getCount();//得到购物车的总数量
        }
        return count;
    }
    /**
     * 得到总金额
     * @return
     */
    public Float getTotalPrice(){
        Float totalPrice=0f;
        for (Map.Entry<Integer,CartItem> entry:cartItemMap.entrySet()){
            //遍历每一个商品项
            totalPrice+=entry.getValue().getTotalPrice();
        }
        return totalPrice;
    }

    public Map<Integer, CartItem> getCartItemMap() {
        return cartItemMap;
    }

    public void setCartItemMap(Map<Integer, CartItem> cartItemMap) {
        this.cartItemMap = cartItemMap;
    }


    /************************************核心部分*************************************/
    /**
     * 添加商品项
     * @param cartItem  商品项
     */
    public void addProduct(CartItem cartItem){
        //判断购物车中有没有此商品
        CartItem item=cartItemMap.get(cartItem.getId());
        if (item==null){
            //如果通过商品的id没有找到 则购物车没有此商品 添加到购物车
            cartItemMap.put(cartItem.getId(),cartItem);
        }else {
            //有此商品 每次添加一件商品
            item.setCount(item.getCount()+cartItem.getCount());
            item.setTotalPrice(item.getPrice()* item.getCount());
        }
    }
    /**
     * 处理增加多个商品
     * @param cartItem
     * @param num
     */
    public void  addProducts(CartItem cartItem,Integer num){
        CartItem  item=cartItemMap.get(cartItem.getId());
        if (item==null){//没有商品先添加一个再修改
            cartItemMap.put(cartItem.getId(),cartItem);
            updateCount(cartItem.getId(),num);
        }else {
            //如果有此商品  在原有的商品数量的基础上增加num
            updateCount(cartItem.getId(),item.getCount()+num);
        }
    }

    /**
     * 清空购物车
     */
    public void clear(){
        cartItemMap.clear();
    }

    /**
     * 删除购物车中的 商品项
     * @param id
     */
    public void deleteCart(Integer id){
        //先得到商品项
        cartItemMap.remove(id);
    }

    /**
     * 修改商品的数量
     * @param id 商品的id
     * @param count  修改到什么数量
     */
    public void updateCount(Integer id,Integer count){
        CartItem item = cartItemMap.get(id);
        if(item!=null){//判断购物车是否有这个商品 修改价格
            if (count==0){
                cartItemMap.remove(id);
            }
            else {
                item.setCount(count);
                item.setTotalPrice(item.getPrice()*count);
            }
        }
    }


    @Override
    public String toString() {
        return "Cart{" +
                "cartItemMap=" + cartItemMap +
                '}';
    }
}
