package com.mftour.spring.util;

import java.io.InputStream;
import java.util.Properties;

public final class Env extends Properties { // ������Properties
	private static Env instance;

	public static Env getInstance() {
		if (instance != null) {
			return instance;
		} else {
			makeInstance();
			return instance;
		}
	}// ���������������������

	private static synchronized void makeInstance() {
		if (instance == null) {
			instance = new Env();
		}
	}// ������������������

	private Env() {
		InputStream is = getClass().getResourceAsStream("/sms.properties");
		try {
			load(is);
		} catch (Exception e) {
			
		}
	}
}
