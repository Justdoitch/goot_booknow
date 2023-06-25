package com.booknow.travelapp.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.booknow.travelapp.domain.TLUsers;
import com.booknow.travelapp.mapper.TLUsersMapper;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;

public class TravelMemberUserDetailsServiceImpl implements UserDetailsService{
	
	@Setter(onMethod_ = {@Autowired})
	private TLUsersMapper tlUsersMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		TLUsers tlUser = tlUsersMapper.selectTLUser(username);
		
		if(tlUser == null) {
			return null;
		}
				
		return new TravelMemberUser(tlUser);
	}
	
}
