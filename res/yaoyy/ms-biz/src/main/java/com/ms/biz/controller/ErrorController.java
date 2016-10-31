package com.ms.biz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by feng on 2016/10/24.
 */
@Controller
public class ErrorController implements org.springframework.boot.autoconfigure.web.ErrorController {

    private static final String ERROR_PATH= "/error";

    @RequestMapping(value = ERROR_PATH)
    public String handleError() {
        return "/403";
    }

    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }
}
