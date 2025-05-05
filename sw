package demo;

import java.io.File;
import java.io.IOException;
import java.util.Locale;
import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.format.UnderlineStyle;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

public class student_excel_write {

    private WritableCellFormat timesBoldUnderline;
    private WritableCellFormat times;
    private String inputFile;

    public void setOutputFile(String inputFile) {
        this.inputFile = inputFile;
    }

    public void write() throws IOException, WriteException {
        File file = new File(inputFile);
        WorkbookSettings wbSettings = new WorkbookSettings();
        wbSettings.setLocale(new Locale("en", "EN"));

        WritableWorkbook workbook = Workbook.createWorkbook(file, wbSettings);
        WritableSheet excelSheet = workbook.createSheet("Report", 0);

        createLabel(excelSheet);
        createContent(excelSheet);

        workbook.write();
        workbook.close();
    }

    private void createLabel(WritableSheet sheet) throws WriteException {
        WritableFont times10pt = new WritableFont(WritableFont.TIMES, 10);
        times = new WritableCellFormat(times10pt);
        times.setWrap(true);

        WritableFont times10ptBoldUnderline = new WritableFont(
            WritableFont.TIMES, 10, WritableFont.BOLD, false, UnderlineStyle.SINGLE);
        timesBoldUnderline = new WritableCellFormat(times10ptBoldUnderline);
        timesBoldUnderline.setWrap(true);

        // Adding Headers
        addCaption(sheet, 0, 0, "Student Name");
        addCaption(sheet, 1, 0, "Subject 1");
        addCaption(sheet, 2, 0, "Subject 2");
        addCaption(sheet, 3, 0, "Subject 3");
    }

    private void createContent(WritableSheet sheet) throws WriteException {
        for (int i = 1; i <= 10; i++) {
            addLabel(sheet, 0, i, "Student " + i);
            addNumber(sheet, 1, i, (i * i) + 10);
            addNumber(sheet, 2, i, (i * i) + 4);
            addNumber(sheet, 3, i, (i * i) + 3);
        }
    }

    private void addCaption(WritableSheet sheet, int column, int row, String text)
            throws WriteException {
        Label label = new Label(column, row, text, timesBoldUnderline);
        sheet.addCell(label);
    }

    private void addNumber(WritableSheet sheet, int column, int row, Integer value)
            throws WriteException {
        Number number = new Number(column, row, value, times);
        sheet.addCell(number);
    }

    private void addLabel(WritableSheet sheet, int column, int row, String text)
            throws WriteException {
        Label label = new Label(column, row, text, times);
        sheet.addCell(label);
    }

    public static void main(String[] args) throws WriteException, IOException {
        student_excel_write test = new student_excel_write();
        test.setOutputFile("D:\\Student.xls");
        test.write();
        System.out.println("File generated: D:\\Student.xls");
    }
}
