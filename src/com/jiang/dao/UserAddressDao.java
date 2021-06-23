package com.jiang.dao;

import com.jiang.pojo.UserAddress;
import com.jiang.pojo.pre.Address;

import java.util.List;

/**
 * @author:jiangboss
 * @create:2021--20 1:00
 * 这里处理用户地址
 */
public interface UserAddressDao {
    public List<UserAddress> queryListById(Integer id);

    UserAddress queryAddressByid(Integer id);

    void updateAddress(UserAddress address);


    void updateAddressDefaultZreo(Integer userid, Integer i);


    void updateAddressDefault(Integer addmoren, Integer i);
}
