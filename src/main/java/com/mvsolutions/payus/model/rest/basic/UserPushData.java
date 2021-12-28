package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class UserPushData {
    private boolean event_push;
    private boolean review_push;
    private boolean point_push;
    private boolean report_push;
    private boolean marketing_agree;
}
