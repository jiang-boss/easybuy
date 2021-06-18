package com.jiang.test;

import com.jiang.pojo.User;
import com.jiang.service.Impl.UserServiceImpl;
import com.jiang.service.UserService;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @author jiangboss
 * @create 2021-05-26-10:59
 */
public class UserServiceTest {
    UserService userService=new UserServiceImpl();
    @Test
    public void adduser() {
        for (int i=3;i<20;i++){

            userService.adduser(new User(null,"yasuo"+i,"亚索"+i,"dsdsd",1,"dhasa",
                    "fdfdsfds","ffewwerew",1));
        }
    }

    @Test
    public void deleteUser() {
        userService.deleteUser(29);
    }

    @Test
    public void updateUser() {
        userService.updateUser(new User(29,"yasuo","亚索改过了","dsdsd",1,"dhasa",
                "fdfdsfds","ffewwerew",1));
    }

    @Test
    public void findUser() {
        System.out.println(userService.findUser("亚索改过了"));
    }

    @Test
    public void findUserList() {
        List<User> userList = userService.findUserList();
        userList.forEach(System.out::println);
    }
}