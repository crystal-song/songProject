package com.mftour.spring.util;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/*import com.vanceinfo.core.utils.web.struts2.Struts2Utils;*/

public class ExcelUtil {
	/**
	 * 导出excel
	 * 
	 * @param datas
	 *            文档数据
	 * @param sourceFilePath
	 *            Excel模板文件路径
	 */
	public static void exportPollingTable(List<ExcelReplaceDataVO> datas,
			String sourceFilePath) {
		XSSFSheet sheet = null;
		HttpServletResponse response = null;
		OutputStream os = null;
		try {
			FileInputStream in = new FileInputStream(sourceFilePath);
			XSSFWorkbook wb = new XSSFWorkbook(in);
			sheet = wb.getSheetAt(0);
			XSSFCellStyle cellStyle = wb.createCellStyle();
			cellStyle.setWrapText(true);
			cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
			cellStyle.setAlignment(XSSFCellStyle.ALIGN_LEFT);
			cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
			for (ExcelReplaceDataVO data : datas) {
				// 获取单元格内容
				XSSFRow row = sheet.getRow(data.getRow());
				XSSFCell cell = row.getCell((short) data.getColumn());
				String str = cell.getStringCellValue();
				// 替换单元格内容
				str = str.replace(data.getKey(), data.getValue());
				cell.setCellStyle(cellStyle);
				// 写入单元格内容
				cell.setCellType(XSSFCell.CELL_TYPE_STRING);
				// cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(str);
			}

			os = response.getOutputStream();
			response.reset();
			response.setHeader("Content-disposition", "attachment;filename="
					+ new String("公务员登记表.xlsx".getBytes("gb2312"), "ISO8859-1"));
			response.setContentType("application/vnd.ms-excel");// 定义输出类型
			wb.write(os);
			os.flush();
			os.close();
		} catch (Exception e) {
			sheet = null;
			response = null;
			os = null;
			e.printStackTrace();
		}
	}

	/**
	 * 导出辞退文件
	 * 
	 * @param datas
	 *            文档数据
	 * @param sourceFilePath
	 *            Excel模板文件路径
	 */
	public static void exportDismissTable(List<ExcelReplaceDataVO> dataSheet1,
			List<ExcelReplaceDataVO> dataSheet2, String sourceFilePath) {
		XSSFSheet sheet1 = null;
		XSSFSheet sheet2 = null;
		HttpServletResponse response = null;
		OutputStream os = null;
		try {
			FileInputStream in = new FileInputStream(sourceFilePath);
			XSSFWorkbook wb = new XSSFWorkbook(in);
			sheet1 = wb.getSheetAt(0);
			for (ExcelReplaceDataVO data : dataSheet1) {
				// 获取单元格内容
				XSSFRow row = sheet1.getRow(data.getRow());
				XSSFCell cell = row.getCell((short) data.getColumn());
				String str = cell.getStringCellValue();
				// 替换单元格内容
				str = str.replace(data.getKey(), data.getValue());
				// 写入单元格内容
				cell.setCellType(XSSFCell.CELL_TYPE_STRING);
				// cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(str);
			}

			sheet2 = wb.getSheetAt(1);
			XSSFCellStyle cellStyle = wb.createCellStyle();
			cellStyle.setWrapText(true);
			cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
			cellStyle.setAlignment(XSSFCellStyle.ALIGN_LEFT);
			cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
			for (ExcelReplaceDataVO data : dataSheet2) {
				// 获取单元格内容
				XSSFRow row = sheet2.getRow(data.getRow());
				XSSFCell cell = row.getCell((short) data.getColumn());
				String str = cell.getStringCellValue();
				// 替换单元格内容
				str = str.replace(data.getKey(), data.getValue());
				cell.setCellStyle(cellStyle);
				// 写入单元格内容
				cell.setCellType(XSSFCell.CELL_TYPE_STRING);
				// cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(str);
			}

			os = response.getOutputStream();
			response.reset();
			response.setHeader("Content-disposition", "attachment;filename="
					+ new String("辞退文件.xlsx".getBytes("gb2312"), "ISO8859-1"));
			response.setContentType("application/vnd.ms-excel");// 定义输出类型
			wb.write(os);
			os.flush();
			os.close();
		} catch (Exception e) {
			sheet1 = null;
			sheet2 = null;
			response = null;
			os = null;
			e.printStackTrace();
		}
	}

