package com.jiang.dao.Impl;

import com.jiang.dao.ProductDao;
import com.jiang.pojo.Page;
import com.jiang.pojo.Product;
import com.mysql.cj.protocol.a.MysqlBinaryValueDecoder;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-27-8:46
 */
public class ProductDaoImpl extends BaseDao implements ProductDao {
    @Override
    public int addProduct(Product product) {
        String sql="insert into easybuy_product " +
                "(`name`,`description`,`price`,`stock`,`categoryLevel1Id`,`categoryLevel2Id`,`categoryLevel3Id`,`fileName`,`isDelete`)" +
                "values(?,?,?,?,?,?,?,?,?)";
        return  update(sql,product.getName(),product.getDescription(),product.getPrice(),product.getStock(),product.getCategoryLevel1Id(),
                product.getCategoryLevel2Id(),product.getCategoryLevel3Id(),product.getFileName(),product.getIsDelete());
    }
    @Override
    public int deleteProduct(Integer id) {
        String sql="delete from easybuy_product where id=?";
        return update(sql, id);
    }

    @Override
    public int updateProduct(Product product) {
        String sql="update easybuy_product set `name`=?,`description`=?,`price`=?,`stock`=?,`categoryLevel1Id`=?,`categoryLevel2Id`=?,`categoryLevel3Id`=?,`fileName`=?,`isDelete`=?" +
                " where `id`=?";
        return update(sql, product.getName(), product.getDescription(), product.getPrice(), product.getStock(), product.getCategoryLevel1Id(),
                product.getCategoryLevel2Id(), product.getCategoryLevel3Id(), product.getFileName(), product.getIsDelete(), product.getId());
    }

    /**
     * 通过id查找商品
     * @param id
     * @return
     */
    @Override
    public Product queryProductById(Integer id) {
        String sql="select `id`,`name`,`description`,`price`,`stock`,`categoryLevel1Id`,`categoryLevel2Id`,`categoryLevel3Id`,`fileName`,`isDelete`" +
                "from easybuy_product where id=?";
        return queryForOne(Product.class, sql, id);
    }
    /**
     *
     * @return 返回所有商品的数量
     */
    @Override
    public Integer queryProductCount() {
        String sql="select count(*) from easybuy_product";
        Number number=(Number)queryForSingleValue(sql);
        return number.intValue();
    }
    @Override
    public List<Product> queryProductList() {
        String sql="select `id`,`name`,`description`,`price`,`stock`,`categoryLevel1Id`,`categoryLevel2Id`,`categoryLevel3Id`,`fileName`,`isDelete` " +
                "from easybuy_product";
        return qureyForList(Product.class, sql);
    }
    /**
     * 分页查询
     * @param begin 从哪里开始
     * @param pageSize 每页显示的数量
     * @return
     */
    @Override
    public List<Product> queryForPageProduct(Integer begin, Integer pageSize) {
        String sql="select `id`,`name`,`description`,`price`,`stock`,`categoryLevel1Id`,`categoryLevel2Id`,`categoryLevel3Id`,`fileName`,`isDelete` from easybuy_product limit ?,?";
        return qureyForList(Product.class, sql, begin, pageSize);
    }
    /**
     * 根据三级id查找商品的集合
     * @param id
     * @return
     */
    @Override
    public List<Product> queryForProductById3(Integer begin,Integer pageSize,Integer id) {
        String sql="select `id`,`name`,`description`,`price`,`stock`,`categoryLevel1Id`,`categoryLevel2Id`,`categoryLevel3Id`,`fileName`,`isDelete` from easybuy_product" +
                " where categoryLevel3Id=? limit ?,?";
        return qureyForList(Product.class, sql,id,begin, pageSize);
    }
    @Override
    public Integer queryProductCountById3(Integer id) {
        String sql="select count(*) from easybuy_product where categoryLevel3Id=? ";
        Number number=(Number)queryForSingleValue(sql,id);
        return number.intValue();
    }
    //，迷糊查询

    @Override
    public Integer queryProductCountById3Like(String likePro) {
        String sql="select count(*) from easybuy_product where name like ? ";
        Number number=(Number)queryForSingleValue(sql,likePro);
        return number.intValue();
    }
    @Override
    public List<Product> queryForProductById3Like(Integer begin, int pageSize, String likePro) {
        String sql="select `id`,`name`,`description`,`price`,`stock`,`categoryLevel1Id`,`categoryLevel2Id`,`categoryLevel3Id`,`fileName`,`isDelete` from easybuy_product" +
                " where name like ? limit ?,?";
        return qureyForList(Product.class, sql,likePro,begin, pageSize);
    }
}
