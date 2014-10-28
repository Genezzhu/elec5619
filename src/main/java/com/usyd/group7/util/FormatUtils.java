package com.usyd.group7.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Zhengan Zhu.
 */
public class FormatUtils {
    public static final SimpleDateFormat TIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    public static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    public static final String formatDate(Date date){
        return DATE_FORMAT.format(date);
    }

    public static final String formatTime(Date date){
        return TIME_FORMAT.format(date);
    }

    public static final String formatTime(Timestamp timestamp){
        return TIME_FORMAT.format(timestamp);
    }
}
