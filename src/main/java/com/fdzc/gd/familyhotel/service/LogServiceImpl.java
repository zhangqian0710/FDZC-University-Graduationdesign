package com.fdzc.gd.familyhotel.service;

import com.fdzc.gd.familyhotel.dao.LogDao;
import com.fdzc.gd.familyhotel.domain.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:41
 */
@Service
public class LogServiceImpl implements LogService {

    @Autowired
    private LogDao logDao;

    @Override
    public void addLog(Log log) {
        logDao.addLog(log);
    }

    @Override
    public List<Log> findAll(Log log) {
        return logDao.findAll(log);
    }
}
