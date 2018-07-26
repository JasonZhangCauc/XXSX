package com.spark.util;


/**
 * 对于字符串的一些处理和判断
 */
public class StringUtils {
 
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return
	 */
	public static boolean isNull(String str) {
		return null == str || str.length() == 0 || "".equals(str)
				|| str.matches("\\s*");
	}
	
	/**
	 * 非空判断
	 */
	public static boolean isNotNull(String str) {
		return !isNull(str);
	}
	
}




