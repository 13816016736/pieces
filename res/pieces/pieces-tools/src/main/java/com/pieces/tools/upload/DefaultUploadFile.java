package com.pieces.tools.upload;

import java.util.Calendar;

/**
 * 默认文件上传
 * Created by wangbin on 2016/6/27.
 */
public class DefaultUploadFile extends AbstractUploadFile{

    /**
     * 自定义文件名
     * @param fileName
     * @return
     */
    @Override
    public String customImageName(String fileName) {
        Calendar now = Calendar.getInstance();
        int year=now.get(Calendar.YEAR);
        int month=now.get(Calendar.MONTH)+1;
        StringBuffer sb = new StringBuffer();
        sb.append("files").append("/").append(year).append("/").append(month).append("/").append(fileName);
        return sb.toString();
    }



}
