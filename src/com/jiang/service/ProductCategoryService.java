package com.jiang.service;

import com.jiang.pojo.*;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-26-21:05
 */
public interface ProductCategoryService {

    public void addProductCategory(ProduceCategory produceCategory);
    public void deleteCategoryById(Integer id);
    public void updateCategory(ProduceCategory produceCategory);
    public ProduceCategory getCategoryById(Integer id);
    public List<ProduceCategory> getCategoryList();
    Page<ProduceCategory> getPageCategoryList(Integer pageNum,Integer pageSize);

     ThreeCategory findThreeCategory(Integer id);//根据id查找商品的三级分类

     //得到一级分类
    List<ProduceCategory> getCategoryByType(int i);

    List<ProduceCategory> getCategoryByName(Integer categoryid,Integer id);

    //得到子父类商品的对应关系 完善分类列表的父亲名称
    List<CategoryTypeParent> findParentType();

    ProduceCategory findParentTypeBy2id(Integer id );
    //根据分类的级别查找 数的节点元素
    List<TreeObject> findTree(Integer type);
}
