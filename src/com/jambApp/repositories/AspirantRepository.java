package com.jambApp.repositories;

import com.jambApp.configurations.db.DBConnectionFactory;
import com.jambApp.models.AspirantModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AspirantRepository {
    public static List<AspirantModel> studentsSameSchool = new ArrayList<>();

    static Statement statement;
    static ResultSet resultSet;
    static Connection connection;

    public AspirantRepository() throws ClassNotFoundException, SQLException {
        connection = DBConnectionFactory.createConnection();
    }

//List All Aspirant
    public List<AspirantModel> listAllAspirant()  {
        List<AspirantModel> students = new ArrayList<>();
        try{
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select * from registrationnumber ");
            while (resultSet.next()) {
                AspirantModel regmods = resultant(resultSet);
                students.add(regmods);
            }
        }
        catch(Exception e) {
            System.out.println(e.getMessage());
        }
        return students;
    }

    //find aspirants with Reg No
    public AspirantModel findAspirantsWithRegNo(String regno) throws SQLException {
        statement = connection.createStatement();
        resultSet = statement.executeQuery("select * from registrationnumber where Regno = '" + regno + "'");
        while(resultSet.next()) {
            AspirantModel regmods = resultant(resultSet);
            return regmods;
        }
        return null;
    }

    //Find Candidate in same School
    public List<AspirantModel> findaspirantInSameSchool(String institution) throws SQLException {
        statement = connection.createStatement();
        resultSet = statement.executeQuery("select * from registrationnumber where institution = '"+institution+"'");
        while (resultSet.next()) {
            AspirantModel regmods = resultant(resultSet);
            studentsSameSchool.add(regmods);
        }
        return studentsSameSchool;
    }

    public AspirantModel resultant(ResultSet resultSet) throws SQLException {
        String registrationNumber = resultSet.getString(1);
        String firstName = resultSet.getString(2);
        String lastName = resultSet.getString(3);
        String middleName = resultSet.getString(4);
        Date dateOfBirth = resultSet.getDate(5);
        String address = resultSet.getString(6);
        String email = resultSet.getString(7);
        String nIN = resultSet.getString(8);
        String gender = resultSet.getString(9);
        String stateOfOrigin = resultSet.getString(10);
        String ins = resultSet.getString(11);
        String course = resultSet.getString(12);
        AspirantModel regmods = new AspirantModel(registrationNumber, firstName, lastName, middleName,
                dateOfBirth, address, email, nIN, gender, stateOfOrigin, ins, course);
        return regmods;
    }

    //Registering Aspirants
    public boolean registerAspirants(String firstName, String lastName, String middleName,
                                            Date dateOfBirth, String address, String email, String nIN, String gender, String state,
                                            String institution, String course) {

        //Generating Registration Number
        char randomletters = (char) ((int) (65 + Math.random() * 27));
        String stringrandomLetters = randomletters + "";

        String randomnumbers = (int) (Math.random() * 10) + "";
        String stringrandomNumbers = randomnumbers + "";

        String registrationNumber = stringrandomLetters + stringrandomLetters + stringrandomLetters + stringrandomNumbers
                + stringrandomNumbers + stringrandomNumbers + stringrandomNumbers + stringrandomLetters
                + stringrandomLetters;
        return executionSQL(registrationNumber, firstName, lastName, middleName,
                dateOfBirth, address, email, nIN, gender, state,
                institution, course);
    }
//Executing Sql
    public static boolean executionSQL(String registrationNumber, String firstName, String lastName, String middleName,
                                       Date dateOfBirth, String address, String email, String nIN, String gender, String state,
                                       String institution, String course) {
        try {
            Statement statement = connection.createStatement();
            int count = statement.executeUpdate("insert into registrationnumber (RegNo, firstName, lastName, middleName,DateOfBirth, address, email, NIN, gender, state, institution, course) values('"
                    + registrationNumber + "', '" + firstName + "', '" + lastName + "',  '" + middleName + "','"
                    + dateOfBirth + "', '" + address + "', '" + email + "', '" + nIN + "','" + gender + "', '"
                    + state + "', '" + institution + "', '" + course + "')");
            if (count > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
    //Update Sql
    public static boolean updateAspirant(String registrationNumber,String firstName, String lastName, String middleName,
                                         Date dateOfBirth, String address, String email, String nIN, String gender, String state,
                                         String institution, String course) {
        try{
            Statement statement = connection.createStatement();
            int count = statement.executeUpdate("UPDATE registrationnumber SET firstName = '" + firstName + "', lastName = '" + lastName
                    + "', middleName = '" + middleName + "', dateOfBirth = '" + dateOfBirth + "', email = '"
                    + email + "',  address = '" + address + "', email = '" + email + "', nIN = '" + nIN
                    + "', gender = '" + gender + "',  state = '" + state + "',  institution = '"
                    + institution + "',  course = '" + course + "' where RegNo = '" + registrationNumber + "'");
            if (count > 0) {
                return true;
            }
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
//Delete SQL
    public boolean deleteCandidateInfo(String regnO) {
        Statement statement;
        try {
            statement = connection.createStatement();
            int count = statement.executeUpdate("delete from registrationnumber where RegNo = '" + regnO + "'");
            if (count > 0) {
                return true;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
}
