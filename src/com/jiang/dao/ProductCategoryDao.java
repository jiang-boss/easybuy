package com.jiang.dao;

import com.jiang.pojo.*;
import sun.util.resources.cldr.si.LocaleNames_si;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-26-19:19
 */
public interface ProductCategoryDao {
    List<ProduceCategory> queryForPage(int begin, Integer pageSize);

    Integer queryForCategoryCount();

    public int addCategory(ProduceCategory produceCategory);
    public int deleteCategory(Integer id);
    public int updateCategory(ProduceCategory produceCategory);
    public List<ProduceCategory> queryForListCategory();


    public ProduceCategory queryForOneCategory(Integer id);

    List<ProduceCategory> queryForListCategoryByType(int i);


    List<ProduceCategory> queryForlistCategoryid2(Integer categoryid,Integer id);


    //查询子类父类的查询 处理分类显示的时候要父类的名称
    public List<CategoryTypeParent> queryForListCategoryParent();

    public List<TreeObject> queryListForTree(Integer type);
    //根据二级分类的查找一级的名称
    ProduceCategory queryOnecategoryBy2id(Integer id);
}
