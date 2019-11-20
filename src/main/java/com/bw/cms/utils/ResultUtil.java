package com.bw.cms.utils;

/**
 * 
 * @ClassName: ResultUtil 
 * @Description: TODO
 * @author: charles
 * @date: 2019年11月20日 下午2:43:15
 */
public class ResultUtil {

    public static Result success(Object object) {
        Result result = new Result();
        result.setCode(0);
        result.setMsg("成功");
        result.setData(object);
        return result;
    }

    public static Result success() {
        return success(null);
    }

    public static Result error(Integer code, String msg) {
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }
}
