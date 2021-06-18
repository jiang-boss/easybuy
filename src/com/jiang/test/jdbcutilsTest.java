package com.jiang.test;

import com.jiang.utils.jdbcUtils;
import org.junit.Test;

import java.sql.Connection;

/**
 * @author jiangboss
 * @create 2021-05-16-22:31
 */
public class jdbcutilsTest {
    @Test//测试数据库的连接
    public void test(){
        Connection connection = jdbcUtils.getConnection();
        System.out.println(connection);
    }
}
