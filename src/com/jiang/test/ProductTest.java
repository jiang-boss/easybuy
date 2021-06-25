package com.jiang.test;

import com.jiang.dao.Impl.ProductDaoImpl;
import com.jiang.dao.ProductDao;
import com.jiang.pojo.Product;
import org.junit.Test;
import org.junit.experimental.theories.suppliers.TestedOn;

import java.util.List;

/**
 *  private Integer id;//主键
 *     private String name;//名称
 *     private String description;//描述
 *     private Float price;//价格
 *     private Integer stock;//库存
 *     private Integer categoryLevel1Id;//分类1
 *     private Integer categoryLevel2Id;//分类2
 *     private Integer categoryLevel3Id;//分类3
 *     private String fileName;//文件名称
 *     private Integer isDelete;//是否删除  0 删除 1 未删除
 *
 * @author jiangboss
 * @create 2021-05-27-9:12
 */
public class ProductTest {
  ProductDao productdao=new ProductDaoImpl();
@Test
public void add() {
    for (int i=4;i<20;i++){

        productdao.addProduct(new Product(null,"iphone11","苹果手机"+i,323.3f,234,454,545,545,"erewrrew",1));
    }

}

@Test
public void delete() {

}

@Test
public void update() {
    System.out.println(productdao.updateProduct(new Product(772, "iphone11plus", "苹果手机", 323.3f, 234,
            454, 545, 545, "erewrrew", 1)));
}

@Test
public void queryForList() {
    List<Product> products = productdao.queryProductList();

    products.forEach(System.out::println);
}


@Test
public void queryForOne() {
    Product product = productdao.queryProductById(772);
    System.out.println(product);
}

@Test
public  void queryForCount(){

    System.out.println(productdao.queryProductCount());
}
@Test
public void queryFroPage() {
    List<Product> products = productdao.queryForPageProduct(1, 4);
    products.forEach(System.out::println);
}

    @Test
    public void queryFroPageClient() {
        List<Product> products = productdao.queryForProductById3(1,4,655);
        products.forEach(System.out::println);
    }
    @Test
    public void  test6(){
        System.out.println(productdao.queryProductCountById3Like("%香%"));
    }

    @Test
    public void  test36(){
        System.out.println(productdao.queryForProductById3Like(1,4,"%香%"));
    }
}
