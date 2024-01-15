package com.CustomerAndInvoice.SecureCaptcha.Repository.implementation;

import java.util.Collection;
import java.util.Map;
import java.util.UUID;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.CustomerAndInvoice.SecureCaptcha.Repository.RoleRepository;
import com.CustomerAndInvoice.SecureCaptcha.Repository.UserRepository;
import com.CustomerAndInvoice.SecureCaptcha.domain.Role;
import com.CustomerAndInvoice.SecureCaptcha.domain.User;
import com.CustomerAndInvoice.SecureCaptcha.exception.ApiException;
import com.CustomerAndInvoice.SecureCaptcha.query.UserQuery;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import com.CustomerAndInvoice.SecureCaptcha.enumuration.VerificationType;
import com.CustomerAndInvoice.SecureCaptcha.enumuration.RoleType;
import com.CustomerAndInvoice.SecureCaptcha.query.UserQuery;



@Repository
@RequiredArgsConstructor
@Slf4j
public class UserRepositoryImpl implements UserRepository<User> {
	
	
	private static final String COUNT_USER_EMAIL_QUERY = "";
	private static final String INSERT_USER_QUERY = "";
	private static final VerificationType ACCOUNT = null;
	private static final Enum<VerificationType> ROLE_USER = null;
	private static final String INSERT_ACCOUNT_VERIFICATION_URL_QUERY = "";
	private final NamedParameterJdbcTemplate jdbc = null;
	private final RoleRepository<Role> roleRepository = null;

	@Override
	public User create(User user) {
		// check if the email is unique
		if(getEmailCount(user.getEmail().trim().toLowerCase()) > 0) throw new ApiException("Email already in use. Please use a diffrent email and Try again");
		
		//Save new user
		try {
			KeyHolder holder = new GeneratedKeyHolder();
			SqlParameterSource parameters = getSqlParameterSource(user);
			jdbc.update(COUNT_USER_EMAIL_QUERY, parameters, holder);
			user.setId(holder.getKey().longValue());
			roleRepository.addRoleToUser(user.getId(), ROLE_USER.name());
			
			String verificationUrl = getVerificationUrl(UUID.randomUUID().toString(), ACCOUNT.getType());
			
			jdbc.update(INSERT_ACCOUNT_VERIFICATION_URL_QUERY, Map.of("userId", user.getId(), "url", verificationUrl));
			
			//emailService.sendVerificationUrl(user.getFirstName(), user.getEmail(), verificationUrl, ACCOUNT);
			
			user.setEnabled(false);
			user.setNotLocked(true);
			
			return user;
		}catch(EmptyResultDataAccessException exception) {
			throw new ApiException("No Role Found by name: "+ROLE_USER.name());
			
		} catch(Exception exception) {
			throw new ApiException("An Error Occured please Try again");
			
		}
		//Add role to the user
		//send verification URL
		//save URL in verification table
		//send email to user with verification URL
		//Return the newly created user
		//If any errors, throw exception with proper message
		//return user;
	}

	

	private Integer requireNonNull(Number key) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Collection<User> list(int page, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User get(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User update(User data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean delete(Long id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	private Integer getEmailCount(String email) {
		return jdbc.queryForObject(COUNT_USER_EMAIL_QUERY, Map.of("email", email), Integer.class);
	}
	
	private SqlParameterSource getSqlParameterSource(User user) {
		
		return new MapSqlParameterSource()
				.addValue("firstName", user.getFirstName())
				.addValue("lasstName", user.getLastName())
				.addValue("email", user.getEmail())
				.addValue("password", user.getPassword());
	
	}
	
	private String getVerificationUrl(String key, String type){
	
		return ServletUriComponentsBuilder.fromCurrentContextPath().path("/user/verify/"+ type + "/" + key).toUriString();
		
	}
	


}


