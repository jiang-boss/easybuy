package com.jiang.service;

import com.jiang.pojo.*;

import java.util.List;
import java.util.Map;

/**
 * @author jiangboss
 * @create 2021-05-27-9:35
 */
public interface ProductService {
    void addProduct(Product product);
    void  deleteProductById(Integer id);
    void updateProduct(Product product);
    Product findProductById(Integer id);
    List<Product> findProductList();

   Page<Product> findProductPage(int pageNum, int pageSize);

    Page<Product> findProductPageByLevel3Id(int pageNum,int pageSize,int id);

    Page<Product> findProductPageByLike(int pageNum, int pageSize, String likePro);
//    Map<Integer,List<Product>> findProductFloor();
}
