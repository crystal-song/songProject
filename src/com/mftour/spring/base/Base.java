package com.mftour.spring.base;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.mftour.spring.util.File;
import com.mftour.spring.util.ReadWirtePropertis;

public class Base {
	 private  File f = ReadWirtePropertis.file();
	 private  Logger logger = LoggerFactory
			.getLogger(Base.class);
	public File getF() {
		return f;
	}
	public Logger getLogger() {
		return logger;
	}
}
