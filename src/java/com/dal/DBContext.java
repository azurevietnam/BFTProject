package com.dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Random;

public class DBContext {

    private Connection connection;

    public Connection getConnection() {
        return connection;
    }

    /**
     * open DB connection
     *
     * @throws Exception
     */
    public DBContext() throws Exception {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=BFTSystem";
        connection = DriverManager.getConnection(url, "sa", "123456");
    }

    public void close() throws Exception {
        if (connection != null) {
            connection.close();
        }
    }

    /**
     * Get random primary key for all table
     *
     * @return random string length 6
     */
    public String getPrimaryKey() {
        Random rand = new Random();
        String result = "";
        final String CHARACTER = "1234567890QWERTYUIOPASDFGHJKLZXCVBNM";
        for (int i = 0; i < 6; i++) {
            result += CHARACTER.charAt(rand.nextInt(CHARACTER.length()));
        }
        return result;
    }

}
