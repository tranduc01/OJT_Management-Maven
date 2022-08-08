/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.mailbox;

import java.sql.Date;

/**
 *
 * @author Tranduc
 */
public class MailBoxDTO {
    private int boxID;
    private String name;
    private String email;
    private String phone;
    private String companyName;
    private String major;
    private String description;
    private String url;
    private int status;
    private Date sendDate;

    public MailBoxDTO() {
    }

    public MailBoxDTO(int boxID, String name, String email, String phone, String companyName, String major, String description, String url, int status, Date sendDate) {
        this.boxID = boxID;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.companyName = companyName;
        this.major = major;
        this.description = description;
        this.url = url;
        this.status = status;
        this.sendDate = sendDate;
    }

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    

    public int getBoxID() {
        return boxID;
    }

    public void setBoxID(int boxID) {
        this.boxID = boxID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    
    
    
}
