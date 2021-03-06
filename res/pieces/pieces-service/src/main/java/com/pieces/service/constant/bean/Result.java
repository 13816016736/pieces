package com.pieces.service.constant.bean;

/**
 * Created by wangbin on 2016/7/4.
 */
public class Result {

    private String status;
    private String info ="";
    private Object data = null;

    public Result(Boolean status) {
        if(status){
            this.status = "y";
        }else{
            this.status = "1000";
        }
    }

    public Result(String status) {
        this.status = status;
    }
    public Result info(String info) {
        this.info = info;
        return this;
    }
    public Result data(Object data) {
        this.data = data;
        return this;
    }
    public Object getData() {
        return data;
    }
    public void setData(Object data) {
        this.data = data;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
