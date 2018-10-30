package com.fs;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan(basePackages = "com.fs.mapper")
public class RabcApplication {

	public static void main(String[] args) {
		SpringApplication.run(RabcApplication.class, args);
	}
}
