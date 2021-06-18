package com.jiang.dao.Impl;

import com.jiang.dao.ProductCategoryDao;
import com.jiang.pojo.*;
import com.mysql.cj.util.DnsSrv;
import sun.security.krb5.internal.tools.Klist;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-26-19:25
 */
public class ProductCategoryImpl extends BaseDao implements ProductCategoryDao {
    /**
     * 分页查询
     * @param begin
     * @param pageSize
     * @return
     */
    @Override
    public List<ProduceCategory> queryForPage(int begin, Integer pageSize) {
       String sql="select `id`,`name`,`parentId`,`type`,`iconclass` from easybuy_product_category limit ?,?";
       return  qureyForList(ProduceCategory.class,sql,begin,pageSize);
    }

    /**
     * 查找那个商品分类的总数
     * @return
     */
    @Override
    public Integer queryForCategoryCount() {
        String sql="select count(*) from easybuy_product_category ";
        Number number=(Number) queryForSingleValue(sql);
        return number.intValue();
    }

    /**
     * 添加分类
     * @param produceCategory
     */
    @Override
    public int addCategory(ProduceCategory produceCategory) {
        String sql="insert into easybuy_product_category (`name`,`parentId`,`type`,`iconClass`) values(?,?,?,?)";
         return update(sql,produceCategory.getName(),produceCategory.getParentId(),produceCategory.getType(),
                produceCategory.getIconClass());
    }

    /**
     * 删除分类
     * @param id
     */
    @Override
    public int deleteCategory(Integer id) {
        String sql="delete from easybuy_product_category where id=?";
        return  update(sql,id);
    }
    /**
     * 修改分类
     * @param produceCategory
     */
    @Override
    public int updateCategory(ProduceCategory produceCategory) {
        String sql="update easybuy_product_category set `name`=?,`parentId`=?,`type`=?,`iconClass`=? where id=?";
        return  update(sql,produceCategory.getName(),produceCategory.getParentId(),produceCategory.getType(),
                produceCategory.getIconClass(),produceCategory.getId());
    }
    /**
     * 查找分类的集合
     * @return
     */
    @Override
    public List<ProduceCategory> queryForListCategory() {
        String sql="select `id`,`name`,`parentId`,`type`,`iconclass` from easybuy_product_category";
        return qureyForList(ProduceCategory.class, sql);
    }
    /**
     * 根据id查找分类
     * @param id
     * @return
     */
    @Override
    public ProduceCategory queryForOneCategory(Integer id) {
        String sql="select `id`,`name`,`parentId`,`type`,`iconclass` from easybuy_product_category where id=?";
         return  queryForOne(ProduceCategory.class,sql,id);
    }
    /**
     * 根据等级查找分类
     * @param i
     * @return
     */
    @Override
    public List<ProduceCategory> queryForListCategoryByType(int i) {
        String sql="select `id`,`name`,`parentId`,`type`,`iconclass` from easybuy_product_category where type=?";
        return qureyForList(ProduceCategory.class, sql,i);
    }
    /**
     * 传入父类的id和子类的 分类的等级查出子分类的全部集合
     * @param categoryid 父类的id
     * @param id 分类级别
     * @return
     */
    @Override
    public List<ProduceCategory>  queryForlistCategoryid2(Integer categoryid,Integer id) {
        String sql="SELECT DISTINCT  ec2.id as `id`,ec2.name as `name`,ec2.parentId as `parentId`,ec2.type as `type`,ec2.iconClass as `iconClass`" +
                "from easybuy_product_category as ec1,easybuy_product_category as ec2 WHERE " +
                "ec2.parentId=? and ec2.type=?";
        return qureyForList(ProduceCategory.class,sql,categoryid,id);
    }

    public List<CategoryTypeParent> queryForListCategoryParent(){
        String sql="SELECT ec1.id as id,ec1.name as name,ec2.name as parentName,ec2.id as parentId,ec2.parentId as parentIdPro from\teasybuy_product_category as ec1,easybuy_product_category as ec2 WHERE ec1.parentId=ec2.id";
        return qureyForList(CategoryTypeParent.class, sql);
    }

    /**
     * 查询树的节点
     * @return
     */
    @Override
    public List<TreeObject> queryListForTree(Integer type) {
        String sql="select `id`,`name`,`parentId` from easybuy_product_category where type=?";
      return qureyForList(TreeObject.class, sql, type);
    }

    /**
     * 根据下一级商品的id 查找父类分类的信息
     * @param id  id是二级分类和三级分类的id
     * @return  返回值是上一级的目录
     */
    @Override
    public ProduceCategory queryOnecategoryBy2id(Integer id) {
        String sql="SELECT ec2.id as id,ec2.name as name, ec2.type as type,ec2.parentId as parentId,ec2.iconClass as iconClass FROM easybuy_product_category as ec1,easybuy_product_category as ec2  WHERE ec1.parentId=ec2.id and  ec1.id=?";
        return queryForOne(ProduceCategory.class, sql, id);
    }

}
