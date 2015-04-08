package com.mftour.spring.util;

public class File {
    private String platformNo;    
    private String callbackUrl;   
    private String notifyUrl;
    private String onSubmit;
    private String url;
    private String basePath;
    private String yeepayCfaFile;
    private String restHost;
    private String restOutHost;
    private String weixinCallHost;
    private String appId;
    private String appSecret;
    private static String redisIp;
    private static int PORT = 6379;
   private static int MAX_ACTIVE = 1024;
    private static int MAX_IDLE = 200;
    private static int MAX_WAIT = 10000;
    private static int TIMEOUT = 10000;
    private static boolean TEST_ON_BORROW = true;
    
	public static int getPORT() {
		return PORT;
	}
	public static void setPORT(int pORT) {
		PORT = pORT;
	}
	public static int getMAX_ACTIVE() {
		return MAX_ACTIVE;
	}
	public static void setMAX_ACTIVE(int mAX_ACTIVE) {
		MAX_ACTIVE = mAX_ACTIVE;
	}
	public static int getMAX_IDLE() {
		return MAX_IDLE;
	}
	public static void setMAX_IDLE(int mAX_IDLE) {
		MAX_IDLE = mAX_IDLE;
	}
	public static int getMAX_WAIT() {
		return MAX_WAIT;
	}
	public static void setMAX_WAIT(int mAX_WAIT) {
		MAX_WAIT = mAX_WAIT;
	}
	public static int getTIMEOUT() {
		return TIMEOUT;
	}
	public static void setTIMEOUT(int tIMEOUT) {
		TIMEOUT = tIMEOUT;
	}
	public static boolean isTEST_ON_BORROW() {
		return TEST_ON_BORROW;
	}
	public static void setTEST_ON_BORROW(boolean tEST_ON_BORROW) {
		TEST_ON_BORROW = tEST_ON_BORROW;
	}
	public static String getRedisIp() {
		return redisIp;
	}
	public static void setRedisIp(String redisIp) {
		File.redisIp = redisIp;
	}
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getAppSecret() {
		return appSecret;
	}
	public void setAppSecret(String appSecret) {
		this.appSecret = appSecret;
	}
	public String getWeixinCallHost() {
		return weixinCallHost;
	}
	public void setWeixinCallHost(String weixinCallHost) {
		this.weixinCallHost = weixinCallHost;
	}
	public String getRestHost() {
		return restHost;
	}
	public void setRestHost(String restHost) {
		this.restHost = restHost;
	}
	public String getRestOutHost() {
		return restOutHost;
	}
	public void setRestOutHost(String restOutHost) {
		this.restOutHost = restOutHost;
	}
	public String getBasePath() {
		return basePath;
	}
	public void setBasePath(String basePath) {
		this.basePath = basePath;
	}
	public String getYeepayCfaFile() {
		return yeepayCfaFile;
	}
	public void setYeepayCfaFile(String yeepayCfaFile) {
		this.yeepayCfaFile = yeepayCfaFile;
	}
	public String getPlatformNo() {
		return platformNo;
	}
	public void setPlatformNo(String platformNo) {
		this.platformNo = platformNo;
	}
	public String getCallbackUrl() {
		return callbackUrl;
	}
	public void setCallbackUrl(String callbackUrl) {
		this.callbackUrl = callbackUrl;
	}
	public String getNotifyUrl() {
		return notifyUrl;
	}
	public void setNotifyUrl(String notifyUrl) {
		this.notifyUrl = notifyUrl;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getOnSubmit() {
		return onSubmit;
	}
	public void setOnSubmit(String onSubmit) {
		this.onSubmit = onSubmit;
	} 
	
	
   
}
