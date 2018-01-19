package com.stanley.test;

import redis.clients.jedis.Jedis;

public class TestRedis {

	public static void main(String[] args) {
		// 根据redis主机和端口号实例化Jedis对象
		Jedis jedis = new Jedis("localhost");
		System.out.println(jedis.ping());
		// 添加key-value对象，如果key对象存在就覆盖该对象
		jedis.set("hello", "world");
		// 查取key的value值，如果key不存在返回null
		String value = jedis.get("hello");
		System.out.println(value);
		// 删除key-value对象，如果key不存在则忽略此操作
		jedis.del("hello");
		// 判断key是否存在，不存在返回false存在返回true
		System.out.println(jedis.exists("hello"));
		jedis.close();
	}
}