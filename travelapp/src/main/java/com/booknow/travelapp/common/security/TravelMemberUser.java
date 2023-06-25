package com.booknow.travelapp.common.security;

import org.springframework.security.core.userdetails.User;

import com.booknow.travelapp.domain.TLUsers;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class TravelMemberUser extends User{
	
	private static final long serialVersionUID = 1L;
	
	private TLUsers tlUser;
	
	public TravelMemberUser(TLUsers tlUser) {
		super(tlUser.getUserId(), tlUser.getUserPassword(), tlUser.getAuthorityList());
		this.tlUser = tlUser;
	}

}
