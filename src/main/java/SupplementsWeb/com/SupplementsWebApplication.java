package SupplementsWeb.com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


//@ComponentScan(basePackages = {"SupplementsWeb.com.controller"})
@SpringBootApplication
public class SupplementsWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(SupplementsWebApplication.class, args);
	}

}