import java.io.File;
import java.io.IOException;

import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.format.UnderlineStyle;
import jxl.write.*;
import jxl.write.biff.RowsExceededException;
import jxl.write.Number;

public class StudentExcelWriter {
    public static void main(String[] args) throws IOException, WriteException :
        File file = new File("D:\\Student.xls");
        WorkbookSettings settings = new WorkbookSettings();
        settings.setLocale(new java.util.Locale("en", "EN"));

        WritableWorkbook workbook = Workbook.createWorkbook(file, settings);
        WritableSheet sheet = workbook.createSheet("Report", 0);

        WritableFont normalFont = new WritableFont(WritableFont.TIMES, 10);
        WritableCellFormat normalFormat = new WritableCellFormat(normalFont);

        WritableFont boldUnderlineFont = new WritableFont(
            WritableFont.TIMES, 10, WritableFont.BOLD, false, UnderlineStyle.SINGLE
        );
        WritableCellFormat boldUnderlineFormat = new WritableCellFormat(boldUnderlineFont);

        String[] headers = {"Student Name", "Subject 1", "Subject 2", "Subject 3"};
        for (int i = 0; i < headers.length; i++) {
            sheet.addCell(new Label(i, 0, headers[i], boldUnderlineFormat));
        }

        for (int i = 1; i <= 10; i++) {
            sheet.addCell(new Label(0, i, "Student " + i, normalFormat));
            sheet.addCell(new Number(1, i, i * i + 10, normalFormat));
            sheet.addCell(new Number(2, i, i * i + 4, normalFormat));
            sheet.addCell(new Number(3, i, i * i + 3, normalFormat));
        }

        workbook.write();
        workbook.close();
        System.out.println("File generated: D:\\Student.xls");
    }
}
