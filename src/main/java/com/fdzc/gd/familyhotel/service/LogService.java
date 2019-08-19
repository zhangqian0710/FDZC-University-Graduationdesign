package com.fdzc.gd.familyhotel.service;

import com.fdzc.gd.familyhotel.domain.Log;

import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:41
 */
public interface LogService {

    void addLog(Log log);
    List<Log> findAll(Log log);

}
