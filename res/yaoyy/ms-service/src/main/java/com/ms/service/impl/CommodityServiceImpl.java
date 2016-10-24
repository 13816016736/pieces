package com.ms.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ms.dao.ICommonDao;
import com.ms.dao.CommodityDao;
import com.ms.dao.model.Commodity;
import com.ms.dao.model.Gradient;
import com.ms.dao.vo.CommodityVo;
import com.ms.service.CommodityService;
import com.ms.service.GradientService;
import com.ms.tools.ClazzUtil;
import com.ms.tools.upload.PathConvert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Stream;

@Service
public class CommodityServiceImpl extends AbsCommonService<Commodity> implements CommodityService {

    @Autowired
    private CommodityDao commodityDao;

    @Autowired
    private GradientService gradientService;

    @Autowired
    private PathConvert pathConvert;

    /**
     * 商品图片保存路径
     */
    private String folderName = "commodity/";

    @Override
    public PageInfo<CommodityVo> findByParams(CommodityVo commodityVo, Integer pageNum, Integer pageSize) {
        if (pageNum == null || pageSize == null) {
            pageNum = 1;
            pageSize = 10;
        }
        PageHelper.startPage(pageNum, pageSize);
        List<CommodityVo> list = commodityDao.findByParams(commodityVo);
        PageInfo page = new PageInfo(list);
        return page;
    }

    @Override
    public List<Commodity> findByIds(String ids) {
        List<Integer> list = new ArrayList<>();
        for(String id :ids.split(",")){
            list.add(Integer.parseInt(id));
        }
        return commodityDao.findByIds(list);
    }




    @Override
    public ICommonDao<Commodity> getDao() {
        return commodityDao;
    }

    @Override
    @Transactional
    public void save(CommodityVo commodity) {

        commodity.setPictureUrl(pathConvert.saveFileFromTemp(commodity.getPictureUrl(),folderName));
        if (commodity.getId() == null) {
            commodity.setCreateTime(new Date());
            commodityDao.create(commodity);
        } else {
            commodity.setUpdateTime(new Date());
            commodityDao.update(commodity);
        }

        if (commodity.getGradient() != null) {
            commodity.getGradient().forEach(gradient -> {
                gradient.setCreateTime(new Date());
                gradient.setUpdateTime(new Date());
                gradient.setCommodityId(commodity.getId());
            });
            gradientService.update(commodity.getGradient());
        }
    }

    @Override
    public CommodityVo findById(Integer id) {
        CommodityVo vo = new CommodityVo();
        vo.setId(id);
        vo = commodityDao.findByParams(vo).get(0);
        List<Gradient> gradients = gradientService.findByCommodityId(id);
        vo.setGradient(gradients);
        vo.setPictureUrl(pathConvert.getUrl(vo.getPictureUrl()));
        return vo;
    }

    @Override
    @Transactional
    public int deleteById(int id) {
        gradientService.deleteByCommodityId(id);
        return super.deleteById(id);
    }


}
