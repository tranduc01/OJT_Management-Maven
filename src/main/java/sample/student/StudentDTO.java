/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.student;

/**
 *
 * @author Tranduc
 */
public class StudentDTO {
    private String studentName;
    private String studentID;
    private String semesterID;
    private String email;
    private String majorID;
    private String cvPath;
    private int accID;

    public StudentDTO() {
    }

    public StudentDTO(String studentName, String studentID, String semesterID, String email, String majorID, String cvPath, int accID) {
        this.studentName = studentName;
        this.studentID = studentID;
        this.semesterID = semesterID;
        this.email = email;
        this.majorID = majorID;
        this.cvPath = cvPath;
        this.accID = accID;
    }

    public String getCvPath() {
        return cvPath;
    }

    public void setCvPath(String cvPath) {
        this.cvPath = cvPath;
    }

   

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getSemesterID() {
        return semesterID;
    }

    public void setSemesterID(String semesterID) {
        this.semesterID = semesterID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMajorID() {
        return majorID;
    }

    public void setMajorID(String majorID) {
        this.majorID = majorID;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    @Override
    public String toString() {
        return "StudentDTO{" + "studentName=" + studentName + ", studentID=" + studentID + ", semesterID=" + semesterID + ", email=" + email + ", majorID=" + majorID + ", cvPath=" + cvPath + ", accID=" + accID + '}';
    }

    

    
    
  
}
