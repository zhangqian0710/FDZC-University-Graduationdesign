package com.fdzc.gd.familyhotel.domain;

/**
 * @author Miracle_Q
 * time 2018/11/26 15:05
 *
 */
public class User extends ValueObject{

    private Integer userId; //管理员编号
    private String userNo; //管理员账号
    private String userPwd; //管理员密码
    private String userName; //管理员姓名
    private String userSex; //管理员性别
    private String userLimit; //管理员类别

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public String getUserLimit() {
        return userLimit;
    }

    public void setUserLimit(String userLimit) {
        this.userLimit = userLimit;
    }
}
