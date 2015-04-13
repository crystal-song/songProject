package com.mftour.spring.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PDFServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	com.mftour.spring.util.File file = ReadWirtePropertis.file();

	public PDFServlet() {
		super();
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) {
		try {

			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath();
			String htmlFileName = basePath
					+ request.getParameter("htmlFileName");
			String id = request.getParameter("id");
			String fileName = id + ".pdf";
			String pdfFileUrl = file.getUrl() + "/pdf/" +fileName;
			String url = basePath + "/up/jsp/pdf/" +fileName;
			PDFTool.generationPdfDzOrder(htmlFileName, pdfFileUrl);
			response.setContentType("application/pdf;charset=UTF-8");
			response.setHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(fileName, "UTF-8"));
			 URL	url1 = new URL(url);
			URLConnection con = url1.openConnection();
			byte[] buffer = new byte[4 * 1024];
			int read;
			InputStream in = con.getInputStream();
			OutputStream os = response.getOutputStream();
			while ((read = in.read(buffer)) > 0) {
				os.write(buffer, 0, read);
			}
			os.close();
			in.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
