package com.jiang.dao.Impl;

import com.jiang.dao.UserAddressDao;
import com.jiang.pojo.UserAddress;
import com.jiang.pojo.pre.Address;

import java.util.List;

/**
 * @author:jiangboss
 * @create:2021--20 1:02
 * 用户地址的实现类
 */
public class UserAddressDaoImpl extends BaseDao implements UserAddressDao {

    @Override
    public List<UserAddress> queryListById(Integer id) {
        String sql="SELECT `id`,`userId`,`address`,`createTime`,`isDefault`,`remark`,`phone`,`rename`,`region`,`code` FROM easybuy_user_address WHERE userId=?";
        return qureyForList(UserAddress.class, sql, id);
    }

    @Override
    public UserAddress queryAddressByid(Integer id) {
        String sql="SELECT `id`,`userId`,`address`,`createTime`,`isDefault`,`remark`,`phone`,`rename`,`region`,`code` FROM easybuy_user_address WHERE id=?";
        return queryForOne(UserAddress.class,sql,id);
    }

    @Override
    public void updateAddress(UserAddress address) {
        String sql="update easybuy_user_address set `userId`=?,`address`=?,`createTime`=?,`isDefault`=?,`phone`=?,`rename`=?,`region`=?,`code`=? where id=?";
        update(sql,address.getUserId(),address.getAddress(),address.getCreateTime(),address.getIsDefault(),
                address.getPhone(),address.getRename(),address.getRegion(),address.getCode(),address.getId());
    }

    @Override
    public void updateAddressDefaultZreo(Integer userid,Integer i) {
        String sql="update easybuy_user_address set `isDefault`=? where userId=?";
        update(sql,i,userid);
    }
    @Override
    public void updateAddressDefault(Integer addmoren, Integer i) {
        String sql="update easybuy_user_address set `isDefault`=? where id=?";
        update(sql,i,addmoren);
    }
}
