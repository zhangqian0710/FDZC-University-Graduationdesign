package com.fdzc.gd.familyhotel.controller;

import com.fdzc.gd.familyhotel.domain.Log;
import com.fdzc.gd.familyhotel.domain.User;
import com.fdzc.gd.familyhotel.service.LogService;
import com.fdzc.gd.familyhotel.service.RoomService;
import com.fdzc.gd.familyhotel.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:49
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    private static final Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private LogService logService;

    @ModelAttribute("user")
    public User getUser() {
        if (logger.isInfoEnabled())
            logger.info("-----newUser()-----!");
        return new User();
    }


    /**
     * GET访问后台登陆页
     */
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String toLogin() {
        if (logger.isInfoEnabled())
            logger.info("go bg login index");
        return "login/bg_login";
    }

    /**
     * POST访问后台登陆页
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String goLogin(User user , HttpSession session, HttpServletRequest request) throws Exception {

        //判断不输入账号或密码的情况
        if(user.getUserNo() == null || user.getUserNo() == ""){
            request.setAttribute("message","请输入账号后再登陆");
            return "login/bg_login";
        }else if(user.getUserPwd() == null || user.getUserPwd() == ""){
            request.setAttribute("message","请输入密码后再登陆！");
            return "login/bg_login";
        }

        //登陆判断（有输入账号和密码）
         User userAdmin = userService.checkUser(user.getUserNo(),user.getUserPwd());
        if(userAdmin == null){
            request.setAttribute("message","你输入的帐号或密码不正确，请重新输入。");
            return "login/bg_login";
        }else{
            session.setAttribute("user",userAdmin);
            if (logger.isInfoEnabled()) logger.info("user login is ok");
            //添加日志
            Log log = new Log();
            User logUser = (User) session.getAttribute("user");
            String loguserName = logUser.getUserName();
            log.setLogOperation("登陆系统");
            log.setLogName(loguserName);
            log.setLogDate(new Date());
            logService.addLog(log);
            return "redirect:/user/indexHome";
        }
    }

    /**
     * 管理员退出
     */
    @RequestMapping("logoutuser")
    public String logout(HttpSession session) {
        if (logger.isInfoEnabled())
            logger.info("logout system  ");

        //添加日志
        Log log = new Log();
        User logUser = (User) session.getAttribute("user");
        String loguserName = logUser.getUserName();
        log.setLogOperation("退出系统");
        log.setLogName(loguserName);
        log.setLogDate(new Date());
        logService.addLog(log);
        //清空session
        session.invalidate();
        return "redirect:/user/login";
    }

    /**
     * 访问后台主页
     */
    @RequestMapping("indexHome")
    public String goHome(Model model) {
        if (logger.isInfoEnabled())
            logger.info("go index Home");
        model.addAttribute("getRoomCount",roomService.getRoomCount())
             .addAttribute("ncRoomCount",roomService.getNcRoomConut())
             .addAttribute("getOdRoomConut",roomService.getOdRoomConut())
             .addAttribute("getBiRoomConut",roomService.getBiRoomConut())
             .addAttribute("getUserCount",userService.getUserCount())
             .addAttribute("getAdminConut",userService.getAdminConut())
             .addAttribute("getQtUserConut",userService.getQtUserConut())
             .addAttribute("getBillUserConut",userService.getBillUserConut());

        return "back/home";
    }


    /**
     * get访问增加管理员
     */
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String toInput(Model model) {
        if (logger.isInfoEnabled())
            logger.info("toInput method is invoked!");
        return "user/input_user";
    }

    /**
     * post访问增加管理员
     */
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(User user,HttpSession session) throws IOException {
        logger.info("user:"+user);
        userService.addUser(user);

        //添加日志
        Log log = new Log();
        User logUser = (User) session.getAttribute("user");
        String loguserName = logUser.getUserName();
        log.setLogOperation("增加管理员");
        log.setLogName(loguserName);
        log.setLogDate(new Date());
        logService.addLog(log);

        return "redirect:/user/listUser";
    }



    /**
     * 分页查询管理员信息
     */
    @RequestMapping("listUser")
    public String getUsers(@RequestParam(value="pn",defaultValue="1")Integer pn, Model model,User user,HttpSession session){
        if(logger.isInfoEnabled())
            logger.info("Ready get userList");
        //从第一条开始 每页查询X条数据
        PageHelper.startPage(pn, 8);
        List<User> users = userService.findAll(user);
        //将用户信息放入PageInfo对象里
        PageInfo page = new PageInfo(users,8);
        model.addAttribute("pageInfo", page);

        //添加日志
        Log log = new Log();
        User logUser = (User) session.getAttribute("user");
        String loguserName = logUser.getUserName();
        log.setLogOperation("查询管理员列表");
        log.setLogName(loguserName);
        log.setLogDate(new Date());
        logService.addLog(log);

        return "user/list_users";
    }


    /**
     * 删除管理员
     */
    @RequestMapping("removeUser/{userId}")
    public String removeUser(@PathVariable int userId,HttpSession session){
        try {
            userService.deleteUser(userId);

            //添加日志
            Log log = new Log();
            User logUser = (User) session.getAttribute("user");
            String loguserName = logUser.getUserName();
            log.setLogOperation("删除管理员");
            log.setLogName(loguserName);
            log.setLogDate(new Date());
            logService.addLog(log);

            if(logger.isInfoEnabled())
                logger.info("Remove is OK");
        }catch(Exception e){
            e.printStackTrace();
        }
        return "redirect:/user/listUser";
    }

    /**
     * get访问更新管理员
     */
    @RequestMapping(value="updateUser/{userId}", method = RequestMethod.GET)
    public String toUpdate(Model model, @PathVariable int userId){

        User user = userService.findUserById(userId);
        model.addAttribute("user",user);

        return "user/update_user";
    }


    /**
     * post访问更新管理员
     */
    @RequestMapping(value="updateUser", method = RequestMethod.POST)
    public String updateRoom(User user,HttpSession session) throws Exception{

        logger.info("user:"+user);
        userService.updateUser(user);

        //添加日志
        Log log = new Log();
        User logUser = (User) session.getAttribute("user");
        String loguserName = logUser.getUserName();
        log.setLogOperation("删除管理员");
        log.setLogName(loguserName);
        log.setLogDate(new Date());
        logService.addLog(log);

        return "redirect:/user/listUser";
    }


}
