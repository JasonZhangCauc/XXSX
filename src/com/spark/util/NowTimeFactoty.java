package com.spark.util;

import java.text.SimpleDateFormat;

public class NowTimeFactoty {
	public String getNowTime() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
		return df.format(System.currentTimeMillis());
	}
}
