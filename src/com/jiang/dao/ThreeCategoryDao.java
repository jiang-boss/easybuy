package com.jiang.dao;

import com.jiang.pojo.ThreeCategory;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-28-22:18
 */
public interface ThreeCategoryDao {
    ThreeCategory queryForThreeCategory(Integer id);
//    //获取三级分类的列表
//    public List<ThreeCategory> getListThree();
}
