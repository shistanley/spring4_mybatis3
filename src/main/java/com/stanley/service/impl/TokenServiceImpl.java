package com.stanley.service.impl;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stanley.dao.TokenDao;
import com.stanley.service.TokenService;

@Service
public class TokenServiceImpl implements TokenService {

	private final TokenDao tokenDao;

	@Autowired
	public TokenServiceImpl(TokenDao tokenDao) {
		this.tokenDao = tokenDao;
	}

	@Override
	public String generateToken(String accoutNumber) {
		String token = UUID.randomUUID().toString().replace("-", "");
		tokenDao.put(token, accoutNumber);
		return token;
	}

	@Override
	public String getAccountNumber(String token) {
		return tokenDao.get(token);
	}

	@Override
	public void delete(String token) {
		tokenDao.delete(token);
	}

	@Override
	public String getName(String token) {
		return tokenDao.get(token);
	}
}
