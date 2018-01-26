package com.stanley.dao;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TokenDao {
	
	private final RedisTemplate<String, String> redisTemplate;
	private final static long validTime = 60;

	@Autowired
	public TokenDao(RedisTemplate<String, String> redisTemplate) {
		this.redisTemplate = redisTemplate;
	}

	public void put(String token, String name) {
		redisTemplate.boundValueOps(token).set(name, validTime, TimeUnit.MINUTES);
	}

	public String get(String token) {
		return redisTemplate.opsForValue().get(token);
	}

	public void delete(String token) {
		redisTemplate.delete(token);
	}
}
