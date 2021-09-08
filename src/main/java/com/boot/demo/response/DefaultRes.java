package com.boot.demo.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class DefaultRes<T> {

    private String status;
    private T data;

    public DefaultRes(final String status) {
        this.status = status;
        this.data = null;
    }

    public static <T> DefaultRes<T> res(final String status) {
        return res(status, null);
    }

    public static <T> DefaultRes<T> res(final String status, final T object) {
        return DefaultRes.<T>builder()
                .data(object)
                .status(status)
                .build();
    }
}
