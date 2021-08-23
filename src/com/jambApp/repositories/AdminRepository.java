package com.jambApp.repositories;

import com.jambApp.configurations.db.DBConnectionFactory;

import java.sql.*;

public class AdminRepository {
    static Connection connection;
    static Statement statement;
    static ResultSet resultSet;

    public AdminRepository() throws ClassNotFoundException, SQLException {
        connection = DBConnectionFactory.createAdminConnection();
    }

    public static boolean validation (String eMail, String passWord) throws SQLException {
        statement = connection.createStatement();
        resultSet = statement.executeQuery("select * from admin");
        while (resultSet.next()) {
            String email = resultSet.getString(1);
            String password = resultSet.getString(2);
            if(email.equals(eMail) && password.equals(passWord)) {
                return true;
            }
        }
        return false;
    }
}