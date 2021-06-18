package com.jiang.utils;

import org.apache.commons.beanutils.BeanUtils;

import java.util.Map;

/**
 * @author jiangboss
 * @create 2021-05-17-10:48
 * javabean
 */
public class webUtils {
    /**
     * 这个方法来注入javabean
     * @param value
     * @param bean
     * @param <T>
     * @return
     */
    public static <T> T copyParamToBean(Map value, T bean){
        try {
            System.out.println("注入之前"+bean);
            BeanUtils.populate(bean,value);
            System.out.println("注入之后"+bean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }

    public static int parseInt(String str,int defaultValue){
        try {
            return Integer.parseInt(str);
        } catch (Exception e) {
//            e.printStackTrace();
        }
        return defaultValue;
    }
}