	/**
	 * 导出辞职文件
	 * 
	 * @param datas
	 *            文档数据
	 * @param sourceFilePath
	 *            Excel模板文件路径
	 */
	public static void exportResignTable(List<ExcelReplaceDataVO> dataSheet1,
			List<ExcelReplaceDataVO> dataSheet2, String sourceFilePath) {
		XSSFSheet sheet1 = null;
		XSSFSheet sheet2 = null;
		HttpServletResponse response = null;
		OutputStream os = null;
		try {
			FileInputStream in = new FileInputStream(sourceFilePath);
			XSSFWorkbook wb = new XSSFWorkbook(in);
			sheet1 = wb.getSheetAt(0);
			for (ExcelReplaceDataVO data : dataSheet1) {
				// 获取单元格内容
				XSSFRow row = sheet1.getRow(data.getRow());
				XSSFCell cell = row.getCell((short) data.getColumn());
				String str = cell.getStringCellValue();
				// 替换单元格内容
				str = str.replace(data.getKey(), data.getValue());
				// 写入单元格内容
				cell.setCellType(XSSFCell.CELL_TYPE_STRING);
				// cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(str);
			}

			sheet2 = wb.getSheetAt(1);
			XSSFCellStyle cellStyle = wb.createCellStyle();
			cellStyle.setWrapText(true);
			cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
			cellStyle.setAlignment(XSSFCellStyle.ALIGN_LEFT);
			cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
			for (ExcelReplaceDataVO data : dataSheet2) {
				// 获取单元格内容
				XSSFRow row = sheet2.getRow(data.getRow());
				XSSFCell cell = row.getCell((short) data.getColumn());
				String str = cell.getStringCellValue();
				// 替换单元格内容
				str = str.replace(data.getKey(), data.getValue());
				cell.setCellStyle(cellStyle);
				// 写入单元格内容
				cell.setCellType(XSSFCell.CELL_TYPE_STRING);
				// cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(str);
			}

			os = response.getOutputStream();
			response.reset();
			response.setHeader("Content-disposition", "attachment;filename="
					+ new String("辞职文件.xlsx".getBytes("gb2312"), "ISO8859-1"));
			response.setContentType("application/vnd.ms-excel");// 定义输出类型
			wb.write(os);
			os.flush();
			os.close();
		} catch (Exception e) {
			sheet1 = null;
			sheet2 = null;
			response = null;
			os = null;
			e.printStackTrace();
		}
	}

	/**
	 * 导出辞退通知书
	 * 
	 * @param dataSheet
	 *            文档数据
	 * @param sourceFilePath
	 *            Excel模板文件路径
	 */
	public static void exportDismissNotice(List<ExcelReplaceDataVO> dataSheet,
			String sourceFilePath) {
		XSSFSheet sheet = null;
		HttpServletResponse response = null;
		OutputStream os = null;
		try {
			FileInputStream in = new FileInputStream(sourceFilePath);
			XSSFWorkbook wb = new XSSFWorkbook(in);
			sheet = wb.getSheetAt(0);
			for (ExcelReplaceDataVO data : dataSheet) {
				// 获取单元格内容
				XSSFRow row = sheet.getRow(data.getRow());
				XSSFCell cell = row.getCell((short) data.getColumn());
				String str = cell.getStringCellValue();
				// 替换单元格内容
				str = str.replace(data.getKey(), data.getValue());
				// 写入单元格内容
				cell.setCellType(XSSFCell.CELL_TYPE_STRING);
				// cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(str);
			}

			os = response.getOutputStream();
			response.reset();
			response.setHeader("Content-disposition", "attachment;filename="
					+ new String("辞退通知书.xlsx".getBytes("gb2312"), "ISO8859-1"));
			response.setContentType("application/vnd.ms-excel");// 定义输出类型
			wb.write(os);
			os.flush();
			os.close();
		} catch (Exception e) {
			sheet = null;
			response = null;
			os = null;
			e.printStackTrace();
		}
	}

