package com.mftour.spring.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import org.springframework.stereotype.Component;
/** 
 * 生成PDF，通过freemarker模板
 */
@Component("PDFTool")
public class PDFTool {
	public static  InputStream generationPdfDzOrder(String htmlFileName,String pdfFileName) throws Exception{
	
		String command ="/usr/bin/wkhtmltopdf " + htmlFileName + " " + pdfFileName;;
		File pdfFile = new  File(pdfFileName); //pdf文件
		if(!pdfFile.exists()){pdfFile.createNewFile();}
		Runtime.getRuntime().exec(command);
		return new FileInputStream(pdfFile);
	}
  
}