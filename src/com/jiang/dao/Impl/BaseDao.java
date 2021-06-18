package com.jiang.dao.Impl;

import com.jiang.utils.jdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-16-22:33
 */
public abstract class BaseDao {
    //使用dbutils操作数据库
 private QueryRunner queryRunner=new QueryRunner();

    /**
     * 方法执行 insert update delete语句
     * @return
     */
 public int update(String sql,Object...args){
     Connection connection= jdbcUtils.getConnection();
     try {
         return queryRunner.update(connection,sql,args);
     } catch (SQLException sqlException) {
         sqlException.printStackTrace();
     }finally {
         try {
             connection.close();
         } catch (SQLException sqlException) {
             sqlException.printStackTrace();
         }
     }
     return -1;
 }

    /**
     * 查询返回一个对象的bean
     * @param tClass
     * @param sql
     * @param args
     * @param <T> 返回类型的泛型
     * @return
     */
 public <T> T queryForOne(Class<T> tClass,String sql,Object...args){
     Connection connection=jdbcUtils.getConnection();
     try {
         return queryRunner.query(connection,sql,new BeanHandler<T>(tClass),args);
     } catch (SQLException sqlException) {
         sqlException.printStackTrace();
     }finally {
         try {
             //关闭连接
             connection.close();
         } catch (SQLException sqlException) {
             sqlException.printStackTrace();
         }
     }
     return null;
 }

    /**
     * 查询多条数据
     * @param tClass
     * @param sql
     * @param args
     * @param <T>
     * @return
     */
 public <T> List<T> qureyForList(Class<T> tClass,String sql,Object...args){
     Connection connection=jdbcUtils.getConnection();
     try {
         return queryRunner.query(connection,sql,new BeanListHandler<T>(tClass),args);
     } catch (SQLException sqlException) {
         sqlException.printStackTrace();
     } finally {
         try {
             connection.close();
         } catch (SQLException sqlException) {
             sqlException.printStackTrace();
         }
     }
     return null;
 }
    /**
     * 查询返回一行一列的sql语句   统计的时候使用
     * @param sql
     * @param args
     * @return
     */
 public Object queryForSingleValue(String sql,Object...args){
     Connection connection=jdbcUtils.getConnection();
     try {
         return queryRunner.query(connection,sql,new ScalarHandler<>(),args);
     } catch (SQLException sqlException) {
         sqlException.printStackTrace();
     } finally {
         try {
             connection.close();
         } catch (SQLException sqlException) {
             sqlException.printStackTrace();
         }
     }
     return null;
  }
}
