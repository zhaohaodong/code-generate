package com.yryz.generate;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Copyright (c) 2017-2018 Wuhan Yryz Network Company LTD.
 * All rights reserved.
 *
 * @Description:
 * @Date: Created in 2017 2017/11/13 10:01
 * @Author: pn
 */
public class xx {
    public static void main(String[] args) {
        List<User> list = new ArrayList<>();
        User user1 = new User();
        User user2 = new User();
        User user3 = new User();
        User user4 = new User();
        User user5 = new User();
        user1.setId(1L);
        user2.setId(2L);
        user3.setId(3L);
        user4.setId(4L);
        user5.setId(4L);
        user1.setName("x");
        user2.setName("x");
        user3.setName("x");
        user4.setName("xx");
        user5.setName("s");
        list.add(user2);
        list.add(user1);
        list.add(user4);
        list.add(user3);
        list.add(user5);
        for (User user : list) {
            System.out.println(user.getId() + "====" + user.getName());
        }

        System.out.println("======================");

        Collections.sort(list, new Comparator<User>() {
            @Override
            public int compare(User o1, User o2) {
                if (o1.getId() > o2.getId()) {
                    return -1;
                }
                if (o1.getId() == o2.getId()) {
                    return 0;
                }
                return 1;
            }
        });
        for (User user : list) {
            System.out.println(user.getId() + "====" + user.getName());
        }
    }

}
