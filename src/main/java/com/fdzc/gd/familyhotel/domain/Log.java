package com.fdzc.gd.familyhotel.domain;

import java.util.Date;

/**
 * @author Miracle_Q
 * time：2018/11/28 11:22
 */
public class Log {

    private Integer logId; //日志id
    private String logOperation; //操作方式
    private String logName;//操作用户
    private Date logDate; //生成日志时间
    private String logIf;//冗余条件


    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public String getLogOperation() {
        return logOperation;
    }

    public void setLogOperation(String logOperation) {
        this.logOperation = logOperation;
    }

    public String getLogName() {
        return logName;
    }

    public void setLogName(String logName) {
        this.logName = logName;
    }

    public Date getLogDate() {
        return logDate;
    }

    public void setLogDate(Date logDate) {
        this.logDate = logDate;
    }

    public String isLogIf() {
        return logIf;
    }

    public void setLogIf(String logIf) {
        this.logIf = logIf;
    }
}
