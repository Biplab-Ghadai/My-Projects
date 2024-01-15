package com.CustomerAndInvoice.SecureCaptcha.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class RoleRowMapper implements RowMapper<Role>{

	@Override
	public Role mapRow(ResultSet resultSet, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		return Role.builder()
				.id(resultSet.getLong("id"))
				.name(resultSet.getString("name"))
				.permission(resultSet.getString("permission"))
				.build();
	}

}