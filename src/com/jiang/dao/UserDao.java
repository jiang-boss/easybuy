package com.jiang.dao;

import com.jiang.dao.Impl.BaseDao;
import com.jiang.pojo.News;
import com.jiang.pojo.User;
import com.jiang.pojo.pre.Address;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-16-22:04
 */
public interface UserDao{
    public int addUser(User user);//可以给用户注册和管理员增加用户

    public User queryForUser(String name,String password);

    public User queryForUserName(String name);//根据用户名查找
    int deleteUer(Integer id);
    List<User> queryForListUser();
    int  updateUser(User user);


    List<User> queryForPage(int begin, Integer pageSize);

    Integer queryFroUserCount();


    User queryForUserName1(String username);//根据真实姓名查找

     Address  queryForUserAddress(Integer id);
}
