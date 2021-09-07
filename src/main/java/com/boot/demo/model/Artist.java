package com.boot.demo.model;

import lombok.Data;

@Data
public class Artist {
    private int artist_no;
    private String artist_name;
    private String bank_name;
    private String bank_account;
    private String bank_owner;
    private String email;
    private String artist_phone;
    private String main_img;
    private String artist_profile_img;
    private String reg_date;
    private int fan_number;
    private int visit_today;
    private String explain;
    private boolean artist_private;
    private String hashtag;
    private String recent_act_date;
    private boolean loudsourcing_push;
}