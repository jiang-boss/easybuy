package com.jiang.service;

import com.jiang.pojo.*;

import java.awt.print.Book;
import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-17-9:01
 */
public interface UserService {
    public User login(String loginName,String password);

    public void regist(User user);

    boolean exitUsername(String username);

    void adduser(User user);

    void deleteUser(Integer id);
    void updateUser(User user);
    User findUser(String username);//登录名查找
    List<User> findUserList();

    Page<User> findPage(Integer pageNum, Integer pageSize);

    User findUserByname(String username);//真实姓名
}
