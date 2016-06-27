package com.pieces.tools.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.pieces.tools.utils.gson.DateConverter;
import com.pieces.tools.utils.gson.GsonExclusion;
import com.pieces.tools.utils.gson.GsonInclusion;
import org.apache.commons.io.IOUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidParameterException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * gson的工具类
 *
 * @author miles
 */
public class GsonUtil {

    /**
     * 将一个对象转成json字符串
     *
     * @param obj
     * @return
     */
    public static String toJson(Object obj) {
        return toJsonExclude(obj);
    }

    /**
     * 将一个对象转成json字符串并指定需要排除的属性名称列表
     * 如果没有指定属性名称集合，则将会全部转换
     * 默认时间会以yyyy-MM-dd HH:mm:ss的格式进行转换
     *
     * @param obj
     * @param exclusionFields
     * @return String
     */
    public static String toJsonExclude(Object obj, String... exclusionFields) {
        //创建GsonBuilder
        GsonBuilder builder = new GsonBuilder();
        //设置时间格式
        builder.setDateFormat("yyyy-MM-dd HH:mm:ss");
        //设置需要被排除的属性列表
        if (exclusionFields != null && exclusionFields.length > 0) {
            GsonExclusion gsonFilter = new GsonExclusion();
            gsonFilter.addExclusionField(exclusionFields);
            builder.setExclusionStrategies(gsonFilter);
        }

        //创建Gson并进行转换
        Gson gson = builder.create();
        return gson.toJson(obj);
    }

    /**
     * 将一个对象转成json字符串并指定需要需要转换的属性名称列表
     * 如果没有指定属性名称集合，则将会全部转换
     * 默认时间会以yyyy-MM-dd HH:mm:ss的格式进行转换
     *
     * @param obj
     * @param includeFields
     * @return
     */
    public static String toJsonInclude(Object obj, String... includeFields) {
        //创建GsonBuilder
        GsonBuilder builder = new GsonBuilder();
        //设置时间格式
        builder.setDateFormat("yyyy-MM-dd HH:mm:ss");

        //设置需要转换的属性名称
        if (includeFields != null && includeFields.length > 0) {
            GsonInclusion gsonFilter = new GsonInclusion();
            gsonFilter.addInclusionFields(includeFields);
            builder.setExclusionStrategies(gsonFilter);
        }

        //创建Gson并进行转换
        Gson gson = builder.create();
        return gson.toJson(obj);
    }


    public static <T> T jsonToEntity(String json,Class<T> clazz, String... excludeFields){
        GsonBuilder builder = new GsonBuilder();
        builder.registerTypeAdapter(Date.class, new DateConverter());
        //要排除的字段
        if (excludeFields != null && excludeFields.length > 0) {
            GsonExclusion exclusions = new GsonExclusion();
            exclusions.addExclusionField(excludeFields);
            builder.setExclusionStrategies(exclusions);
        }
        Gson gson = builder.create();
        T entity = gson.fromJson(json, clazz);
        return entity;
    }




}
