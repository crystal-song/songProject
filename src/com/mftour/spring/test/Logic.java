package com.mftour.spring.test;

import static org.junit.Assert.fail;
import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import com.alibaba.fastjson.JSON;
import com.mftour.spring.base.JsonBaseBean;
import com.mftour.spring.util.Rest;
import com.mftour.spring.logic.YeePay;;

public class Logic {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		boolean s = YeePay.doLoan(19);
		//JsonBaseBean vo = JSON.parseObject(s, JsonBaseBean.class);
	    assertEquals(s, true);
	}
}
