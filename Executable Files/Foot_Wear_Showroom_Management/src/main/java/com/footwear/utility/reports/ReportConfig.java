package com.footwear.utility.reports;

public class ReportConfig {

    private ReportConfig() {

    }

    // Windows

    public static final String REPORT_PATH_WINDOWS =
            "C:\\Users\\Lenovo\\Desktop\\app_storage\\reports_pdf";

    // Linux

    public static final String REPORT_PATH_LINUX =
            System.getProperty("user.home")
                    + "/app_storage/reports_pdf";

}