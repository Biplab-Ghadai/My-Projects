package com.CustomerAndInvoice.SecureCaptcha.DTO;

import java.time.LocalDateTime;

import lombok.Data;


@Data
public class UserDTO {
	
	private long id;	
	private String firstName;
	private String lastName;
	private String email;
	private String address;
	private String phone;
	private String title;
	private String bio;
	private String imageUrl;
	private boolean enabled;
	private boolean isNotLocked;
	private boolean isUsingMfa;
	private LocalDateTime createdAt;
	
}
