package com.stanley.constants;

import java.util.Properties;

/**
 * ClassName: GlobalConstants
 * 
 * @Description: 配置文件全局变量
 * @author Staanley
 * @date 2018年3月5日 上午10:41:30
 */
public class GlobalConstants {

	public static Properties interfaceUrlProperties;
	static {
		if (GlobalConstants.interfaceUrlProperties == null) {
			// InterfaceUrlInti.init();
		}
	}

	public static final String USER_SESSION = "user_session";
}
