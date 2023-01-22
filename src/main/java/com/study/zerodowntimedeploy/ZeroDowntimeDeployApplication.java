package com.study.zerodowntimedeploy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude= DataSourceAutoConfiguration.class)
public class ZeroDowntimeDeployApplication {

	public static void main(String[] args) {
		SpringApplication.run(ZeroDowntimeDeployApplication.class, args);
	}

}
