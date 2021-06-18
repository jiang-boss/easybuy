package com.jiang.dao;

import com.jiang.pojo.Page;
import com.jiang.pojo.Product;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-27-8:34
 */
public interface ProductDao {
    int addProduct(Product product);
    int deleteProduct(Integer id);
    int updateProduct(Product product);
    Product queryProductById(Integer id);
    Integer queryProductCount();
    List<Product> queryProductList();
    List<Product> queryForPageProduct(Integer begin,Integer pageSize);

    List<Product> queryForProductById3(Integer begin,Integer pageSize,Integer id);

    Integer queryProductCountById3(Integer id);
}
