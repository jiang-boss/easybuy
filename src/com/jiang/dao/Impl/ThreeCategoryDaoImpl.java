package com.jiang.dao.Impl;

import com.jiang.dao.ThreeCategoryDao;
import com.jiang.pojo.ThreeCategory;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-28-22:20
 */
public class ThreeCategoryDaoImpl extends BaseDao implements ThreeCategoryDao {
    @Override
    public ThreeCategory queryForThreeCategory(Integer id) {
        String sql="SELECT ep.categoryLevel1Id as oneId,ep.categoryLevel2Id as twoId,ep.categoryLevel3Id as threeId,ec1.name as cateOne,ec2.name as cateTwo,ec3.name as cateThree from easybuy_product_category as ec1,easybuy_product_category as ec2,easybuy_product_category as ec3,easybuy_product as ep WHERE ep.categoryLevel1Id=ec1.id AND " +
                "ep.categoryLevel2Id=ec2.id and ep.categoryLevel3Id=ec3.id and ep.id=?";
        return queryForOne(ThreeCategory.class,sql,id);
    }
//    @Override
//    public List<ThreeCategory> getListThree() {
//        String sql="SELECT DISTINCT ep2.`name` as `cateOne`,ep3.`name` as `cateTwo`,ep4.`name` as `cateThree` from easybuy_product as ep1,easybuy_product_category as ep2,easybuy_product_category as\n" +
//                "ep3,easybuy_product_category as ep4 \n" +
//                "WHERE ep1.categoryLevel1Id=ep2.id and ep1.categoryLevel2Id=ep3.id and\n" +
//                "ep1.categoryLevel3Id=ep4.id";
//
//       return qureyForList(ThreeCategory.class, sql);
//    }
}
