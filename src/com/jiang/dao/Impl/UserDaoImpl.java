package com.jiang.dao.Impl;

import com.jiang.dao.UserDao;
import com.jiang.pojo.News;
import com.jiang.pojo.User;
import com.jiang.pojo.pre.Address;

import javax.print.attribute.standard.NumberUp;
import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-16-22:04
 */
public class UserDaoImpl extends BaseDao implements UserDao {
    /**
     * 添加用户的操作
     * @param user
     * @return
     */
    @Override
    public int addUser(User user) {
       String sql="insert into easybuy_user(loginName,userName,password,sex,identityCode,email,mobile,type) " +
               "values(?,?,?,?,?,?,?,?)";
       return update(sql,user.getLoginName(),user.getUserName(),user.getPassword(),user.getSex(),
               user.getIdentityCode(),user.getEmail(),
               user.getMobile(),user.getType());
    }
    /**
     * 根据用户的名称和密码查询
     * @param name
     * @param password
     * @return
     */
    @Override
    public User queryForUser(String name, String password) {
        String sql="select id,loginName,userName,password,sex,identityCode,email,mobile,type from easybuy_user where loginName=? and password=?";
        return queryForOne(User.class,sql,name,password);
    }

    /**
     * 根据用户的名称查询 用来判断是否存在该用户注册时使用
     * @param name
     * @return
     */
    @Override
    public User queryForUserName(String name) {
        String sql="select id,loginName,userName,password,sex,identityCode,email,mobile,type from easybuy_user where loginName=?";
        return queryForOne(User.class,sql,name);
    }
    /**
     * 删除用户的操作
     * @param id
     * @return
     */
    @Override
    public int deleteUer(Integer id) {
        String sql="delete from easybuy_user where id =?";
        int update = update(sql, id);
        return update;
    }
    /**
     * 查找所有用户的列表
     * @return
     */
    @Override
    public List<User> queryForListUser() {
        String sql="select id,loginName,userName,password,sex,identityCode,email,mobile,type from easybuy_user ";
       return qureyForList(User.class, sql);
    }

    /**
     * 修改用户的操作
     * @param user
     * @return
     */
    @Override
    public int updateUser(User user) {
        String sql="update easybuy_user set `loginName`=?,`userName`=?,`password`=?,`sex`=?,`identityCode`=?,`email`=?,`mobile`=?,`type`=? where id=?";
       return update(sql,user.getLoginName(),user.getUserName(),user.getPassword(),user.getSex(),
                user.getIdentityCode(),user.getEmail(),user.getMobile(),user.getType(),user.getId());
    }

    @Override
    public List<User> queryForPage(int begin, Integer pageSize) {
        String sql="select `id`,`loginName`,`userName`,`password`,`sex`,`identityCode`,`email`,`mobile`,`type` from easybuy_user limit ?,?";
        return  qureyForList(User.class, sql, begin, pageSize);
    }

    @Override
    public Integer queryFroUserCount() {
        String Sql="select count(*) from easybuy_user";
        Number num =(Number)queryForSingleValue(Sql);
        return num.intValue();
    }

    /**
     * 根据真实姓名查找
     * @param username
     * @return
     */
    @Override
    public User queryForUserName1(String username) {
        String sql="select id,loginName,userName,password,sex,identityCode,email,mobile,type from easybuy_user where userName=?";
        return queryForOne(User.class,sql,username);
    }

    @Override
    public Address queryForUserAddress(Integer id) {
        return null;
    }
}
