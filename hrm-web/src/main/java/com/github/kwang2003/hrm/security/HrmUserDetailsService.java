package com.github.kwang2003.hrm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class HrmUserDetailsService implements UserDetailsService {
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		if ("user".equals(username)) {
			return user();
		}
		if ("admin".equals(username)) {
			return admin();
		}
		throw new UsernameNotFoundException("用户不存在");
	}

	private UserDetails user() {
		return User.builder().username("user").password(bCryptPasswordEncoder.encode("123456")).roles("USER").build();
	}

	private UserDetails admin() {
		return User.builder().username("admin").password(bCryptPasswordEncoder.encode("password")).roles("ADMIN")
				.build();
	}

}
