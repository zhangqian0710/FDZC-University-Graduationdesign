package com.fdzc.gd.familyhotel.controller;

import com.fdzc.gd.familyhotel.domain.Log;
import com.fdzc.gd.familyhotel.domain.Room;
import com.fdzc.gd.familyhotel.domain.User;
import com.fdzc.gd.familyhotel.service.LogService;
import com.fdzc.gd.familyhotel.service.RoomService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/12/5
 */
@Controller
@RequestMapping("/room")
public class RoomController extends BaseController{

    private static final Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private RoomService roomService;

    @Autowired
    private LogService logService;

    @ModelAttribute("room")
    public Room getRoom() {
        if (logger.isInfoEnabled())
            logger.info("-----newRoom()-----!");
        return new Room();
    }

    /**
     * get访问增加房间
     */
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String toInput(Model model) {

        if (logger.isInfoEnabled())
            logger.info("Get Go To input_room.jsp");

        return "room/input_room";
    }


    /**
     * post访问增加房间
     */
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(HttpSession session, Room room , MultipartFile pic ) throws IOException {
        room.setRoomPic(pic.getBytes());
        logger.info("room:"+room);
        roomService.addRoom(room);
        //添加日志
        Log log = new Log();
        User logUser = (User) session.getAttribute("user");
        String loguserName = logUser.getUserName();
        log.setLogOperation("增加房间");
        log.setLogName(loguserName);
        log.setLogDate(new Date());
        logService.addLog(log);

        return "redirect:/room/listRoom";
    }

    /**
     * 分页查询房间信息
     */
    @RequestMapping("listRoom")
    public String getRooms(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model,Room room,HttpSession session){
        if(logger.isInfoEnabled())
            logger.info("Ready get roomList");
        //从第一条开始 每页查询五条数据
        PageHelper.startPage(pn, 6);
        List<Room> rooms = roomService.findAll(room);
        //将用户信息放入PageInfo对象里
        PageInfo page = new PageInfo(rooms,6);
        model.addAttribute("pageInfo", page);

        //添加日志
        Log log = new Log();
        User logUser = (User) session.getAttribute("user");
        String loguserName = logUser.getUserName();
        log.setLogOperation("查询房间列表");
        log.setLogName(loguserName);
        log.setLogDate(new Date());
        logService.addLog(log);

        return "room/list_rooms";
    }

    /**
     * 取房间图片
     */
    @RequestMapping("/{roomId}/getPic")
    public String getPic(@PathVariable int roomId,
                         HttpServletRequest request,
                         HttpServletResponse response) throws Exception{

        byte[] roomPic = roomService.getRoomPic(roomId);

        //没有从数据库中读取到分店的图片，使用默认图片
        if(roomPic==null || roomPic.length==0){
            String defaultPicPath = request.getRealPath("/")+"resources/imgs/no-pic.png"; //真实磁盘路径和网页路径之间的差异。
            FileInputStream fis =new FileInputStream(defaultPicPath);
            roomPic=new byte[fis.available()];
            fis.read(roomPic);
        }
        response.setContentType("image/jpeg");
        ServletOutputStream sos=response.getOutputStream();
        sos.write(roomPic);
        sos.flush();
        sos.close();
        return null;
    }

    /**
     * 删除房间
     */
    @RequestMapping("removeRoom/{roomId}")
    public String removeRoom(@PathVariable int roomId,HttpSession session){
        try {
            roomService.deleteRoom(roomId);

            //添加日志
            Log log = new Log();
            User logUser = (User) session.getAttribute("user");
            String loguserName = logUser.getUserName();
            log.setLogOperation("删除房间");
            log.setLogName(loguserName);
            log.setLogDate(new Date());
            logService.addLog(log);

            if(logger.isInfoEnabled())
                logger.info("Remove is OK");
        }catch(Exception e){
            e.printStackTrace();
        }
        return "redirect:/room/listRoom";
    }

    /**
     * get访问更新房间
     */
    @RequestMapping(value="updateRoom/{roomId}", method = RequestMethod.GET)
    public String toUpdate(Model model, @PathVariable int roomId){

        Room room = roomService.findRoomById(roomId);
        model.addAttribute("room",room);

        return "room/update_room";
    }


    /**
     * post访问更新房间
     */
    @RequestMapping(value="updateRoom", method = RequestMethod.POST)
    public String updateRoom(Room room, MultipartFile pic,HttpSession session){

        try {
            if(pic!=null && pic.getBytes().length>0){
                room.setRoomPic(pic.getBytes());
            }
            else {
                room.setRoomPic(roomService.getRoomPic(room.getRoomId()));
            }
            roomService.updateRoom(room);

            //添加日志
            Log log = new Log();
            User logUser = (User) session.getAttribute("user");
            String loguserName = logUser.getUserName();
            log.setLogOperation("修改房间");
            log.setLogName(loguserName);
            log.setLogDate(new Date());
            logService.addLog(log);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/room/listRoom";
    }








}
