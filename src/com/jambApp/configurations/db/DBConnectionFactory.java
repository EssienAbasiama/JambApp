package com.jambApp.configurations.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionFactory  {
    static Connection connection;
     public static Connection createConnection() throws ClassNotFoundException, SQLException {
        //Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("Driver Loaded Successfully.");

        //Connect to database.
         String url = "jdbc:mysql://localhost/jambapp?userTimeZone=UTC&serverTimeZone=UTC";
        connection = DriverManager.getConnection(url, "root", "Tetfunds01.");
        System.out.println("Connected to DB Successfully.");

        return connection;
    }

    public static Connection createAdminConnection() throws ClassNotFoundException, SQLException {
        //Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("Driver Loaded Successfully.");

        //Connect to database.
        String url = "jdbc:mysql://localhost/adminvalidation?userTimeZone=UTC&serverTimeZone=UTC";
        connection = DriverManager.getConnection(url, "root", "Tetfunds01.");
        System.out.println("Connected to DB Successfully.");

        return connection;
    }

}
