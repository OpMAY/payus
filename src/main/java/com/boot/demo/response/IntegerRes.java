package com.boot.demo.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class IntegerRes<T> {

    private int status;
    private T data;

    public IntegerRes(final int status) {
        this.status = status;
        this.data = null;
    }

    public static <T> IntegerRes<T> res(final int status) {
        return res(status, null);
    }

    public static <T> IntegerRes<T> res(final int status, final T object) {
        return IntegerRes.<T>builder()
                .data(object)
                .status(status)
                .build();
    }
}
