package com.mvsolutions.payus.util;

import com.mvsolutions.payus.exception.enums.BusinessExceptionType;
import com.mvsolutions.payus.exception.rest.GrantAccessDeniedException;
import com.mvsolutions.payus.model.web.vendor.response.sales.VendorAdminSalesList;
import lombok.extern.log4j.Log4j2;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Log4j2
@Service
public class ExcelMaker {

    public <T> void makeExcel(LinkedHashMap<String, String> column_info, Map<String, Class<?>> components, List<Object> objectList, String fileName, String title) {
        // WorkBook 생성
//        Workbook xlsWb = new HSSFWorkbook();
//        HSSFSheet sheet = null;
//        Row row = null;
//        Cell cell = null;

        // .xlsx 확장자 지원
        XSSFWorkbook xlsxWb = new XSSFWorkbook();
        XSSFSheet xssfSheet = null;
        XSSFRow xssfRow = null;
        XSSFCell xssfCell = null;

        log.info("Making Excel from chart...");
        log.info("Printing Column Info...");
        log.info("Column Size : " + components.size());
        List<String> component_name = new ArrayList<>(components.keySet());
        for (String component : component_name) {
            log.info(component + " : " + column_info.get(component));
        }


        try {
            int rowNo = 0; // 행 갯수

            // 워크시트 생성
            xssfSheet = xlsxWb.createSheet(title);

            // 헤더용 폰트 스타일
            XSSFFont font = xlsxWb.createFont();
            font.setFontName(HSSFFont.FONT_ARIAL);
            font.setFontHeightInPoints((short) 10);

            // 테이블 타이틀 스타일
            /*CellStyle cellStyle_Title = xlsxWb.createCellStyle();
            xssfSheet.setColumnWidth(0, (xssfSheet.getColumnWidth(0) + (short) 2048));
            cellStyle_Title.setFont(font);
            cellStyle_Title.setAlignment(HorizontalAlignment.CENTER);
            xssfSheet.addMergedRegion(new CellRangeAddress(0, 1, 0, components.size()));

            // 타이틀 생성
            xssfRow = xssfSheet.createRow(rowNo++);
            xssfCell = xssfRow.createCell((short) 0);
            // 추가한 행에 셀 객체 추가
            xssfCell.setCellStyle(cellStyle_Title); // 셀에 스타일 지정
            xssfCell.setCellValue(title); // 데이터 입력

            xssfSheet.createRow(rowNo++);
            xssfRow = xssfSheet.createRow(rowNo++); // 빈행 추가*/

            CellStyle tableCellStyle = xlsxWb.createCellStyle();
            tableCellStyle.setBorderTop(BorderStyle.THICK);
            tableCellStyle.setBorderBottom(BorderStyle.THICK);
            tableCellStyle.setBorderLeft(BorderStyle.THICK);
            tableCellStyle.setBorderRight(BorderStyle.THICK);
            tableCellStyle.setAlignment(HorizontalAlignment.CENTER);
            tableCellStyle.setFont(font);

            CellStyle tableComponentCellStyle = xlsxWb.createCellStyle();
            tableComponentCellStyle.setBorderTop(BorderStyle.THIN);
            tableComponentCellStyle.setBorderBottom(BorderStyle.THIN);
            tableComponentCellStyle.setBorderLeft(BorderStyle.THIN);
            tableComponentCellStyle.setBorderRight(BorderStyle.THIN);
            tableComponentCellStyle.setAlignment(HorizontalAlignment.RIGHT);
            tableComponentCellStyle.setFont(font);

            // 테이블 컬럼 명 생성
            xssfRow = xssfSheet.createRow(rowNo++);
            xssfCell = xssfRow.createCell((short) 0);
            xssfCell.setCellStyle(tableCellStyle);
            xssfCell.setCellValue("인덱스");
            for (int i = 0; i < components.size(); i++) {
                xssfCell = xssfRow.createCell((short) i + 1);
                xssfCell.setCellStyle(tableCellStyle);
                xssfCell.setCellValue(column_info.get(component_name.get(i)));
            }
            int component_index = 1;
            for (Object object : objectList) {
                xssfRow = xssfSheet.createRow(rowNo++);
                xssfCell = xssfRow.createCell((short) 0);
                xssfCell.setCellStyle(tableComponentCellStyle);
                xssfCell.setCellValue(component_index++);
                for (int i = 0; i < component_name.size(); i++) {
                    Field field = object.getClass().getDeclaredField(component_name.get(i));
                    field.setAccessible(true);
                    Object value = field.get(object);
                    log.info(component_name.get(i) + " : " + value);
                    xssfCell = xssfRow.createCell((short) i + 1);
                    xssfCell.setCellStyle(tableComponentCellStyle);
                    if (value == null) {
                        xssfCell.setCellValue("null");
                    } else if (value.toString().equals("false")) {
                        xssfCell.setCellValue("X");
                    } else if (value.toString().equals("true")) {
                        xssfCell.setCellValue("O");
                    } else {
                        xssfCell.setCellValue(value.toString());
                    }
                }
            }

            for (int i = 0; i <= component_name.size(); i++) {
                xssfSheet.autoSizeColumn(i, true);
                xssfSheet.setColumnWidth(i, (xssfSheet.getColumnWidth(i) + 512));
            }

            String localFile = "E:/Projects/payus/target/payus-0.0.1-SNAPSHOT/WEB-INF/files/" + fileName + ".xlsx";
            File file = new File(localFile);
            FileOutputStream fos = null;
            fos = new FileOutputStream(file);
            xlsxWb.write(fos);
            if (fos != null) fos.close();
        } catch (Exception e) {
            log.error("", e);
        }
    }

