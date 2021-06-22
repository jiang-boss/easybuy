package com.jiang.pojo;

import java.util.List;
import java.util.Map;

/**
 * @author jiangboss
 * @create 2021-05-28-19:23
 *
 *分类的类
 */
public class ThreeCategory {
    private String oneId;//一级分类名称
    private String twoId;//二级分类名称
    private String threeId;//三级分类名称
    private String cateOne;//一级分类名称
    private String cateTwo;//二级分类名称
    private String cateThree;//三级分类名称

    public ThreeCategory() {
    }

    public ThreeCategory(String oneId, String twoId, String threeId, String cateOne, String cateTwo, String cateThree) {
        this.oneId = oneId;
        this.twoId = twoId;
        this.threeId = threeId;
        this.cateOne = cateOne;
        this.cateTwo = cateTwo;
        this.cateThree = cateThree;
    }

    public String getOneId() {
        return oneId;
    }

    public void setOneId(String oneId) {
        this.oneId = oneId;
    }

    public String getTwoId() {
        return twoId;
    }

    public void setTwoId(String twoId) {
        this.twoId = twoId;
    }

    public String getThreeId() {
        return threeId;
    }

    public void setThreeId(String threeId) {
        this.threeId = threeId;
    }

    public String getCateOne() {
        return cateOne;
    }

    public void setCateOne(String cateOne) {
        this.cateOne = cateOne;
    }

    public String getCateTwo() {
        return cateTwo;
    }

    public void setCateTwo(String cateTwo) {
        this.cateTwo = cateTwo;
    }

    public String getCateThree() {
        return cateThree;
    }

    public void setCateThree(String cateThree) {
        this.cateThree = cateThree;
    }

    @Override
    public String toString() {
        return "ThreeCategory{" +
                "cateOne='" + cateOne + '\'' +
                ", cateTwo='" + cateTwo + '\'' +
                ", cateThree='" + cateThree + '\'' +
                '}';
    }
}
