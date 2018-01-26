package com.stanley.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HelloDao {

	private final RedisTemplate<String, String> redisTemplate;

	@Autowired
	public HelloDao(RedisTemplate<String, String> redisTemplate) {
		this.redisTemplate = redisTemplate;
	}

	public void put(String name, String message) {
		redisTemplate.opsForValue().set(name, message);
	}

	public String get(String name) {
		return redisTemplate.opsForValue().get(name);
	}
}
