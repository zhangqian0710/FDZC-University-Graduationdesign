package com.fdzc.gd.familyhotel.domain;

import java.util.Date;

/**
 * @author Miracle_Q
 * time: 2018/11/28 9:57
 */
public class Member extends ValueObject {

    private Integer membId; //会员id
    private String membName; //会员姓名
    private String membPwd; //会员密码
    private String membSex; //会员性别
    private String membTel; //会员电话

    public Integer getMembId() {
        return membId;
    }

    public void setMembId(Integer membId) {
        this.membId = membId;
    }

    public String getMembName() {
        return membName;
    }

    public void setMembName(String membName) {
        this.membName = membName;
    }

    public String getMembPwd() {
        return membPwd;
    }

    public void setMembPwd(String membPwd) {
        this.membPwd = membPwd;
    }

    public String getMembSex() {
        return membSex;
    }

    public void setMembSex(String membSex) {
        this.membSex = membSex;
    }

    public String getMembTel() {
        return membTel;
    }

    public void setMembTel(String membTel) {
        this.membTel = membTel;
    }


}