    public String makeSalesExcel(List<VendorAdminSalesList> salesList, String path) {
        // .xlsx 확장자 지원
        XSSFWorkbook xlsxWb = new XSSFWorkbook();
        XSSFSheet xssfSheet = null;
        XSSFRow xssfRow = null;
        XSSFCell xssfCell = null;

        log.info("Making Excel from chart...");
        log.info("Printing Column Info...");

        try {
            int rowNo = 0; // 행 갯수

            String title = "PayUs 가계부";
            // 워크시트 생성
            xssfSheet = xlsxWb.createSheet(title);

            // 헤더용 폰트 스타일
            XSSFFont font = xlsxWb.createFont();
            font.setFontName(HSSFFont.FONT_ARIAL);
            font.setFontHeightInPoints((short) 10);

            // 테이블 타이틀 스타일
            /*CellStyle cellStyle_Title = xlsxWb.createCellStyle();
            xssfSheet.setColumnWidth(0, (xssfSheet.getColumnWidth(0) + (short) 2048));
            cellStyle_Title.setFont(font);
            cellStyle_Title.setAlignment(HorizontalAlignment.CENTER);
            xssfSheet.addMergedRegion(new CellRangeAddress(0, 1, 0, components.size()));

            // 타이틀 생성
            xssfRow = xssfSheet.createRow(rowNo++);
            xssfCell = xssfRow.createCell((short) 0);
            // 추가한 행에 셀 객체 추가
            xssfCell.setCellStyle(cellStyle_Title); // 셀에 스타일 지정
            xssfCell.setCellValue(title); // 데이터 입력

            xssfSheet.createRow(rowNo++);
            xssfRow = xssfSheet.createRow(rowNo++); // 빈행 추가*/

            CellStyle tableCellStyle = xlsxWb.createCellStyle();
            tableCellStyle.setBorderTop(BorderStyle.THICK);
            tableCellStyle.setBorderBottom(BorderStyle.THICK);
            tableCellStyle.setBorderLeft(BorderStyle.THICK);
            tableCellStyle.setBorderRight(BorderStyle.THICK);
            tableCellStyle.setAlignment(HorizontalAlignment.CENTER);
            tableCellStyle.setFont(font);

            CellStyle tableComponentCellStyle = xlsxWb.createCellStyle();
            tableComponentCellStyle.setBorderTop(BorderStyle.THIN);
            tableComponentCellStyle.setBorderBottom(BorderStyle.THIN);
            tableComponentCellStyle.setBorderLeft(BorderStyle.THIN);
            tableComponentCellStyle.setBorderRight(BorderStyle.THIN);
            tableComponentCellStyle.setAlignment(HorizontalAlignment.RIGHT);
            tableComponentCellStyle.setFont(font);

            // 테이블 컬럼 명 생성
            xssfRow = xssfSheet.createRow(rowNo++);
            xssfCell = xssfRow.createCell((short) 0);
            xssfCell.setCellStyle(tableCellStyle);
            xssfCell.setCellValue("번호");
            xssfCell = xssfRow.createCell((short) 1);
            xssfCell.setCellStyle(tableCellStyle);
            xssfCell.setCellValue("사용자");
            xssfCell = xssfRow.createCell((short) 2);
            xssfCell.setCellStyle(tableCellStyle);
            xssfCell.setCellValue("결제 금액");
            xssfCell = xssfRow.createCell((short) 3);
            xssfCell.setCellStyle(tableCellStyle);
            xssfCell.setCellValue("페이백률");
            xssfCell = xssfRow.createCell((short) 4);
            xssfCell.setCellStyle(tableCellStyle);
            xssfCell.setCellValue("적립 포인트");
            xssfCell = xssfRow.createCell((short) 5);
            xssfCell.setCellStyle(tableCellStyle);
            xssfCell.setCellValue("결제 일자");
            xssfCell = xssfRow.createCell((short) 6);
            xssfCell.setCellStyle(tableCellStyle);
            xssfCell.setCellValue("결제 상태");


            int component_index = 1;
            for (VendorAdminSalesList sales : salesList) {
                xssfRow = xssfSheet.createRow(rowNo++);
                xssfCell = xssfRow.createCell((short) 0);
                xssfCell.setCellStyle(tableComponentCellStyle);
                xssfCell.setCellValue(component_index++);
                xssfCell = xssfRow.createCell((short) 1);
                xssfCell.setCellStyle(tableComponentCellStyle);
                xssfCell.setCellValue(sales.getUser_name());
                xssfCell = xssfRow.createCell((short) 2);
                xssfCell.setCellStyle(tableComponentCellStyle);
                xssfCell.setCellValue(sales.getPrice() + "원");
                xssfCell = xssfRow.createCell((short) 3);
                xssfCell.setCellStyle(tableComponentCellStyle);
                xssfCell.setCellValue(sales.getPayback_rate() + "%");
                xssfCell = xssfRow.createCell((short) 4);
                xssfCell.setCellStyle(tableComponentCellStyle);
                xssfCell.setCellValue(sales.getPoint() + "P");
                xssfCell = xssfRow.createCell((short) 5);
                xssfCell.setCellStyle(tableComponentCellStyle);
                xssfCell.setCellValue(Time.MsToSecond(sales.getReg_date()));
                xssfCell = xssfRow.createCell((short) 6);
                xssfCell.setCellStyle(tableComponentCellStyle);
                String status;
                if(sales.isStatus()){
                    status = "결제 완료";
                } else {
                    status = "결제 취소";
                }
                xssfCell.setCellValue(status);
            }

            for (int i = 0; i <= salesList.size(); i++) {
                xssfSheet.autoSizeColumn(i, true);
                xssfSheet.setColumnWidth(i, (xssfSheet.getColumnWidth(i) + 512));
            }

            String fileName = "Payus_Supplier_Excel_" + Time.TimeForFile() + ".xlsx";
            File file = new File(path, fileName);
            FileOutputStream fos = null;
            fos = new FileOutputStream(file);
            xlsxWb.write(fos);
            if (fos != null) fos.close();
            return fileName;
        } catch (Exception e) {
            log.error("", e);
            throw new GrantAccessDeniedException(BusinessExceptionType.GRANT_EXCEPTION);
        }
    }


}
