package com.fdzc.gd.familyhotel.dao;

import com.fdzc.gd.familyhotel.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:02
 */
public interface UserDao {

    void addUser(User user);
    void updateUser(User user);
    void deleteUser(int userId);
    User findUserById(int userId);
    List<User> findAll(User user);
    User findUserByNoPwd(@Param("userNo") String userNo,@Param("userPwd") String userPwd);
    int getUserCount();
    int getAdminConut();
    int getQtUserConut();
    int getBillUserConut();

}
