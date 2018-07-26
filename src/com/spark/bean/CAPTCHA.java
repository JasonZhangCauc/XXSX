package com.spark.bean;

import java.awt.image.BufferedImage;

public class CAPTCHA {
	
	private int[] CAPTCHA_num;
	private BufferedImage bufferedImage;
	
	public CAPTCHA(int[] CAPTCHA_num,BufferedImage bufferedImage) {
		this.setBufferedImage(bufferedImage);
		this.setCAPTCHA_num(CAPTCHA_num);
	}

	public int[] getCAPTCHA_num() {
		return CAPTCHA_num;
	}

	public void setCAPTCHA_num(int[] cAPTCHA_num) {
		CAPTCHA_num = cAPTCHA_num;
	}

	public BufferedImage getBufferedImage() {
		return bufferedImage;
	}

	public void setBufferedImage(BufferedImage bufferedImage) {
		this.bufferedImage = bufferedImage;
	}
	
}
