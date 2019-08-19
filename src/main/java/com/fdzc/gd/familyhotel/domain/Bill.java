package com.fdzc.gd.familyhotel.domain;

import java.util.Date;

/**
 * @author Miracle_Q
 * time：2018/11/28 11:19
 */
public class Bill extends ValueObject {

    private Integer billId; //账单编号
    private String billMoney; //账单单笔金额
    private Date billTime;

    public Date getBillTime() {
        return billTime;
    }

    public void setBillTime(Date billTime) {
        this.billTime = billTime;
    }

    public Integer getBillId() {
        return billId;
    }

    public void setBillId(Integer billId) {
        this.billId = billId;
    }

    public String getBillMoney() {
        return billMoney;
    }

    public void setBillMoney(String billMoney) {
        this.billMoney = billMoney;
    }
}
