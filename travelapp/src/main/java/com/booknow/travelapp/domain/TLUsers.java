package com.booknow.travelapp.domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
@NoArgsConstructor
public class TLUsers {

    private String userId;
    private String userPassword;
    private String userName;
    private String userEmail;
    private String userAddress;
    private int userMileage;
    private Date userBday;
    private String userPhoneNumber;
    private Timestamp userRegDate;
    private Timestamp userModDate;
    private int userStorage;
    private boolean enabled;
    private List<TLAuthoritys> authorityList;
}
