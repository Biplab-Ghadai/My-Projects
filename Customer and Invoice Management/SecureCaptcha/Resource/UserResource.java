package com.CustomerAndInvoice.SecureCaptcha.Resource;

import java.net.URI;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.CustomerAndInvoice.SecureCaptcha.domain.User;
import com.CustomerAndInvoice.SecureCaptcha.service.UserService;
import com.CustomerAndInvoice.SecureCaptcha.DTO.UserDTO;
import com.CustomerAndInvoice.SecureCaptcha.domain.HttpResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserResource {
	private final UserService userService = null;
	
	@PostMapping("/register")
	public ResponseEntity<HttpResponse> saveUser(@RequestBody @Valid User user)
	{
		UserDTO userDto = userService.createUser(user);
		return ResponseEntity.created(getUri()).body(
				 HttpResponse.builder()
				 			.timeStamp(now().toString())
				 			.data(of("user", userDto))
				 			.meassage("User Created")
				 			.status(HttpStatus.CREATED)
				 			.statusCode(HttpStatus.CREATED.value())
				 			.build());
	}

	private URI getUri() {
		
		return URI.create(ServletUriComponentsBuilder.fromCurrentContextPath().path("/user/get/<userId>").toUriString());
		
		
		
	
	
	}
}

















