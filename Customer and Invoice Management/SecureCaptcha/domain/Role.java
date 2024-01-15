package com.CustomerAndInvoice.SecureCaptcha.domain;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_DEFAULT)

public class Role {

	
	private long id;
	private String name;
	private String permission;
	public Object getId() {
		// TODO Auto-generated method stub
		return null;
	}
}
