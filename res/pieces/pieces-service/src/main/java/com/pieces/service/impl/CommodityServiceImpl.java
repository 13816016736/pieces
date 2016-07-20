package com.pieces.service.impl;

import com.github.pagehelper.PageInfo;
import com.pieces.dao.CommodityDao;
import com.pieces.dao.ICommonDao;
import com.pieces.dao.model.Area;
import com.pieces.dao.model.Commodity;
import com.pieces.dao.vo.CommodityVO;
import com.pieces.service.AbsCommonService;
import com.pieces.service.CommodityService;
import com.pieces.service.utils.ImageUtil;
import com.pieces.service.vo.CropInfo;
import com.pieces.service.vo.CropResult;
import com.pieces.tools.bean.FileBo;
import com.pieces.tools.upload.DefaultUploadFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.util.Date;

/**
 * Author: koabs
 * 7/12/16.
 */
@Service
public class CommodityServiceImpl  extends AbsCommonService<Commodity> implements CommodityService {

    Logger logger = LoggerFactory.getLogger(CommodityServiceImpl.class);

    @Autowired
    CommodityDao commodityDao;

    @Autowired
    private DefaultUploadFile defaultUploadFile;

    @Override
    public ICommonDao<Commodity> getDao() {
        return commodityDao;
    }

    @Override
    @Transactional
    public void saveOrUpdate(Commodity commodity) {
        if(commodity.getId()!= null) {
            commodityDao.update(commodity);
        } else {
            commodity.setCreateTime(new Date());
            commodityDao.create(commodity);
        }
    }


    @Override
    public PageInfo<CommodityVO> query(CommodityVO commodity, int pageNum, int pageSize) {
        return commodityDao.findByParam(commodity, pageNum, pageSize);
    }

    @Override
    public PageInfo<CommodityVO> findVoByPage(int pageNum, int pageSize) {
        PageInfo<CommodityVO> pageInfo = commodityDao.findVoByPage(pageNum,pageSize);
        return pageInfo;
    }

    @Override
    public CropResult uploadImage(MultipartFile img) {
        try {
            FileBo fileBo = defaultUploadFile.uploadFile(img.getOriginalFilename(), img.getInputStream());
            BufferedImage sourceImg = ImageIO.read(new FileInputStream(fileBo.getFile()));
            return CropResult.success(fileBo.getPath(),sourceImg.getWidth(),sourceImg.getHeight());
        } catch (Exception e) {
            logger.error(e.getMessage());
            return CropResult.error("图片上传失败");
        }
    }


    @Override
    public CropResult cropImg(CropInfo cropInfo) {
        String basePath = defaultUploadFile.getBasePath();
        String url = defaultUploadFile.getUrl();

        String adder = cropInfo.getImgUrl().replace(url, basePath);
        cropInfo.setImgUrl(adder);

        try {
            return CropResult.success(ImageUtil.cropImg(cropInfo).replace(basePath, url));
        } catch (Exception e) {
            logger.error(e.getMessage());
            return CropResult.error("图片裁剪失败");
        }

    }

    @Override
    public CommodityVO findVoById(Integer id) {
        CommodityVO commodity =  commodityDao.findVoById(id);
        return commodity;
    }

    public CommodityVO findCommodityByBreedId(Integer id) {
    	return commodityDao.findCommodityByBreedId(id);
    }
}
