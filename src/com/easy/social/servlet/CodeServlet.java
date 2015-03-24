package com.easy.social.servlet;


import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easy.social.util.RandomValidateCode;

@SuppressWarnings("serial")
public class CodeServlet extends HttpServlet {

		    public void doGet(HttpServletRequest request, HttpServletResponse response)
		            throws ServletException, IOException {

		        response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
		        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
		        response.setHeader("Cache-Control", "no-cache");
		        response.setDateHeader("Expire", 0);
		        String code=request.getParameter("code").substring(5,10);
		        RandomValidateCode randomValidateCode = new RandomValidateCode();
		        try {
		            randomValidateCode.getRandcode(request, response,code);//输出图片方法
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    }

		    public void doPost(HttpServletRequest request, HttpServletResponse response)
		            throws ServletException, IOException {
		        doGet(request, response);
		    }
}
