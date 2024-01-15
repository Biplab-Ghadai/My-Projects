package com.CustomerAndInvoice.SecureCaptcha.domain;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonInclude;

import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_DEFAULT)
public class User {

	
	private long id;	
	@NotEmpty(message = "First name cannot be empty")
	private String firstName;
	@NotEmpty(message = "Last name cannot be empty")
	private String lastName;
	@NotEmpty(message = "Email name cannot be empty")
	@NotEmpty(message = "Invalid Email. Please enter a valid Email")
	private String email;
	@NotEmpty(message = "Password name cannot be empty")
	private String password;
	private String address;
	private String phone;
	private String title;
	private String bio;
	private String imageUrl;
	private boolean enabled;
	private boolean isNotLocked;
	private boolean isUsingMfa;
	private LocalDateTime createdAt;
	public String getEmail() {
		// TODO Auto-generated method stub
		return null;
	}
	public void setId(long longValue) {
		// TODO Auto-generated method stub
		
	}
	public Object getId() {
		// TODO Auto-generated method stub
		return null;
	}
	public Object getFirstName() {
		// TODO Auto-generated method stub
		return null;
	}
	public Object getLastName() {
		// TODO Auto-generated method stub
		return null;
	}
	public Object getPassword() {
		// TODO Auto-generated method stub
		return null;
	}
	public void setEnabled(boolean b) {
		// TODO Auto-generated method stub
		
	}
	public void setNotLocked(boolean b) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
}
