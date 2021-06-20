package com.jiang.test;

import com.jiang.pojo.UserAddress;
import com.jiang.pojo.pre.Address;
import com.jiang.service.Impl.UserAddressServiceImpl;
import com.jiang.service.UserAddressService;
import org.junit.Test;

import java.util.List;

/**
 * @author:jiangboss
 * @create:2021--20 1:33
 */
public class addressTest {
    UserAddressService userAddressService=new UserAddressServiceImpl();
    @Test
    public void testListAddress(){
        List<UserAddress> addressList = userAddressService.getAddressList(24);
        System.out.println(addressList);
    }
    @Test
    public void testListAddressId(){
        UserAddress addressByid = userAddressService.getAddressByid(17);
        System.out.println(addressByid);
    }
}
