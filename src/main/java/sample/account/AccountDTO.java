/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.account;

import java.sql.Date;

/**
 *
 * @author Tranduc
 */
public class AccountDTO {
    private int accId;
    private String email;
    private String password;
    private String name;
    private String phone;
    private String avatar;
    private Date birthday;
    private int role;
    private int status;
    private Date crateDate;


    public AccountDTO() {
    }

    public AccountDTO(int accId, String email, String password, String name, String phone, String avatar, Date birthday, int role, int status, Date crateDate) {
        this.accId = accId;
        this.email = email;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.avatar = avatar;
        this.birthday = birthday;
        this.role = role;
        this.status = status;
        this.crateDate = crateDate;
    }

   

    

    
 

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    

    
    

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCrateDate() {
        return crateDate;
    }

    public void setCrateDate(Date crateDate) {
        this.crateDate = crateDate;
    }

    @Override
    public String toString() {
        return "AccountDTO{" + "accId=" + accId + ", email=" + email + ", password=" + password + ", name=" + name + ", phone=" + phone + ", avatar=" + avatar + ", role=" + role + ", status=" + status + ", crateDate=" + crateDate + '}';
    }
    
}
