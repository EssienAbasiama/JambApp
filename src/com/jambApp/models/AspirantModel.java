package com.jambApp.models;

import java.sql.Date;

public class AspirantModel {
    private String registrationNumber;
    protected String firstName;
    protected String lastName;
    protected String middleName;
    protected Date dateOfBirth;
    protected String address;
    protected String email;
    protected String nIN;
    protected String gender;
    protected String stateOfOrigin;
    protected String institution;
    protected String course;

    //Constructors
    public AspirantModel() {

    }
    public AspirantModel(String registrationNumber, String firstName, String lastName, String middleName,
                         Date dateOfBirth, String address, String email, String nIN, String gender, String state,
                         String institution, String course) {
        this.registrationNumber = registrationNumber;
        this.firstName = firstName;
        this.lastName = lastName;
        this.middleName = middleName;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.email = email;
        this.nIN = nIN;
        this.gender = gender;
        this.stateOfOrigin = state;
        this.institution = institution;
        this.course = course;
    }

    //Registration Number
    public String getRegistrationNumber() {
        return registrationNumber;
    }

    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    //firstName
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

    //dateOfBirth
    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    //address
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    //email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    //NiN
    public String getNin() {
        return nIN;
    }

    public void setNin(String nIN) {
        this.nIN = nIN;
    }

    //Gender
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    //stateOfOrigin
    public String getStateOfOrigin() {
        return stateOfOrigin;
    }

    public void setStateOfOrigin(String stateOfOrigin) {
        this.stateOfOrigin = stateOfOrigin;
    }

    //Institution
    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    //Course
    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    // To String
    public static void toString(AspirantModel list) {
        String string = list.getRegistrationNumber() + "\t\t\t\t" + list.getFirstName() + "\t\t\t\t"
                + list.getLastName() + "\t\t\t\t" + list.getMiddleName() + "\t\t\t\t"
                + list.getDateOfBirth() + "\t\t\t\t" + list.getAddress() + "\t\t\t\t"
                + list.getEmail() + "\t\t\t\t" + list.getNin() + "\t\t\t\t" + list.getGender()
                + "\t\t\t\t" + list.getStateOfOrigin() + "\t\t\t\t" + list.getInstitution() + "\t\t\t\t"
                + list.getCourse();
        System.out.println(string);
    }
}
