package com.CustomerAndInvoice.SecureCaptcha.service.Implementation;

import org.springframework.stereotype.Service;

import com.CustomerAndInvoice.SecureCaptcha.DTO.UserDTO;
import com.CustomerAndInvoice.SecureCaptcha.DTOMapper.UserDTOMapper;
import com.CustomerAndInvoice.SecureCaptcha.Repository.UserRepository;
import com.CustomerAndInvoice.SecureCaptcha.domain.User;
import com.CustomerAndInvoice.SecureCaptcha.service.UserService;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
	
	private final UserRepository<User> userRepository = null;
	
	@Override
	public UserDTO createUser(User user) {

		return UserDTOMapper.fromUser(userRepository.create(user));
	}

}
