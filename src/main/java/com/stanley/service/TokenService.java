package com.stanley.service;

public interface TokenService {

	public String generateToken(String accoutNumber);

	public String getAccountNumber(String token);

	public void delete(String token);

	public String getName(String token);
}
