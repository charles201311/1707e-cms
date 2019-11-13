package com.bw.cms.service.impl;

import org.junit.Test;

public class StringTest {

	
	@Test
	public void test1() {
		String string = String.format("%1$s%2$s", "abc","123");	
		System.out.println(string);
	}
}
