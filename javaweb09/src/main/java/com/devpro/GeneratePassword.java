package com.devpro;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class GeneratePassword {
	public static void main(String[] args) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10);
		String result = encoder.encode("123456");
		System.out.println(result);
		 Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	        System.out.println(new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(timestamp));
	}
}
