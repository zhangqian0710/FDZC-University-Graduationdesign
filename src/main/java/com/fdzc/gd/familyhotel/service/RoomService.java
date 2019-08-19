package com.fdzc.gd.familyhotel.service;


import com.fdzc.gd.familyhotel.domain.Room;
import org.apache.ibatis.annotations.Param;


import java.util.List;


public interface RoomService {

    void addRoom(Room room);
    void updateRoom(Room room);
    void deleteRoom(int roomId);
    Room findRoomById(int roomId);
    List<Room> findAll(Room room);
    byte[] getRoomPic(int roomId);
    int getRoomCount();
    int getNcRoomConut();
    int getOdRoomConut();
    int getBiRoomConut();
    int isExistRoom(String roomType);
    String findPreRoomNo(String roomType);
    String roomPrice(String roomType);
    void updateRoomStu(String roomNo);
    void changeRoomStu(String roomNo);
}
