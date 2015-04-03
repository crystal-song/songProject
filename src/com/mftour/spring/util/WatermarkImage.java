package com.mftour.spring.util;
import java.awt.AlphaComposite;   
import java.awt.Graphics2D;   
import java.awt.Image;   
import java.awt.RenderingHints;   
import java.awt.image.BufferedImage;   
import java.io.File;   
import java.io.FileInputStream;   
import java.io.FileOutputStream;   
import java.io.IOException;
import java.io.InputStream;   
import java.io.OutputStream;   
  


import javax.imageio.ImageIO;   
import javax.swing.ImageIcon;   
  
/**  
 * 图片水印  
 */  
public class WatermarkImage {   
	private static final com.mftour.spring.util.File ff= ReadWirtePropertis.file();
    /**  
     * @param args  
     */  
    public static void watermark(String srcImgPath, String targerPath) {   
        String iconPath =ff.getUrl()+ "/water2.png";   
        File f = new File(srcImgPath);
		OutputStream os = null;
		try {
			ImageIcon imgIcon = new ImageIcon(iconPath);
			Image srcImg = ImageIO.read(new File(srcImgPath));
			BufferedImage bi1 = ImageIO.read(f);
			int width = bi1.getWidth();
			int height = bi1.getHeight();
			BufferedImage buffImg = new BufferedImage(width, height,
					BufferedImage.TYPE_INT_RGB);
			int x = 0;
			int y = 0;
			// 得到画笔对象
			// Graphi00cs g= buffImg.getGraphics();
			Graphics2D g = buffImg.createGraphics();
			Image img = imgIcon.getImage();
			float alpha = 0.3f; // 透明度
			g.drawImage(srcImg.getScaledInstance(srcImg.getWidth(null),
			srcImg.getHeight(null), Image.SCALE_SMOOTH), 0, 0,
			null);
			for (int i = 0; i < width / 400 + 1; i++) {
				for (int j = 0; j < height / 300+ 1; j++) {
					x = 400* i;
					y = 300* j;

	
					g.setComposite(AlphaComposite.getInstance(
							AlphaComposite.SRC_ATOP, alpha));

					// 表示水印图片的位置
					g.drawImage(img, x, y, null);

			
				}
			}
			g.setComposite(AlphaComposite
					.getInstance(AlphaComposite.SRC_OVER));

			g.dispose();
			os = new FileOutputStream(targerPath);

			// 生成图片
			ImageIO.write(buffImg, "JPG", os);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (null != os)
					os.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// WatermarkImageUtil.resize(srcImgPath, iconPath, false);
		// 给图片添加水印

	}
}  