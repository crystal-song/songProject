package com.mftour.spring.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class HttpClientTest {
	
	
	public String postForm(String service,String url,String s,String sign) {  
  
        CloseableHttpClient httpclient = HttpClients.createDefault();  
   
        HttpPost httppost = new HttpPost(url);  
     
        List formparams = new ArrayList();  
        formparams.add(new BasicNameValuePair("service", service));  
        formparams.add(new BasicNameValuePair("req", s));  
        formparams.add(new BasicNameValuePair("sign", sign));
        UrlEncodedFormEntity uefEntity;  
        try {  
            uefEntity = new UrlEncodedFormEntity(formparams, "UTF-8");  
            httppost.setEntity(uefEntity);  
          
            CloseableHttpResponse response = httpclient.execute(httppost);  
            try {  
                HttpEntity entity = response.getEntity();  
                if (entity != null) {  
                  
                   
                    return EntityUtils.toString(entity, "UTF-8");
                }  
            } finally {  
                response.close();  
            }  
        } catch (ClientProtocolException e) {  
            e.printStackTrace();  
        } catch (UnsupportedEncodingException e1) {  
            e1.printStackTrace(); 
        } catch (IOException e) {  
            e.printStackTrace();    
        } finally {  
         
            try {  
                httpclient.close();  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
        return null;
    }  
  
	
	public String doloan(String url,String s,String sign) {  
        // ���������������httpClient������.    
        CloseableHttpClient httpclient = HttpClients.createDefault();  
        // ������httppost    
        HttpPost httppost = new HttpPost(url);  
        // ������������������    
        List formparams = new ArrayList();  
       /* formparams.add(new BasicNameValuePair("service", service));  */
        formparams.add(new BasicNameValuePair("req", s));  
        formparams.add(new BasicNameValuePair("sign",  sign));
        UrlEncodedFormEntity uefEntity;  
        try {  
            uefEntity = new UrlEncodedFormEntity(formparams, "UTF-8");  
            httppost.setEntity(uefEntity);  
      
            CloseableHttpResponse response = httpclient.execute(httppost);  
            try {  
                HttpEntity entity = response.getEntity();  
                if (entity != null) {  
                 
                   
                    return EntityUtils.toString(entity, "UTF-8");
                }  
            } finally {  
                response.close();  
            }  
        } catch (ClientProtocolException e) {  
            e.printStackTrace();  
        } catch (UnsupportedEncodingException e1) {  
            e1.printStackTrace(); 
        } catch (IOException e) {  
            e.printStackTrace();    
        } finally {  
            // ������������,������������    
            try {  
                httpclient.close();  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
        return null;
    }  

}