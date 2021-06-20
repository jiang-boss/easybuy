package com.jiang.service.Impl;

import com.jiang.dao.Impl.UserAddressDaoImpl;
import com.jiang.dao.UserAddressDao;
import com.jiang.pojo.UserAddress;
import com.jiang.pojo.pre.Address;
import com.jiang.service.UserAddressService;

import java.util.List;

/**
 * @author:jiangboss
 * @create:2021--20 1:21
 */
public class UserAddressServiceImpl implements UserAddressService {
    UserAddressDao userAddressDao=new UserAddressDaoImpl();
    //根据用户的id查找
    @Override
    public List<UserAddress> getAddressList(Integer id) {
        return userAddressDao.queryListById(id);
    }

    //根据地址主键查找地址
    @Override
    public UserAddress getAddressByid(Integer id) {

       return userAddressDao.queryAddressByid(id);
    }

    @Override
    public void updateAddress(UserAddress address) {
        userAddressDao.updateAddress(address);
    }
}
