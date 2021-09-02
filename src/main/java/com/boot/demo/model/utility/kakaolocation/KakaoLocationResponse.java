package com.boot.demo.model.utility.kakaolocation;

import lombok.Data;

import java.util.List;

@Data
public class KakaoLocationResponse {
    private Meta meta;
    private List<Documents> documents;
}
