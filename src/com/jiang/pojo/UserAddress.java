package com.jiang.pojo;

import org.omg.CORBA.PRIVATE_MEMBER;
import org.omg.PortableInterceptor.INACTIVE;

import java.util.Date;

/**
 * @author jiangboss
 * @create 2021-05-24-11:41
 */
public class UserAddress {
    private Integer id;//主键
    private Integer userId;//用户主键
    private String address;//地址
    private Date createTime;//穿件时间
    private Integer isDefault;
    private String remark;

    public UserAddress() {

    }
    public UserAddress(Integer id, Integer userId, String address, Date createTime, Integer isDefault, String remark) {
        this.id = id;
        this.userId = userId;
        this.address = address;
        this.createTime = createTime;
        this.isDefault = isDefault;
        this.remark = remark;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "UserAddress{" +
                "id=" + id +
                ", userId=" + userId +
                ", address='" + address + '\'' +
                ", createTime=" + createTime +
                ", isDefault=" + isDefault +
                ", remark='" + remark + '\'' +
                '}';
    }
}
