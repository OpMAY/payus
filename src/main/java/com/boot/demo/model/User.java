package com.boot.demo.model;

import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Data
public class User {
    private int no;
    @NonNull
    private String email;
    @NonNull
    private String id;
    @NonNull
    private String name;

    private String grant="general";
    private String access_token="setting the password";
}
