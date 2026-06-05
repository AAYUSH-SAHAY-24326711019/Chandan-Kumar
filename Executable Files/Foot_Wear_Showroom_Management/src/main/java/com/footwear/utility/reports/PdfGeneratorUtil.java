package com.footwear.utility.reports;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class PdfGeneratorUtil {

    public String generatePdf(
            String tableName,
            String orientation,
            List<Map<String, Object>> data)
            throws Exception {

        String reportDirectory =
                getReportDirectory();

        File directory =
                new File(reportDirectory);

        if (!directory.exists()) {
            directory.mkdirs();
        }

        String fileName =
                tableName + "_"
                        + new SimpleDateFormat(
                                "yyyyMMdd_HHmmss")
                                .format(new Date())
                        + ".pdf";

        String fullPath =
                reportDirectory
                        + File.separator
                        + fileName;

        Document document;

        if ("landscape".equalsIgnoreCase(
                orientation)) {

            document =
                    new Document(
                            PageSize.A4.rotate());
        } else {

            document =
                    new Document(PageSize.A4);
        }

        PdfWriter.getInstance(
                document,
                new FileOutputStream(fullPath));

        document.open();

        addHeader(
                document,
                tableName,
                data.size());

        if (!data.isEmpty()) {

            addTable(
                    document,
                    data);
        }

        document.close();

        return fullPath;
    }

    private void addHeader(
            Document document,
            String tableName,
            int totalRecords)
            throws Exception {

        Font titleFont =
                new Font(
                        Font.FontFamily.HELVETICA,
                        18,
                        Font.BOLD);

        Paragraph title =
                new Paragraph(
                        "FOOTWEAR SHOWROOM REPORT",
                        titleFont);

        title.setAlignment(
                Element.ALIGN_CENTER);

        document.add(title);

        document.add(
                Chunk.NEWLINE);

        document.add(
                new Paragraph(
                        "Table : "
                                + tableName));

        document.add(
                new Paragraph(
                        "Generated At : "
                                + new Date()));

        document.add(
                new Paragraph(
                        "Total Records : "
                                + totalRecords));

        document.add(
                Chunk.NEWLINE);
    }

    private void addTable(
            Document document,
            List<Map<String, Object>> data)
            throws Exception {

        Map<String, Object> firstRow =
                data.get(0);

        int columnCount =
                firstRow.size();

        PdfPTable table =
                new PdfPTable(columnCount);

        table.setWidthPercentage(100);

        for (String header :
                firstRow.keySet()) {

            PdfPCell cell =
                    new PdfPCell(
                            new Phrase(
                                    header));

            cell.setBackgroundColor(
                    BaseColor.LIGHT_GRAY);

            cell.setHorizontalAlignment(
                    Element.ALIGN_CENTER);

            table.addCell(cell);
        }

        boolean alternate = false;

        for (Map<String, Object> row :
                data) {

            for (Object value :
                    row.values()) {

                PdfPCell cell =
                        new PdfPCell(
                                new Phrase(
                                        value == null
                                                ? ""
                                                : value.toString()));

                if (alternate) {

                    cell.setBackgroundColor(
                            new BaseColor(
                                    245,
                                    245,
                                    245));
                }

                table.addCell(cell);
            }

            alternate = !alternate;
        }

        document.add(table);
    }

    private String getReportDirectory() {

        String os =
                System.getProperty(
                        "os.name")
                        .toLowerCase();

        if (os.contains("win")) {

            return ReportConfig.REPORT_PATH_WINDOWS;
        }

        return ReportConfig.REPORT_PATH_LINUX;
    }
}