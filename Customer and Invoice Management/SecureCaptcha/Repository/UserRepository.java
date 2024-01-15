package com.CustomerAndInvoice.SecureCaptcha.Repository;

import java.util.Collection;

import com.CustomerAndInvoice.SecureCaptcha.domain.User;

public interface UserRepository<T extends User> {

	//Basic CRUD Operation
	T create(T Data);
	Collection<T> list(int page, int pageSize);
	T get(Long id);
	T update(T data);
	Boolean delete(Long id);
	
	
}
