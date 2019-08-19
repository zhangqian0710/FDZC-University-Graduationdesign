package com.fdzc.gd.familyhotel.controller;

import com.fdzc.gd.familyhotel.domain.Log;
import com.fdzc.gd.familyhotel.domain.Member;
import com.fdzc.gd.familyhotel.domain.User;
import com.fdzc.gd.familyhotel.service.LogService;
import com.fdzc.gd.familyhotel.service.MemberService;
import com.fdzc.gd.familyhotel.yunzhixun.com.RestTest;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.fdzc.gd.familyhotel.yunzhixun.com.RestTest.testSendSms;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:48
 */
@Controller
@RequestMapping("/member")
public class MembController extends BaseController{

    private static final Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private MemberService memberService;

    @Autowired
    private LogService logService;


    @ModelAttribute("member")
    public Member getMember() {
        if (logger.isInfoEnabled())
            logger.info("-----newMember()-----!");
        return new Member();
    }

    /**
     * 分页查询会员信息
     */
    @RequestMapping("listMember")
    public String getUsers(@RequestParam(value="pn",defaultValue="1")Integer pn, Model model, Member member, HttpSession session){
        if(logger.isInfoEnabled())
            logger.info("Ready get userList");
        //从第一条开始 每页查询X条数据
        PageHelper.startPage(pn, 8);
        List<Member> members = memberService.findAll(member);
        //将用户信息放入PageInfo对象里
        PageInfo page = new PageInfo(members,8);
        model.addAttribute("pageInfo", page);

        //添加日志
        Log log = new Log();
        User logUser = (User) session.getAttribute("user");
        String loguserName = logUser.getUserName();
        log.setLogOperation("查询会员列表");
        log.setLogName(loguserName);
        log.setLogDate(new Date());
        logService.addLog(log);

        return "member/list_members";
    }


    /**
     * 删除会员
     */
    @RequestMapping("removeMember/{memberId}")
    public String removeUser(@PathVariable int memberId,HttpSession session){
        try {

            memberService.deleteMemb(memberId);

            //添加日志
            Log log = new Log();
            User logUser = (User) session.getAttribute("user");
            String loguserName = logUser.getUserName();
            log.setLogOperation("删除会员");
            log.setLogName(loguserName);
            log.setLogDate(new Date());
            logService.addLog(log);

            if(logger.isInfoEnabled())
                logger.info("Remove is OK");
        }catch(Exception e){
            e.printStackTrace();
        }
        return "redirect:/member/listMember";
    }


    /**
     * 会员登录
     */
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String toLogin() {
        if (logger.isInfoEnabled())
            logger.info("go  login");
        return "member/login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String gogin(Member member , HttpSession session, HttpServletRequest request) throws Exception {
        logger.info("member:"+member);

        //登陆判断（有输入账号和密码）
        Member  mb = memberService.findMemberByNoPwd(member.getMembTel(),member.getMembPwd());
        if(mb == null){
            request.setAttribute("message","你输入的帐号或密码不正确，请重新输入。");
            return "member/login";
        }else{
            session.setAttribute("member",mb);
            return "redirect:/member/index";
        }


    }

    /**
     * 会员退出
     */
    @RequestMapping("logoutmember")
    public String logout(HttpSession session) {
        if (logger.isInfoEnabled())
            logger.info("logout logoutmember  ");

        //清空session
        session.invalidate();
        return "redirect:/member/index";
    }


    /**
     * 会员注册
     */

    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String toRegister() {
        if (logger.isInfoEnabled())
            logger.info("go  register");
        return "member/register";
    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String creRegister(Member member,HttpSession session) throws IOException {
        logger.info("member:"+member);
        memberService.addMemb(member);

        return "redirect:/member/login";
    }


    //获取验证码
    @ResponseBody
    @RequestMapping(value = "getVcode",produces = "application/json;charset=utf-8")
    public Map getVcode(String phone, HttpServletRequest request, HttpSession session) {

        Member member = memberService.findMembByTel(phone);
        HashMap<String, String> msg = new HashMap<String, String>();

        if(member!=null){
            msg.put("flag","0");
            return msg;
        }else {
            int num = (int) ((Math.random() * 9 + 1) * 100000);//6位随机数字
            System.out.println(num);

//         短信内容,根据注册的模板 例如"【项目中心】您的验证码为23456，请于2分钟内正确输入，如非本人操作，请忽略此短信。"
//         您的验证码为{1}，请于{2}分钟内正确输入，如非本人操作，请忽略此短信。

            String sid = "4ebea70d3e4d5660f32903ec9587f8df";
            String token = "408a86db6c4cf0bb6efad03c2c78feb2";
            String appid = "89452a2276d8443cbf4e5d08a690ee21";
            String templateid = "439177";
            String param = Integer.toString(num);
            String uid = "";

            //发送验证码接口函数
            testSendSms(sid, token, appid, templateid, param, phone, uid);

            msg.put("flag","1");
            msg.put("yan", param);
            return msg;
        }
    }

    /**
     * 前台官网主页
     */

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String toindex() {
        if (logger.isInfoEnabled())
            logger.info("go  index");
        return "front/index";
    }

    //单人间介绍
    @RequestMapping(value = "singleroom")
    public String tosingleroom() {
        if (logger.isInfoEnabled())
            logger.info("go  singleroom");
        return "front/singleroom";
    }

    //双人间介绍
    @RequestMapping(value = "doubleroom")
    public String todoubleroom() {
        if (logger.isInfoEnabled())
            logger.info("go  doubleroom");
        return "front/doubleroom";
    }

    //家庭房介绍
    @RequestMapping(value = "familyroom")
    public String tofamilyroom() {
        if (logger.isInfoEnabled())
            logger.info("go  familyroom");
        return "front/familyroom";
    }


    /**
     * 前台官网关于
     */

    @RequestMapping(value = "about", method = RequestMethod.GET)
    public String toabout() {
        if (logger.isInfoEnabled())
            logger.info("go  about");
        return "front/about";
    }



}
