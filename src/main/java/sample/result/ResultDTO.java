/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.result;

/**
 *
 * @author Tranduc
 */
public class ResultDTO {
    private String stuID;
    private int resultID;
    private String comment;
    private String status;
    private int grade;
    private int appID;

    public ResultDTO() {
    }

    public ResultDTO(String stuID, int resultID, String comment, String status, int grade, int appID) {
        this.stuID = stuID;
        this.resultID = resultID;
        this.comment = comment;
        this.status = status;
        this.grade = grade;
        this.appID = appID;
    }

   

    public int getAppID() {
        return appID;
    }

    public void setAppID(int appID) {
        this.appID = appID;
    }

    

    public String getStuID() {
        return stuID;
    }

    public void setStuID(String stuID) {
        this.stuID = stuID;
    }

    public int getResultID() {
        return resultID;
    }

    public void setResultID(int resultID) {
        this.resultID = resultID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

  

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }
    
}
