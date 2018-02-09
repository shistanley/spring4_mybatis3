package com.stanley.support;

import java.util.UUID;

public class Util {

	private static final Util instance = new Util();

	public static Util getInstance() {
		return instance;
	}

	public String getRandomID() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
