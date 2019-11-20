package com.bw.cms.utils;
/**
 * 
 * @ClassName: Result 
 * @Description: 统一返回结果
 * @author: charles
 * @date: 2019年11月20日 上午9:43:28 
 * @param <T>
 */
public class Result<T> {

    /** 消息码. */
    private Integer code;

    /** 提示信息. */
    private String msg;

    /** 具体的内容. */
    private T data;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
