package com.mftour.spring.util;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

/**
 * MAP集合操作类
 * 
 * @author lk
 * 
 */
public class MapUtil {

	/**
	 * 实体转换成MAP
	 * 
	 * @param obj
	 * @return
	 */
	public static Map<String, Object> ConvertObjToMap(Object obj) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		if (obj == null)
			return null;
		Field[] fields = obj.getClass().getDeclaredFields();
		for (int i = 0; i < fields.length; i++) {
			try {
				Field f = obj.getClass().getDeclaredField(fields[i].getName());
				f.setAccessible(true);
				Object o = f.get(obj);
				if (null != o && !"".equals(o.toString()))
					reMap.put(fields[i].getName(), o);
			} catch (NoSuchFieldException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return reMap;
	}

	public static Map<String, String> convertObjToStringMap(Object obj) {
		Map<String, String> reMap = new HashMap<String, String>();
		if (obj == null)
			return null;
		Field[] fields = obj.getClass().getDeclaredFields();
		for (int i = 0; i < fields.length; i++) {
			try {
				Field f = obj.getClass().getDeclaredField(fields[i].getName());
				f.setAccessible(true);
				Object o = f.get(obj);
				if (null != o && !"".equals(o.toString()))
					reMap.put(fields[i].getName(), o.toString());
			} catch (NoSuchFieldException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return reMap;
	}
}
