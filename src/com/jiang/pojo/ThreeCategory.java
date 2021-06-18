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
    private String cateOne;//一级分类名称
    private String cateTwo;//二级分类名称
    private String cateThree;//三级分类名称

    public ThreeCategory() {
    }

    public ThreeCategory(String cateOne, String cateTwo, String cateThree) {
        this.cateOne = cateOne;
        this.cateTwo = cateTwo;
        this.cateThree = cateThree;
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
