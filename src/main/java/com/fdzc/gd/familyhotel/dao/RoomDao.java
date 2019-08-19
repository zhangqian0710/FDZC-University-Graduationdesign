package com.fdzc.gd.familyhotel.dao;

import com.fdzc.gd.familyhotel.domain.Room;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author Miracle_Q
 * time：2018/11/28 14:29
 */
public interface RoomDao {

    void addRoom(Room room);
    void updateRoom(Room room);
    void deleteRoom(int roomId);
    Room findRoomById(int roomId);
    List<Room> findAll(Room room);
    Map getRoomPic(Integer roomId);
    int getRoomCount();
    int getNcRoomConut();
    int getOdRoomConut();
    int getBiRoomConut();
    int isExistRoom(@Param("roomType") String roomType);
    String roomPrice(@Param("roomType") String roomType);
    String findPreRoomNo(@Param("roomType") String roomType);
    void updateRoomStu(@Param("roomNo") String roomNo);
    void changeRoomStu(@Param("roomNo") String roomNo);

}
