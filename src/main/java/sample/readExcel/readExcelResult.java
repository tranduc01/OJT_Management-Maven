/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.readExcel;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import static sample.controller.ImportResultController.COLUMN_INDEX_STUID;
import static sample.controller.ImportResultController.COLUMN_INDEX_GRADE;
import static sample.controller.ImportResultController.COLUMN_INDEX_COMMENT;
import static sample.controller.ImportResultController.COLUMN_INDEX_STATUS;

import sample.result.ResultDTO;


/**
 *
 * @author Tranduc
 */
public class readExcelResult {
    public static ArrayList<ResultDTO> readExcelResult(String filePath) throws IOException {
         ArrayList<ResultDTO> list = new ArrayList<>();
        FileInputStream inputStream = new FileInputStream(new File(filePath));

        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);

        Sheet firstSheet = workbook.getSheetAt(0);

        Iterator<Row> iterator = firstSheet.iterator();
        while (iterator.hasNext()) {
            Row nextRow = iterator.next();

            if (nextRow.getRowNum() == 0) {
                // Ignore header
                continue;
            }
            Iterator<Cell> cellIterator = nextRow.cellIterator();
            ResultDTO st = new ResultDTO();
            while (cellIterator.hasNext()) {
                Cell cell = cellIterator.next();
                Object cellValue = getCellValue(cell);
                if (cellValue == null || cellValue.toString().isEmpty()) {
                    continue;
                }
                // Set value for book object
                int columnIndex = cell.getColumnIndex();
                switch (columnIndex) {
                    case COLUMN_INDEX_STUID:
                        st.setStuID((String) getCellValue(cell));
                        break;
                    case COLUMN_INDEX_GRADE:
                        st.setGrade(new BigDecimal((double) cellValue).intValue());
                        break;
                    case COLUMN_INDEX_COMMENT:
                        st.setComment((String) getCellValue(cell));
                        break;
                    case COLUMN_INDEX_STATUS:
                        st.setStatus((String) getCellValue(cell));
                        break;
                }

            }
            list.add(st);
        }

        workbook.close();
        inputStream.close();
        return list;
    }

    private static Object getCellValue(Cell cell) {
        CellType cellType = cell.getCellType();
        Object cellValue = null;
        switch (cellType) {
            case BOOLEAN:
                cellValue = cell.getBooleanCellValue();
                break;

            case NUMERIC:
                cellValue = cell.getNumericCellValue();
                break;
            case STRING:
                cellValue = cell.getStringCellValue();
                break;
            case _NONE:
            case BLANK:
            case ERROR:
                break;
            default:
                break;
        }
        return cellValue;
    }
}