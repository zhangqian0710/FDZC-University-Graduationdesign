package com.fdzc.gd.familyhotel.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeCloseRequest;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.fdzc.gd.familyhotel.config.AlipayConfig;
import com.fdzc.gd.familyhotel.domain.Log;
import com.fdzc.gd.familyhotel.domain.Member;
import com.fdzc.gd.familyhotel.domain.Order;
import com.fdzc.gd.familyhotel.domain.User;
import com.fdzc.gd.familyhotel.service.LogService;
import com.fdzc.gd.familyhotel.service.OrderService;
import com.fdzc.gd.familyhotel.service.RoomService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:51
 */
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController{

    private static final Logger logger = Logger.getLogger(UserController.class);

    private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @Autowired
    private OrderService orderService;
    @Autowired
    private RoomService roomService;
    @Autowired
    private LogService logService;


    /**
     * 变更状态
     */
    @RequestMapping("changeOrder/{roomno}")
    public String changeOrder(@PathVariable String roomno, HttpSession session){
        try {

            orderService.updateOrder(roomno);
            roomService.changeRoomStu(roomno);

        }catch(Exception e){
            e.printStackTrace();
        }
        return "redirect:/order/listOrder";
    }



    /**
     * GET访问后台预定房间
     */
    @RequestMapping(value = "preroom", method = RequestMethod.GET)
    public String toPreroom() {
        return "order/input_order";
    }

    /**
     * POST访问后台预定房间
     */
    @RequestMapping(value = "preroom", method = RequestMethod.POST)
    public String goPreroom(HttpSession session, HttpServletRequest request) throws Exception {

        //获取前台预定信息
        String mebname = request.getParameter("preTel");
        String rtype = request.getParameter("roomType");
        String inTime = request.getParameter("start");
        String outTime = request.getParameter("finish");

        //获取一间对应预订信息的房间No
        String preRoonNo = roomService.findPreRoomNo(rtype);

        //实际价格
        String a = inTime.replace("-","");
        String b = outTime.replace("-","");
        int in = Integer.parseInt(a);
        int out = Integer.parseInt(b);
        int totalprice = Integer.parseInt(roomService.roomPrice(rtype));
        if(rtype.equals("a")){
            totalprice = (out - in)*totalprice;
        }else if(rtype.equals("b")){
            totalprice = (out - in)*totalprice;
        }
        else{
            totalprice = (out - in)*totalprice;
        }


        //订单信息
        Order order = new Order();
        order.setOrderMembName(mebname);
        order.setOrderRoomNo(preRoonNo);
        order.setOrderRoomType(rtype);
        order.setOrderInTime(simpleDateFormat.parse(inTime));
        order.setOrderOutTime(simpleDateFormat.parse(outTime));

        //用roomDao中方法获取价格一直报错。 极端方式添加价格。
        if(rtype.equals("a")){
            order.setOrderPrice(totalprice+"");
        }else if(rtype.equals("b")){
            order.setOrderPrice(totalprice+"");
        }
        else{
            order.setOrderPrice(totalprice+"");
        }
        //暂时默认支付宝
        order.setOrderPayment("a");
        order.setOrderStatus("b");

        //增加订单
        orderService.addOrder(order);
        //更改预定房间类型一间房间的状态
        roomService.updateRoomStu(preRoonNo);


        return "redirect:/order/listOrder";

    }


    /**
     * 分页查询订单信息
     */
    @RequestMapping("listOrder")
    public String getRooms(@RequestParam(value="pn",defaultValue="1")Integer pn, Model model, HttpSession session,HttpServletRequest request){
        if(logger.isInfoEnabled())
            logger.info("Ready get listOrder");

        String indate = request.getParameter("indate");
        String todaydate = request.getParameter("todaydate");
        String findate = request.getParameter("findate");

        //从第一条开始 每页查询八条数据
        PageHelper.startPage(pn, 8);

        if( indate == null  && todaydate == null && findate == null ){
            List<Order> orders = orderService.findAll();
            PageInfo page = new PageInfo(orders,6);
            model.addAttribute("pageInfo", page);
        }else if(todaydate != null){
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
            String today = (String) df.format(new Date());// new Date()为获取当前系统时间
            List<Order> orders = orderService.findAllOrder(today);
            PageInfo page = new PageInfo(orders,6);
            model.addAttribute("pageInfo", page);
        }else if(findate != null){
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
            String fin = (String) df.format(new Date());// new Date()为获取当前系统时间
            List<Order> orders = orderService.findAllFin(fin);
            PageInfo page = new PageInfo(orders,6);
            model.addAttribute("pageInfo", page);
        }else{
            List<Order> orders = orderService.findAllOrder(indate);
            PageInfo page = new PageInfo(orders,6);
            model.addAttribute("pageInfo", page);
        }

        //将用户信息放入PageInfo对象里


        //添加日志
        Log log = new Log();
        User logUser = (User) session.getAttribute("user");
        String loguserName = logUser.getUserName();
        log.setLogOperation("查询订单列表");
        log.setLogName(loguserName);
        log.setLogDate(new Date());
        logService.addLog(log);

        return "order/list_orders";
    }

    /**
     * 删除订单
     */
    @RequestMapping("removeOrder/{orderid}")
    public String removeOrder(@PathVariable int orderid, HttpSession session){
        try {
            orderService.deleteOrder(orderid);
            //添加日志
            Log log = new Log();
            User logUser = (User) session.getAttribute("user");
            String loguserName = logUser.getUserName();
            log.setLogOperation("删除订单");
            log.setLogName(loguserName);
            log.setLogDate(new Date());
            logService.addLog(log);

            if(logger.isInfoEnabled())
                logger.info("Remove is OK");
        }catch(Exception e){
            e.printStackTrace();
        }
        return "redirect:/order/listOrder";
    }


    /**
     * 查询是否还有房间
     */
    @ResponseBody
    @RequestMapping(value = "isExist", produces = "application/json;charset=utf-8")
    public Map isExist(String type, HttpServletRequest request, HttpSession session) {

        HashMap<String, String> msg = new HashMap<String, String>();
        int num = roomService.isExistRoom(type);

        System.out.println(num);

        if(num == 0){
            msg.put("flag","0");
            return msg;
        }else{
            msg.put("flag","1");
            return msg;
        }


    }


    /**
     * 信息确认
     */
    @RequestMapping(value = "pay", method = RequestMethod.POST)
    public String toPay( HttpServletRequest request, HttpSession session)  throws ParseException {
        //获取当前登录的会员信息
        Member member = (Member)session.getAttribute("member");
        String mebname = member.getMembName();

        //获取前台预定信息
        String rtype = request.getParameter("roomType");
        String inTime = request.getParameter("start");
        String outTime = request.getParameter("finish");

        //获取一间对应预订信息的房间No
        String preRoonNo = roomService.findPreRoomNo(rtype);

        //实际价格
        String a = inTime.replace("-","");
        String b = outTime.replace("-","");
        int in = Integer.parseInt(a);
        int out = Integer.parseInt(b);
        int totalprice = Integer.parseInt(roomService.roomPrice(rtype));
        if(rtype.equals("a")){
             totalprice = (out - in)*totalprice;
        }else if(rtype.equals("b")){
             totalprice = (out - in)*totalprice;
        }
        else{
             totalprice = (out - in)*totalprice;
        }


        //订单信息
        Order order = new Order();
        order.setOrderMembName(mebname);
        order.setOrderRoomNo(preRoonNo);
        order.setOrderRoomType(rtype);
        order.setOrderInTime(simpleDateFormat.parse(inTime));
        order.setOrderOutTime(simpleDateFormat.parse(outTime));

        //用roomDao中方法获取价格一直报错。 极端方式添加价格。
        if(rtype.equals("a")){
            order.setOrderPrice(totalprice+"");
            request.setAttribute("msg","单人间");
            request.setAttribute("dir","温馨家庭旅馆单人间");
        }else if(rtype.equals("b")){
            order.setOrderPrice(totalprice+"");
            request.setAttribute("msg","双人间");
            request.setAttribute("dir","温馨家庭旅馆双人间");
        }
        else{
            order.setOrderPrice(totalprice+"");
            request.setAttribute("msg","家庭房");
            request.setAttribute("dir","温馨家庭旅馆家庭房");
        }
        //暂时默认支付宝
        order.setOrderPayment("a");

        //增加订单
        orderService.addOrder(order);
        //更改预定房间类型一间房间的状态
        roomService.updateRoomStu(preRoonNo);

        request.setAttribute("price",order.getOrderPrice());


        return "alipay/fukuan";
    }

    /**
     * 扫码支付
     */
    @RequestMapping("/buy")
    public String buy( Model model, HttpServletResponse response, HttpServletRequest request) throws AlipayApiException, IOException {

        PrintWriter out = response.getWriter();

        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
        //付款金额，必填
        String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"),"UTF-8");
        //订单名称，必填
        String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8");
        //商品描述，可空
        String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");


        //请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();

        //输出
        model.addAttribute("result", result);
        return "alipay/zhifu";

    }



}
