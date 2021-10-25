package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.ColumnInfo;
import com.mvsolutions.payus.model.Test;

import java.util.ArrayList;
import java.util.List;

public interface TestMapper {
    ArrayList<Test> sqlRollbackTest();

    List<ColumnInfo> sqlColumnNameTest();
}
