package com.jiang.test;

import com.jiang.dao.Impl.ProductCategoryImpl;
import com.jiang.dao.ProductCategoryDao;
import com.jiang.pojo.ProduceCategory;
import com.jiang.pojo.TreeObject;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @author jiangboss
 * @create 2021-05-26-20:49
 */
public class ProductCategoryDaoTest {
    ProductCategoryDao productCategoryDao=new ProductCategoryImpl();
//    @Test
//    public void addCategory() {
//        int i = productCategoryDao.addCategory(new ProduceCategory(null, "风扇2", 678, 1, "wode"));
//        System.out.println(i);
//    }
//
//    @Test
//    public void deleteCategory() {
//        int i = productCategoryDao.deleteCategory(697);
//        System.out.println(i);
//    }
//
//    @Test
//    public void updateCategory() {
//        System.out.println(productCategoryDao.updateCategory(new ProduceCategory(697, "风扇1", 678, 1, "wode")));
//    }

    @Test
    public void queryForListCategory() {
        List<ProduceCategory> produceCategories = productCategoryDao.queryForListCategory();
        produceCategories.forEach(System.out::println);
    }

    @Test
    public void queryForOneCategory() {

        ProduceCategory produceCategory = productCategoryDao.queryForOneCategory(697);
        System.out.println(produceCategory);
    }
    @Test
    public  void queryForCount(){
        Integer integer = productCategoryDao.queryForCategoryCount();
        System.out.println(integer);
    }
    @Test
    public void queryFroCategoryPage(){
        List<ProduceCategory> categoryList = productCategoryDao.queryForPage(1, 5);
        categoryList.forEach(System.out::println);
    }

    @Test
    public void queryForCategory2(){
        System.out.println(productCategoryDao.queryForlistCategoryid2(628, 2));
    }
    /**
     * 测试子父类对应关系
     */
    @Test
    public  void test(){
        System.out.println(productCategoryDao.queryForListCategoryParent());
    }

    /**
     * 树节点
     */
    @Test
    public  void test2(){
        List<TreeObject> list = productCategoryDao.queryListForTree(1);
        System.out.println(list);
    }
    @Test
    public  void  test3(){
        ProduceCategory produceCategory = productCategoryDao.queryOnecategoryBy2id(671);
        System.out.println(produceCategory);
    }
}