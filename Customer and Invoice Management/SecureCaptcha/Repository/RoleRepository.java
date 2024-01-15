package com.CustomerAndInvoice.SecureCaptcha.Repository;

import java.util.Collection;

import com.CustomerAndInvoice.SecureCaptcha.domain.Role;


public interface RoleRepository <T extends Role> {

	//Basic CRUD Operation
	T create(T Data);
	Collection<T> list(int page, int pageSize);
	T get(Long id);
	T update(T data);
	Boolean delete(Long id);
	
	//More Complex Operations
	
	void addRoleToUser(Object id, String name);
	
	Role getRoleByUserId(Long userId);
	Role getRoleByUserEmail(String email);
	void updateUserRole(Long userId, String roleName);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
