package com.fdzc.gd.familyhotel.service;

import com.fdzc.gd.familyhotel.dao.MembDao;
import com.fdzc.gd.familyhotel.domain.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:28
 */
@Service
public class MemberServiceImpl implements MemberService{

    @Autowired
    private MembDao membDao;

    @Override
    public void addMemb(Member member) {
        membDao.addMemb(member);
    }

    @Override
    public void updateMemb(Member member) {
        membDao.updateMemb(member);
    }

    @Override
    public void deleteMemb(int membId) {
        membDao.deleteMemb(membId);
    }

    @Override
    public Member findMembById(int membId) {
        return membDao.findMembById(membId);
    }

    @Override
    public List<Member> findAll(Member member) {
        return membDao.findAll(member);
    }

    @Override
    public Member findMembByTel(String membTel) {
        return membDao.findMembByTel(membTel);
    }

    @Override
    public Member findMemberByNoPwd(String membTel, String membPwd) {
        return membDao.findMemberByNoPwd(membTel,membPwd);
    }
}
