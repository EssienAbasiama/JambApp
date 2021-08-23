package com.jambApp.models;

public class AdminModel {
    protected String firstName;
    protected String lastName;
    protected String middleName;
    protected String staffNum;



    public AdminModel(String firstName, String lastName, String middleName, String staffNum) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.middleName = middleName;
        this.staffNum = staffNum;
    }
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    //lastName
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    //middleName
    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getStaffNum() {
        return firstName;
    }

    public void setStaffNum(String staffNum) {
        this.staffNum = staffNum;
    }
}
