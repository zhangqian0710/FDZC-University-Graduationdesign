package com.fdzc.gd.familyhotel.service;


import com.fdzc.gd.familyhotel.dao.RoomDao;
import com.fdzc.gd.familyhotel.domain.Room;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Component
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomDao roomDao;

    @Override
    public void addRoom(Room room) {
        roomDao.addRoom(room);
    }

    @Override
    public void updateRoom(Room room) {
        roomDao.updateRoom(room);
    }

    @Override
    public void deleteRoom(int roomId) {
        roomDao.deleteRoom(roomId);
    }

    @Override
    public Room findRoomById(int roomId) {
        return roomDao.findRoomById(roomId);
    }

    @Override
    public List<Room> findAll(Room room) {
        return roomDao.findAll(room);
    }

    @Override
    public byte[] getRoomPic(int roomId) {
        if(roomDao.getRoomPic(roomId)!=null){
            return (byte[])roomDao.getRoomPic(roomId).get("imgBytes");
        }
        return null;
    }

    @Override
    public int getRoomCount() {
        return roomDao.getRoomCount();
    }

    @Override
    public int getNcRoomConut() {
        return roomDao.getNcRoomConut();
    }

    @Override
    public int getOdRoomConut() {
        return roomDao.getOdRoomConut();
    }

    @Override
    public int getBiRoomConut() {
        return roomDao.getBiRoomConut();
    }

    @Override
    public int isExistRoom(String roomType) {
        return roomDao.isExistRoom(roomType);
    }

    @Override
    public String findPreRoomNo(String roomType) {
        return roomDao.findPreRoomNo(roomType);
    }

    @Override
    public String roomPrice(String roomType) {
        return roomDao.roomPrice(roomType);
    }

    @Override
    public void updateRoomStu(String roomNo) {
        roomDao.updateRoomStu(roomNo);
    }

    @Override
    public void changeRoomStu(String roomNo) {
        roomDao.changeRoomStu(roomNo);
    }
}
