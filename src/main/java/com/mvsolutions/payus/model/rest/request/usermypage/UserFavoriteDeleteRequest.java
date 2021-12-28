package com.mvsolutions.payus.model.rest.request.usermypage;

import lombok.Data;

@Data
public class UserFavoriteDeleteRequest {
    private int user_no;
    private int favorite_no;
}
