package com.mftour.spring.logic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mftour.spring.util.File;
import com.mftour.spring.util.ReadWirtePropertis;

public class Account {

	private static final File f = ReadWirtePropertis.file();
	private static final Logger logger = LoggerFactory
			.getLogger(YeePay.class);
	// 还款成功更新数据
	public static boolean updateLoanProduct(int productId) {
		try {

			return true;
		} catch (Exception e) {
			return false;
		}

	}
}
