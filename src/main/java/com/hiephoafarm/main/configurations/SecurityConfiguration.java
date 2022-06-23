package com.hiephoafarm.main.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.cors().and().csrf().disable();
		
		http.authorizeRequests()
				.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/product/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_EMPLOYEE')")
			.antMatchers("/orders/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_EMPLOYEE')")
			.and()
			.formLogin().loginPage("/auth/login")
			.loginProcessingUrl("/auth/process-login")
			.defaultSuccessUrl("/orders/index")
			.failureUrl("/auth/login?error")
			.usernameParameter("username")
			.passwordParameter("password")
			.and()
			.logout().logoutUrl("/auth/logout")
			.logoutSuccessUrl("/auth/login?logout")
			.and()
			.exceptionHandling().accessDeniedPage("/auth/accessDenied");
		
	}
	
	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
	
	

}
