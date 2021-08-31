package com.boot.demo.mapper;

import com.boot.demo.model.Test;

import java.util.ArrayList;

public interface TestMapper {
    ArrayList<Test> sqlRollbackTest();
}
