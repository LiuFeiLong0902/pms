package com.sram.util;

import java.util.Random;

public class HexNumberUtil {
	
	// 得到6位十六进制随机数
	public static String getHexString() {
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		
		for (int i = 0; i < 6; i++) {
			int num = random.nextInt(16);
			sb.append(Integer.toHexString(num));
		}
		
		return sb.toString();
	}
	
}
