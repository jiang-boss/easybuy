package com.jiang.service;

import com.jiang.pojo.UserAddress;
import com.jiang.pojo.pre.Address;

import java.util.List;

/**
 * @author:jiangboss
 * @create:2021--20 1:20
 */
public interface UserAddressService {
    public List<UserAddress> getAddressList(Integer id);

    UserAddress getAddressByid(Integer id);

    void updateAddress(UserAddress address);
}
