package com.fdzc.gd.familyhotel.service;

import com.fdzc.gd.familyhotel.domain.Member;

import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:27
 */
public interface MemberService {
    void addMemb(Member member);
    void updateMemb(Member member);
    void deleteMemb(int membId);
    Member findMembById(int membId);
    List<Member> findAll(Member member);
    Member findMembByTel(String membTel);
    Member findMemberByNoPwd(String membTel, String membPwd);
}
