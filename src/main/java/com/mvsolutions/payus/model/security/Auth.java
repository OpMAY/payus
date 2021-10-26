package com.mvsolutions.payus.model.security;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Auth {
    private String name;
    private String key;
}
