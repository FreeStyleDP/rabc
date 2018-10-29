package com.fs.entity;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 	返回jsonresult
 * 				0000：表示成功
 * 				9999：业务异常
 * @author dengp_m  
 * @date 2018年5月1日 下午1:10:10 
 */
public class JsonResult {

    // 定义jackson对象
    private static final ObjectMapper MAPPER = new ObjectMapper();

    // 响应业务状态
    private String status;

    // 响应消息
    private String msg;

    // 响应中的数据
    private Object data;
    
    private String ok;	// 不使用

    public static JsonResult build(String status, String msg, Object data) {
        return new JsonResult(status, msg, data);
    }

    public static JsonResult ok(Object data) {
        return new JsonResult(data);
    }

    public static JsonResult ok() {
        return new JsonResult(null);
    }
    

    public JsonResult() {

    }

//    public static LeeJSONResult build(Integer status, String msg) {
//        return new LeeJSONResult(status, msg, null);
//    }

    public JsonResult(String status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public JsonResult(Object data) {
        this.status = "0000";
        this.msg = "交易成功";
        this.data = data;
    }

    public Boolean isOK() {
        return this.status == "0000";
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    /**
     * 
     * @Description: 将json结果集转化为LeeJSONResult对象
     * 				需要转换的对象是一个类
     * @param jsonData
     * @param clazz
     * @return
     * 
     * @author leechenxiang
     * @date 2016年4月22日 下午8:34:58
     */
//    public static JsonResult formatToPojo(String jsonData, Class<?> clazz) {
//        try {
//            if (clazz == null) {
//                return MAPPER.readValue(jsonData, JsonResult.class);
//            }
//            JsonNode jsonNode = MAPPER.readTree(jsonData);
//            JsonNode data = jsonNode.get("data");
//            Object obj = null;
//            if (clazz != null) {
//                if (data.isObject()) {
//                    obj = MAPPER.readValue(data.traverse(), clazz);
//                } else if (data.isTextual()) {
//                    obj = MAPPER.readValue(data.asText(), clazz);
//                }
//            }
//            return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
//        } catch (Exception e) {
//            return null;
//        }
//    }

    /**
     * 
     * @Description: 没有object对象的转化
     * @param json
     * @return
     * 
     * @author leechenxiang
     * @date 2016年4月22日 下午8:35:21
     */
    public static JsonResult format(String json) {
        try {
            return MAPPER.readValue(json, JsonResult.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 
     * @Description: Object是集合转化
     * 				需要转换的对象是一个list
     * @param jsonData
     * @param clazz
     * @return
     * 
     * @author leechenxiang
     * @date 2016年4月22日 下午8:35:31
     */
//    public static JsonResult formatToList(String jsonData, Class<?> clazz) {
//        try {
//            JsonNode jsonNode = MAPPER.readTree(jsonData);
//            JsonNode data = jsonNode.get("data");
//            Object obj = null;
//            if (data.isArray() && data.size() > 0) {
//                obj = MAPPER.readValue(data.traverse(),
//                        MAPPER.getTypeFactory().constructCollectionType(List.class, clazz));
//            }
//            return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
//        } catch (Exception e) {
//            return null;
//        }
//    }

	public String getOk() {
		return ok;
	}

	public void setOk(String ok) {
		this.ok = ok;
	}

	@Override
	public String toString() {
		return "JsonResult [status=" + status + ", msg=" + msg + ", data=" + data + ", ok=" + ok + "]";
	}
	
	
}
