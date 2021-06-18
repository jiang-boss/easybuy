package com.jiang.service.Impl;
import com.jiang.dao.Impl.UserDaoImpl;
import com.jiang.dao.UserDao;
import com.jiang.pojo.*;
import com.jiang.service.UserService;
import org.apache.commons.dbutils.QueryRunner;

import java.util.List;


/**
 * @author jiangboss
 * @create 2021-05-17-9:06
 */
public class UserServiceImpl implements UserService {
    private UserDao userDao=new UserDaoImpl();
    @Override
    public User login(String loginName,String password) {
        //判断是否登录成功！！
       return userDao.queryForUser(loginName,password);
    }

    @Override
    public void regist(User user) {
        userDao.addUser(user);
    }

    @Override
    public boolean exitUsername(String username) {

        if(userDao.queryForUserName(username)==null){
            return false;
        }
        return true;
    }

    /**
     * 添加用户
     * @param user
     */
    @Override
    public void adduser(User user) {
     userDao.addUser(user);
    }

    /**
     * 根据id删除用户
     * @param id
     */
    @Override
    public void deleteUser(Integer id) {
        userDao.deleteUer(id);
    }

    /**
     * 修改用户信息
     * @param user
     */
    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    /**
     * 根据姓名查找用户
     * @param username
     * @return
     */
    @Override
    public User findUser(String username) {
       return userDao.queryForUserName(username);
    }

    /**
     * 查找用户列表
     * @return
     */
    @Override
    public List<User> findUserList() {
         return userDao.queryForListUser();
    }

    @Override
    public Page<User> findPage(Integer pageNum, Integer pageSize) {
        Page<User> page = new Page<>();
        //设置每页最大显示数
        page.setPageSize(pageSize);
        //设置总的记录数
        Integer pageTotalCount = userDao.queryFroUserCount();
        page.setPageTotalCount(pageTotalCount);
        //求总页码
        Integer pageTotal=pageTotalCount/Page.PAGE_SIZE;
        if (pageTotalCount % Page.PAGE_SIZE > 0) {
            pageTotal += 1;
        }
        //设置总页码
        page.setPageTotal(pageTotal);
        //给当前的页码赋值
        page.setPageNum(pageNum);
        //求出当前页面的索引
        int begin = (page.getPageNum() - 1) * pageSize;
        List<User> userList =userDao.queryForPage(begin, pageSize);
        //当前页面数据
        page.setItems(userList);
        //返回数据
        return page;
    }

    @Override
    public User findUserByname(String username) {
        return userDao.queryForUserName1(username);
    }
}
