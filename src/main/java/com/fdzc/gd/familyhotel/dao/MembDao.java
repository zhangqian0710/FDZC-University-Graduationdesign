package com.fdzc.gd.familyhotel.dao;

import com.fdzc.gd.familyhotel.domain.Member;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 16:08
 */
public interface MembDao {

    void addMemb(Member member);
    void updateMemb(Member member);
    void deleteMemb(int membId);
    Member findMembById(int membId);
    List<Member> findAll(Member member);
    Member findMembByTel(@Param("membTel") String membTel);
    Member findMemberByNoPwd(@Param("membTel") String membTel,@Param("membPwd") String membPwd);

}
