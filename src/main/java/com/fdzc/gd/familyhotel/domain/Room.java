package com.fdzc.gd.familyhotel.domain;

/**
 * @author Miracle_Q
 * time: 2018/11/28 9:38
 */
public class Room extends ValueObject {

    private Integer roomId; //房间id
    private String roomNo;  //房间号
    private byte[] roomPic; //房间图片
    private String roomType; //房间类型
    private String roomPrice; //房间价格
    private String[] roomEquip; //房间设施
    private String roomStatus;//房间状态
    private String roomMemo; //房间描述
    private String roomEquipStr; //订单状态

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public String getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(String roomNo) {
        this.roomNo = roomNo;
    }

    public byte[] getRoomPic() {
        return roomPic;
    }

    public void setRoomPic(byte[] roomPic) {
        this.roomPic = roomPic;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(String roomPrice) {
        this.roomPrice = roomPrice;
    }

    public String[] getRoomEquip() {
        return roomEquip;
    }

    public void setRoomEquip(String[] roomEquip) {
        this.roomEquip = roomEquip;

        StringBuffer sb = new StringBuffer();
        for(String equip:roomEquip)
            sb.append(equip).append("|");
        if(sb.length()>0) sb.deleteCharAt(sb.length()-1);
        this.roomEquipStr = sb.toString();

    }

    public String getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(String roomStatus) {
        this.roomStatus = roomStatus;
    }

    public String getRoomMemo() {
        return roomMemo;
    }

    public void setRoomMemo(String roomMemo) {
        this.roomMemo = roomMemo;
    }

    public String getRoomEquipStr() {
        return roomEquipStr;
    }

    public void setRoomEquipStr(String roomEquipStr) {
        this.roomEquipStr = roomEquipStr;
        this.roomEquip = this.roomEquipStr.split("\\|");
    }
}