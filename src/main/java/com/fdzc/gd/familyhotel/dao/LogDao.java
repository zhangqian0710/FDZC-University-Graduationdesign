package com.fdzc.gd.familyhotel.dao;

import com.fdzc.gd.familyhotel.domain.Log;

import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:07
 */
public interface LogDao {

    void addLog(Log log);
    List<Log> findAll(Log log);

}
