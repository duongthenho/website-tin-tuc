package com.devpro.dto;

import org.springframework.security.crypto.password.PasswordEncoder;

public class NormalPasswordEncoder implements PasswordEncoder {
	
	/**
	 * hàm này sẽ thực hiện mã hoá password người dùng gửi lên.
	 */
	@Override
	public String encode(CharSequence rawPassword) {
		return rawPassword.toString();
	}
	
	/**
	 * hàm này thực hiện so sánh pasword người dùng đẩy lên và password có trong db.
	 */
	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		return rawPassword.equals(encodedPassword);
	}
	
}
