package com.fdzc.gd.familyhotel.service;

import com.fdzc.gd.familyhotel.domain.User;

import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:36
 */

public interface UserService {

    void addUser(User user);
    void updateUser(User user);
    void deleteUser(int userId);
    User findUserById(int userId);
    List<User> findAll(User user);
    User checkUser(String userNo, String userPwd);
    int getUserCount();
    int getAdminConut();
    int getQtUserConut();
    int getBillUserConut();
}
