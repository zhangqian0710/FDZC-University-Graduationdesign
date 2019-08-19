package com.fdzc.gd.familyhotel.controller;

import com.fdzc.gd.familyhotel.domain.Log;
import com.fdzc.gd.familyhotel.service.LogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.SimpleTimeZone;
import java.util.logging.SimpleFormatter;

/**
 * @author Miracle_Q
 * time：2018/11/29 9:11
 */
@Controller
@RequestMapping("/log")
public class LogController extends BaseController{

    private static final Logger logger = Logger.getLogger(UserController.class);
    private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @Autowired
    private LogService logService;




    /**
     * 分页查询日志信息
     */
    @RequestMapping("listLog")
    public String getUsers(@RequestParam(value="pn",defaultValue="1")Integer pn, Model model, HttpServletRequest request, Log log) throws ParseException {


        if(logger.isInfoEnabled())
            logger.info("Ready get userList");
        //从第一条开始 每页查询X条数据
        PageHelper.startPage(pn, 9);
        String logString = request.getParameter("logString");
        if(StringUtils.isNotBlank(logString)){
            log.setLogDate(simpleDateFormat.parse(logString));
            log.setLogIf("zhangqian");
        }
        List<Log> logs = logService.findAll(log);
        //将用户信息放入PageInfo对象里
        PageInfo page = new PageInfo(logs,9);
        model.addAttribute("pageInfo", page);

        return "log/list_logs";
    }


}
