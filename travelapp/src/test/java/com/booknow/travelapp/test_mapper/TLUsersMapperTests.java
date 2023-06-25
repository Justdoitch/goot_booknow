package com.booknow.travelapp.test_mapper;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.sql.Timestamp;
import java.util.Date;

//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.booknow.travelapp.domain.TLAuthoritys;
import com.booknow.travelapp.domain.TLUsers;
import com.booknow.travelapp.mapper.TLUsersMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration      //폴더 구분자로 \\ 사용 시 오류 발생. /를 사용하세요.
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/mybatis-context.xml" ,
                       "file:src/main/webapp/WEB-INF/spring/security-context.xml" ,
                       "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class TLUsersMapperTests {


    //사용자 패스워드 암호화 
    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder pwencoder;
    
    @Setter(onMethod_ = @Autowired)
    private TLUsersMapper tLUsersMapper;

    //회원 등록 테스트: 테스트(1)
    @Test
    public void testInsertMyMember() {

//    	TLUsers tLUsers = new TLUsers();
//    	tLUsers.setUserId("userAdmin");
//    	tLUsers.setUserPassword((pwencoder.encode("sss55555")));
//    	tLUsers.setUserName("김영환");
//    	tLUsers.setUserEmail("e");
//    	tLUsers.setUserAddress("a");
//    	tLUsers.setUserMileage(1);
//    	tLUsers.setUserBday(new Date(5));
//    	tLUsers.setUserPhoneNumber("p");
//
//    	
//    	tLUsersMapper.insertTLUser(tLUsers);
    	TLAuthoritys authoritys = new TLAuthoritys("userAdmin", "USER", null);
    	tLUsersMapper.insertTLAuthoritys(authoritys);
        
        
    }// test end
    
    //회원 권한 등록 테스트: 테스트(2)
//    @Test
//    public void testInsertMyMemAuthority() {
//        
//        MyAuthorityVO myAuthority = new MyAuthorityVO();
//        
//        for(int i = 0; i < 100; i++) {
//
//            if(i < 80) {
//                myAuthority.setUserId("user" + i);
//                myAuthority.setAuthority("ROLE_USER");
//                
//            } else if (i < 90) {
//                myAuthority.setUserId("manager" + i);
//                myAuthority.setAuthority("ROLE_MANAGER");
//                
//            } else {
//                myAuthority.setUserId("admin" + i);
//                myAuthority.setAuthority("ROLE_ADMIN");
//                
//            }
//            log.info(myAuthority);
//            myMemberMapper.insertMyAuthority(myAuthority);
//        } //for-End
//        
//        myAuthority.setUserId("admin99");
//        myAuthority.setAuthority("ROLE_MANAGER");
//        myMemberMapper.insertMyAuthority(myAuthority);
//        
//        myAuthority.setUserId("admin99");
//        myAuthority.setAuthority("ROLE_USER");
//        myMemberMapper.insertMyAuthority(myAuthority);
//        
//        myAuthority.setUserId("admin91");
//        myAuthority.setAuthority("ROLE_MANAGER");
//        myMemberMapper.insertMyAuthority(myAuthority);
//    }
 
    //회원 정보 조회 테스트: 테스트(3) 
//    @Test
//    public void testRead() {
//        MyMemberVO myMember = myMemberMapper.selectMyMember("admin99");
//        log.info(myMember);
//        
//        myMember.getAuthorityList().forEach(authorityVO -> log.info(authorityVO));
//    }

} //class-end

