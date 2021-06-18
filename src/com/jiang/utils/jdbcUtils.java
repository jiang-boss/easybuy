package com.jiang.utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

/**
 * @author jiangboss
 * @create 2021-05-16-22:12
 * 连接数据库的操作
 */
public class jdbcUtils {
    private static DruidDataSource druidDataSource;
    static {
        try {
            Properties properties=new Properties();
            //读取jdbc配置文件
            InputStream inputStream = jdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            //从流中加载数据
            properties.load(inputStream);
            //类型转化创建数据库连接池
            druidDataSource= (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);
//            System.out.println(dataSource.getConnection());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //获取数据库的连接
    public static Connection getConnection(){
       Connection connection=null;
        try {
            connection= druidDataSource.getConnection();
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
        return connection;
    }
    //关闭数据库的连接
    public static void close(Connection connection){
        if (connection!=null){
            try {
                connection.close();
            } catch (SQLException sqlException) {
                sqlException.printStackTrace();
            }
        }
    }
}
