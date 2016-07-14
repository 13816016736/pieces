package com.pieces.dao.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.pieces.dao.RoleMemberDao;
import com.pieces.dao.model.RoleMember;
import com.pieces.dao.vo.MemberVo;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class RoleMemberDaoImpl extends BaseDaoImpl implements RoleMemberDao {

    @Override
    public RoleMember findById(int id) {
        return getSqlSession().selectOne("com.pieces.dao.RoleMemberMapper.findById", id);
    }


    @Override
    public List<RoleMember> findAll() {
        return getSqlSession().selectList("com.pieces.dao.RoleMemberMapper.findAll");
    }

    @Override
    public PageInfo<RoleMember> find(int pageNum, int pageSize) {
        List<RoleMember> list = getSqlSession().selectList("com.pieces.dao.RoleMemberMapper.findAll", null, new RowBounds(pageNum, pageSize));
        PageInfo page = new PageInfo(list);
        return page;
    }

    @Override
    public int deleteById(int id) {
        return getSqlSession().delete("com.pieces.dao.RoleMemberMapper.deleteById", id);
    }

    @Override
    public int create(RoleMember roleMember) {
        return getSqlSession().insert("com.pieces.dao.RoleMemberMapper.create", roleMember);
    }

    @Override
    public int update(RoleMember roleMember) {
        return getSqlSession().update("com.pieces.dao.RoleMemberMapper.update", roleMember);
    }

    @Override
    public List<RoleMember> findByMember(Integer memberId) {
        return getSqlSession().selectList("com.pieces.dao.RoleMemberMapper.findByMember", memberId);
    }

    @Override
    public int deleteByMember(Integer memberId) {
        return getSqlSession().delete("com.pieces.dao.RoleMemberMapper.deleteByMember", memberId);
    }

    @Override
    public List<RoleMember> findByCondition() {
        return getSqlSession().selectList("com.pieces.dao.RoleMemberMapper.findByPage");
    }

    @Override
    public List<RoleMember> findByRole(Integer roleId) {
        return getSqlSession().selectList("com.pieces.dao.RoleMemberMapper.findByRole",roleId);
    }

    @Override
    public int deleteByRole(Integer roleId) {
        return getSqlSession().delete("com.pieces.dao.RoleMemberMapper.deleteByRole",roleId);
    }

    @Override
    public PageInfo<RoleMember> findByConditionAndRole(MemberVo memberVo, Integer pageNum, Integer pageSize) {
        List<RoleMember> list = getSqlSession().selectList("com.pieces.dao.RoleMemberMapper.findByConditionAndRole", memberVo,new RowBounds(pageNum, pageSize));
        PageInfo page = new PageInfo(list);
        return page;
    }


}