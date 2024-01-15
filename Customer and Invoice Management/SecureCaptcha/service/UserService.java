package com.CustomerAndInvoice.SecureCaptcha.service;

import com.CustomerAndInvoice.SecureCaptcha.DTO.UserDTO;
import com.CustomerAndInvoice.SecureCaptcha.domain.User;

public interface UserService {
	UserDTO createUser(User user);
}
