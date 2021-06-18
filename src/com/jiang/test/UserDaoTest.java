package com.jiang.test;

import com.jiang.dao.Impl.UserDaoImpl;
import com.jiang.dao.UserDao;
import com.jiang.pojo.User;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @author jiangboss
 * @create 2021-05-26-14:01
 */
public class UserDaoTest {
    UserDao userDao=new UserDaoImpl();
    @Test
    public void queryForPage() {
        List<User> users = userDao.queryForPage(1, 5);
        users.forEach(System.out::println);
    }
}