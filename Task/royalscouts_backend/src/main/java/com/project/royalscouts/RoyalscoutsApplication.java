package com.project.royalscouts;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class RoyalscoutsApplication {

	public static void main(String[] args) {
		SpringApplication.run(RoyalscoutsApplication.class, args);
	}

}
