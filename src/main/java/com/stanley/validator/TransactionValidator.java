package com.stanley.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.stanley.model.Transaction;

public class TransactionValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// 判断验证是否为Transaction，如果是则进行判断[修改为：验证]
		return Transaction.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Transaction trans = (Transaction) target;
		trans.notify();
	}
}