package com.stanley.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stanley.dao.HelloDao;
import com.stanley.service.HelloService;

@Service
public class HelloServiceImpl implements HelloService {

	private final HelloDao helloDao;

	@Autowired
	public HelloServiceImpl(HelloDao helloDao) {
		this.helloDao = helloDao;
	}

	@Override
	public void add(String name, String message) {
		helloDao.put(name, message);
	}

	@Override
	public String showMessage(String name) {
		return helloDao.get(name);
	}
}
