package com.boot.demo.mapper;

import com.boot.demo.model.ColumnInfo;
import com.boot.demo.model.Test;

import java.util.ArrayList;
import java.util.List;

public interface TestMapper {
    ArrayList<Test> sqlRollbackTest();

    List<ColumnInfo> sqlColumnNameTest();
}
