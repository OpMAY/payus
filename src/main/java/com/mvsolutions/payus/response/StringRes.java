package com.mvsolutions.payus.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class StringRes<T> {

    private String status;
    private T data;

    public StringRes(final String status) {
        this.status = status;
        this.data = null;
    }

    public static <T> StringRes<T> res(final String status) {
        return res(status, null);
    }

    public static <T> StringRes<T> res(final String status, final T object) {
        return StringRes.<T>builder()
                .data(object)
                .status(status)
                .build();
    }
}
