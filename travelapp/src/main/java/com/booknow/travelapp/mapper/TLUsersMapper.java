package com.booknow.travelapp.mapper;

import com.booknow.travelapp.domain.TLAuthoritys;
import com.booknow.travelapp.domain.TLUsers;

public interface TLUsersMapper {
	
	// 특정 회원 조회
	public TLUsers selectTLUser(String userId);
	
	// 특정 회원 조회 (OUTER JOIN)
	public TLUsers selectMyMemberOUTER(String userId);
	
	// 회원 가입
	public Integer insertTLUser(TLUsers member);
	
    // 회원 권한 한개 등록
    public Integer insertTLAuthoritys(TLAuthoritys tlAuthority);	
}
