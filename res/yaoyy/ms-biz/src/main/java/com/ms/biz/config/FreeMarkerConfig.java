package com.ms.biz.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import javax.annotation.PostConstruct;

/**
 * Created by burgl on 2016/10/29.
 */
@Configuration
public class FreeMarkerConfig {

    @Autowired
    protected freemarker.template.Configuration configuration;

    @Value("${doc.base.url}")
    private String baseUrl;


    @PostConstruct
    public void freeMarkerConfigurer(){
        try {
            configuration.setSharedVariable("baseUrl",baseUrl);
        }catch (Exception e){
            e.printStackTrace();
        }
    }



}
