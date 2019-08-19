package com.fdzc.gd.familyhotel.service;

import com.fdzc.gd.familyhotel.dao.UserDao;
import com.fdzc.gd.familyhotel.domain.User;
import com.fdzc.gd.familyhotel.exception.ApplicationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:36
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public void addUser(User user) {
        userDao.addUser(user);
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    public void deleteUser(int userId) {
        userDao.deleteUser(userId);
    }

    @Override
    public User findUserById(int userId) {
        return userDao.findUserById(userId);
    }

    @Override
    public List<User> findAll(User user) {
        return userDao.findAll(user);
    }

    @Override
    public User checkUser(String userNo, String userPwd) {

        User user = userDao.findUserByNoPwd(userNo,userPwd);

        return user;
    }

    @Override
    public int getUserCount() {
        return userDao.getUserCount();
    }

    @Override
    public int getAdminConut() {
        return userDao.getAdminConut();
    }

    @Override
    public int getQtUserConut() {
        return userDao.getQtUserConut();
    }

    @Override
    public int getBillUserConut() {
        return userDao.getBillUserConut();
    }


}
