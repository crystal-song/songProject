
package com.mftour.spring.util;
 
//import java.io.FileInputStream;
//import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
//import java.net.URL;
import java.util.Properties;
 
/**
 * TODO
 * @author admin
 * @date 2012-11-22 下午05:17:28
 */
public class ReadWirtePropertis {
  /*  public static void main(String[] args) {
        Properties pro = new Properties();//属性集合对象 
//      URL url = Thread.currentThread().getContextClassLoader().getResource("prop.properties");//获取项目中文件的路径
        InputStream path =Thread.currentThread().getContextClassLoader().getResourceAsStream("configuration.properties");//获取路径并转换成流
//      try {
//          FileInputStream fis = new FileInputStream("属性文件创建在电脑上");
            try {
//              pro.load(fis);//将属性文件流装载到Properties对象中
                pro.load(path);
//              fis.close();
                System.out.println(pro.getProperty("baseFilePath"));
                pro.setProperty("shuzi", "1111");//往属性文件插值
                pro.setProperty("shuzi", "222");//更改属性值
                System.out.println(pro.getProperty("callbackUrl"));
                System.out.println(pro.getProperty("platformNo"));
                System.out.println(pro.getProperty("notifyUrl"));
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
//      } catch (FileNotFoundException e) {
//          // TODO Auto-generated catch block
//          e.printStackTrace();
//      }
    }*/
    
    
    
    
    public static File file() {
        Properties pro = new Properties();//属性集合对象 
//      URL url = Thread.currentThread().getContextClassLoader().getResource("prop.properties");//获取项目中文件的路径
        InputStream path =Thread.currentThread().getContextClassLoader().getResourceAsStream("configuration.properties");//获取路径并转换成流
//      try {
//          FileInputStream fis = new FileInputStream("属性文件创建在电脑上");
            try {
//              pro.load(fis);//将属性文件流装载到Properties对象中
                pro.load(path);
//              fis.close();
               /* System.out.println(pro.getProperty("baseFilePath"));*/
              /*  pro.setProperty("shuzi", "1111");//往属性文件插值
                pro.setProperty("shuzi", "222");//更改属性值
*/            /*    System.out.println(pro.getProperty("callbackUrl"));
                System.out.println(pro.getProperty("platformNo"));
                System.out.println(pro.getProperty("notifyUrl"));*/
                File f=new File();
                     f.setPlatformNo(pro.getProperty("platformNo"));
                     f.setCallbackUrl(pro.getProperty("callbackUrl"));
                     f.setNotifyUrl(pro.getProperty("notifyUrl"));
                     f.setUrl(pro.getProperty("url"));
                     f.setOnSubmit(pro.getProperty("onSubmit"));
                     return f;
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
//      } catch (FileNotFoundException e) {
//          // TODO Auto-generated catch block
//          e.printStackTrace();
//      }
			return null;
    }
}