package com.CustomerAndInvoice.SecureCaptcha.Repository.implementation;

import java.util.Collection;
import com.CustomerAndInvoice.SecureCaptcha.Repository.UserRepository;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.CustomerAndInvoice.SecureCaptcha.Repository.*;
import com.CustomerAndInvoice.SecureCaptcha.domain.Role;
import com.CustomerAndInvoice.SecureCaptcha.exception.ApiException;
import com.CustomerAndInvoice.SecureCaptcha.rowmapper.RoleRowMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Repository
@RequiredArgsConstructor
@Slf4j
public class RoleRepositoryImpl implements RoleRepository<Role>{
	
	private static final String SELECT_ROLE_BY_NAME_QUERY = null;
	private static final String INSERT_ROLE_TO_USER = null;
	private final NamedParameterJdbcTemplate jdbc = null;
	
	@Override
	public Role create(Role Data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<Role> list(int page, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Role get(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Role update(Role data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean delete(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addRoleToUser(Object id, String name) {
		
		Logger.info("Adding role {} to user id: {}", roleName, userId);
		
		try {
			Role role = jdbc.queryForObject(SELECT_ROLE_BY_NAME_QUERY, Map.of("roleName", roleName), new RoleRowMapper());
			jdbc.update(INSERT_ROLE_TO_USER, Map.of("userId", userId, "roleId", role.getId()));
			
		}catch(EmptyResultDataAccessException exception) {
			throw new ApiException("No Role Found by name: "+ROLE_USER.name());
			
		} catch(Exception exception) {
			throw new ApiException("An Error Occured please Try again");
			
		}
		
		
	}


	public Role getRoleByUserId(Long userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public Role getRoleByUserEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateUserRole(Long userId, String roleName) {
		// TODO Auto-generated method stub
		
	}

}
