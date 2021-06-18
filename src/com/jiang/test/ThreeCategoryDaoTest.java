package com.jiang.test;

import com.jiang.dao.Impl.ProductCategoryImpl;
import com.jiang.dao.Impl.ThreeCategoryDaoImpl;
import com.jiang.dao.ProductCategoryDao;
import com.jiang.dao.ThreeCategoryDao;
import com.jiang.pojo.ProduceCategory;
import com.jiang.pojo.ThreeCategory;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @author jiangboss
 * @create 2021-05-28-22:24
 */
public class ThreeCategoryDaoTest {

ThreeCategoryDao threeCategoryDao=new ThreeCategoryDaoImpl();
ProductCategoryDao productCategoryDao=new ProductCategoryImpl();
    @Test
    public void getListThree() {
//        List<ThreeCategory> listThree = threeCategoryDao.getListThree();
//        listThree.forEach(System.out::println);
    }
    @Test
    public void test(){
//
        System.out.println(threeCategoryDao.queryForThreeCategory(733));
    }
}