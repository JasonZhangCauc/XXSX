package com.spark.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

import com.spark.bean.CAPTCHA;

/*
 * liyang
 */
public class CAPTCHAFactory {
	
	public CAPTCHA nextCAPTCHA() {
		
		CAPTCHA captcha = null;
		int captcha_num[] = new int[4];
		
		int width=120;
		int height=40;

		BufferedImage img=new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);

		Graphics g=img.getGraphics();
		
		g.setColor(Color.WHITE);
		g.fillRect(1, 1, width-2, height-2);
		
		g.setColor(Color.lightGray);
		g.drawRect(0, 0, width-1, height-1);
		
		
		g.setColor(Color.BLACK);
		g.setFont(new Font("宋体", Font.BOLD|Font.ITALIC, 26));
		
		Random rand=new Random();
		int postion=20;
		
		for(int i=0;i<4;i++) {
			int num = rand.nextInt(10);
			g.drawString(num +"", postion, 22);
			captcha_num[i] = num;
			postion+=20;
		}
		
		for (int i = 0; i < 10; i++) {
			
			g.setColor(new Color(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255)));
			g.drawLine(rand.nextInt(width), rand.nextInt(height), rand.nextInt(width), rand.nextInt(height));
			
		}
		captcha = new CAPTCHA(captcha_num, img);
		
		return captcha;

	}
}