	/**
	 * 导出辞职通知书
	 * 
	 * @param dataSheet
	 *            文档数据
	 * @param sourceFilePath
	 *            Excel模板文件路径
	 */
	public static void exportResignNotice(List<ExcelReplaceDataVO> dataSheet,
			String sourceFilePath) {
		XSSFSheet sheet = null;
		HttpServletResponse response = null;
		OutputStream os = null;
		try {
			FileInputStream in = new FileInputStream(sourceFilePath);
			XSSFWorkbook wb = new XSSFWorkbook(in);
			sheet = wb.getSheetAt(0);
			for (ExcelReplaceDataVO data : dataSheet) {
				// 获取单元格内容
				XSSFRow row = sheet.getRow(data.getRow());
				XSSFCell cell = row.getCell((short) data.getColumn());
				String str = cell.getStringCellValue();
				// 替换单元格内容
				str = str.replace(data.getKey(), data.getValue());
				// 写入单元格内容
				cell.setCellType(XSSFCell.CELL_TYPE_STRING);
				// cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(str);
			}

			os = response.getOutputStream();
			response.reset();
			response.setHeader("Content-disposition", "attachment;filename="
					+ new String("辞职通知书.xlsx".getBytes("gb2312"), "ISO8859-1"));
			response.setContentType("application/vnd.ms-excel");// 定义输出类型
			wb.write(os);
			os.flush();
			os.close();
		} catch (Exception e) {
			sheet = null;
			response = null;
			os = null;
			e.printStackTrace();
		}
	}

	/**
	 * 导出一个Sheet表格
	 * 
	 * @param datas
	 *            文档数据
	 * @param sourceFilePath
	 *            Excel模板文件路径
	 */
	public static void exportOneSheetTable(List<ExcelReplaceDataVO> datas,
			String sourceFilePath, String fileName) {
		XSSFSheet sheet = null;
		HttpServletResponse response = null;
		OutputStream os = null;
		try {
			FileInputStream in = new FileInputStream(sourceFilePath);
			XSSFWorkbook wb = new XSSFWorkbook(in);
			sheet = wb.getSheetAt(0);
			XSSFCellStyle cellStyle = wb.createCellStyle();
			cellStyle.setWrapText(true);
			cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
			cellStyle.setAlignment(XSSFCellStyle.ALIGN_LEFT);
			cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
			for (ExcelReplaceDataVO data : datas) {
				// 获取单元格内容
				XSSFRow row = sheet.getRow(data.getRow());
				XSSFCell cell = row.getCell((short) data.getColumn());
				String str = cell.getStringCellValue();
				// 替换单元格内容
				str = str.replace(data.getKey(), data.getValue());
				cell.setCellStyle(cellStyle);
				// 写入单元格内容
				cell.setCellType(XSSFCell.CELL_TYPE_STRING);
				// cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(str);
			}

			os = response.getOutputStream();
			response.reset();
			response.setHeader("Content-disposition", "attachment;filename="
					+ new String((fileName + ".xlsx").getBytes("gb2312"),
							"ISO8859-1"));
			response.setContentType("application/vnd.ms-excel");// 定义输出类型
			wb.write(os);
			os.flush();
			os.close();
		} catch (Exception e) {
			sheet = null;
			response = null;
			os = null;
			e.printStackTrace();
		}
	}

	/**
	 * 导出首授警衔审核表
	 * 
	 * @param datas
	 *            文档数据
	 * @param sourceFilePath
	 *            Excel模板文件路径
	 */
	public static void exportFirstRanksChangesTable(
			List<ExcelReplaceDataVO> datas, String sourceFilePath,
			String fileName) {
		XSSFSheet sheet = null;
		HttpServletResponse response = null;
		OutputStream os = null;
		try {
			FileInputStream in = new FileInputStream(sourceFilePath);
			XSSFWorkbook wb = new XSSFWorkbook(in);
			sheet = wb.getSheetAt(1);
			XSSFCellStyle cellStyle = wb.createCellStyle();
			cellStyle.setWrapText(true);
			cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
			cellStyle.setAlignment(XSSFCellStyle.ALIGN_LEFT);
			cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
			for (ExcelReplaceDataVO data : datas) {
				// 获取单元格内容
				XSSFRow row = sheet.getRow(data.getRow());
				XSSFCell cell = row.getCell((short) data.getColumn());
				String str = cell.getStringCellValue();
				// 替换单元格内容
				str = str.replace(data.getKey(), data.getValue());
				cell.setCellStyle(cellStyle);
				// 写入单元格内容
				cell.setCellType(XSSFCell.CELL_TYPE_STRING);
				// cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(str);
			}

			os = response.getOutputStream();
			response.reset();
			response.setHeader("Content-disposition", "attachment;filename="
					+ new String((fileName + ".xlsx").getBytes("gb2312"),
							"ISO8859-1"));
			response.setContentType("application/vnd.ms-excel");// 定义输出类型
			wb.write(os);
			os.flush();
			os.close();
		} catch (Exception e) {
			sheet = null;
			response = null;
			os = null;
			e.printStackTrace();
		}
	}
}
