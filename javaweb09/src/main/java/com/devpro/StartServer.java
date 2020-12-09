package com.devpro;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class StartServer {
	public static void main(String[] args) {
		SpringApplication.run(StartServer.class, args);
		System.out.println("----------------------Run success!---------------------");
	}
}
