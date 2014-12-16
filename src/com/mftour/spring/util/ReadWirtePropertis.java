
package com.mftour.spring.util;
 
//import java.io.FileInputStream;
//import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
//import java.net.URL;
import java.util.Properties;
 

public class ReadWirtePropertis {

    
    
    
    public static File file() {
        Properties pro = new Properties();

        InputStream path =Thread.currentThread().getContextClassLoader().getResourceAsStream("configuration.properties.eg");

            try {

                pro.load(path);

                File f=new File();
                     f.setPlatformNo(pro.getProperty("platformNo"));
                     f.setCallbackUrl(pro.getProperty("callbackUrl"));
                     f.setNotifyUrl(pro.getProperty("notifyUrl"));
                     f.setUrl(pro.getProperty("url"));
                     f.setOnSubmit(pro.getProperty("onSubmit"));
                     f.setBasePath(pro.getProperty("basePath"));
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