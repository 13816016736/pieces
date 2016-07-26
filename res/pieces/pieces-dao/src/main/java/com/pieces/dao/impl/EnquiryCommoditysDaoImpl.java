package com.pieces.dao.impl;

import com.github.pagehelper.PageInfo;
import com.pieces.dao.EnquiryCommoditysDao;
import com.pieces.dao.model.EnquiryCommoditys;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class EnquiryCommoditysDaoImpl extends BaseDaoImpl implements EnquiryCommoditysDao{

        @Override
        public EnquiryCommoditys findById(int id) {
            return getSqlSession().selectOne("com.pieces.dao.EnquiryCommoditysMapper.findById", id);
        }


        @Override
        public List<EnquiryCommoditys> findAll() {
            return getSqlSession().selectList("com.pieces.dao.EnquiryCommoditysMapper.findAll");
        }

        @Override
        public PageInfo<EnquiryCommoditys> find(int pageNum, int pageSize) {
            List<EnquiryCommoditys> list = getSqlSession().selectList("com.pieces.dao.EnquiryCommoditysMapper.findAll", null,new RowBounds(pageNum, pageSize));
            PageInfo page = new PageInfo(list);
            return page;
        }

        @Override
        public int deleteById(int id) {
            return getSqlSession().delete("com.pieces.dao.EnquiryCommoditysMapper.deleteById",id);
        }

        @Override
        public int create(EnquiryCommoditys enquiryCommoditys) {
            return getSqlSession().insert("com.pieces.dao.EnquiryCommoditysMapper.create",enquiryCommoditys);
        }

        @Override
        public int update(EnquiryCommoditys enquiryCommoditys) {
            return getSqlSession().update("com.pieces.dao.EnquiryCommoditysMapper.update",enquiryCommoditys);
        }

}