package com.jiang.test;

import com.jiang.dao.Impl.UserDaoImpl;
import com.jiang.pojo.User;
import org.junit.Test;

/**
 * @author jiangboss
 * @create 2021-05-16-23:15
 */
public class UserTest {
    @Test
    public void testUserAdd(){
        UserDaoImpl userDao=new UserDaoImpl();
        userDao.addUser(new User(null,"dsa","jiang","dsdsd",1,"dhasa","fdfdsfds","ffewwerew",1));
    }
    @Test
    public void testQueryForOne(){
        UserDaoImpl userDao=new UserDaoImpl();
        User user = userDao.queryForUser("jiang", "dsdsd");
        System.out.println(user);
    }
    @Test
    public void testQueryForOneName(){
        UserDaoImpl userDao=new UserDaoImpl();
        User user = userDao.queryForUserName("李白");
        System.out.println(user);
    }
}
