package com.jiang.service.Impl;

import com.jiang.dao.Impl.ProductCategoryImpl;
import com.jiang.dao.Impl.ThreeCategoryDaoImpl;
import com.jiang.dao.ProductCategoryDao;
import com.jiang.dao.ThreeCategoryDao;
import com.jiang.pojo.*;
import com.jiang.service.ProductCategoryService;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-26-21:36
 */
public class ProductCategoryServiceImpl implements ProductCategoryService {
    ProductCategoryDao productCategoryDao=new ProductCategoryImpl();

    ThreeCategoryDao threeCategoryDao=new ThreeCategoryDaoImpl();

    /**
     * 添加产品分类
     * @param produceCategory
     */
    @Override
    public void addProductCategory(ProduceCategory produceCategory) {
        productCategoryDao.addCategory(produceCategory);
    }

    /**
     * 删除产品分类
     * @param id
     */
    @Override
    public void deleteCategoryById(Integer id) {
        productCategoryDao.deleteCategory(id);
    }

    /**
     * 更新产品分类
     * @param produceCategory
     */
    @Override
    public void updateCategory(ProduceCategory produceCategory) {
        productCategoryDao.updateCategory(produceCategory);

    }

    /**
     * 根据id查询一个分类
     * @param id
     * @return
     */
    @Override
    public ProduceCategory getCategoryById(Integer id) {
        return  productCategoryDao.queryForOneCategory(id);
    }

    /**
     * 查询全部分类
     * @return
     */
    @Override
    public List<ProduceCategory> getCategoryList() {
        return  productCategoryDao.queryForListCategory();
    }

    /**
     * 分页显示数据
     * @return
     */
    @Override
    public Page<ProduceCategory> getPageCategoryList(Integer pageNum,Integer pageSize) {
        Page<ProduceCategory> page = new Page<>();
        //设置每页最大显示数
        page.setPageSize(pageSize);
        //设置总的记录数
        Integer pageTotalCount = productCategoryDao.queryForCategoryCount();
        page.setPageTotalCount(pageTotalCount);
        //求总页码
        Integer pageTotal=pageTotalCount/Page.PAGE_SIZE;
        if (pageTotalCount % Page.PAGE_SIZE > 0) {
            pageTotal += 1;
        }
        //设置总页码
        page.setPageTotal(pageTotal);
        //给当前的页码赋值
        page.setPageNum(pageNum);
        //求出当前页面的索引
        int begin = (page.getPageNum() - 1) * pageSize;
        List<ProduceCategory> categoryList =productCategoryDao.queryForPage(begin,pageSize);
        //当前页面数据
        page.setItems(categoryList);
        //返回数据
        return page;
    }

    @Override
    public ThreeCategory findThreeCategory(Integer id) {
       return threeCategoryDao.queryForThreeCategory(id);

    }
    /**
     * 得到一级分类
     * @param i
     * @return
     */
    @Override
    public List<ProduceCategory> getCategoryByType(int i) {
               return productCategoryDao.queryForListCategoryByType(i);
    }

    /**
     * 根据一级分类的id得到二级分类的列表
     * @param categoryid
     * @param id
     * @return
     */
    public List<ProduceCategory> getCategoryByName(Integer categoryid,Integer id) {
        return productCategoryDao.queryForlistCategoryid2(categoryid,id);
    }

    @Override
    public List<CategoryTypeParent> findParentType() {
        return  productCategoryDao.queryForListCategoryParent();
    }

    /**
     * 通过二级分类的id查找一级分类的名称
     * @return
     */
    @Override
    public ProduceCategory findParentTypeBy2id(Integer id) {
        return productCategoryDao.queryOnecategoryBy2id(id);
    }

    /**
     * 根据分类级别查找树的节点
     * @param type
     * @return
     */
    @Override
    public List<TreeObject> findTree(Integer type) {
        return productCategoryDao.queryListForTree(type);
    }

}
