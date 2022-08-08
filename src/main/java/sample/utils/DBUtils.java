/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Tranduc
 */
public class DBUtils {
    public static Connection makeConnection() throws Exception{
//        Connection cn=null;
//        String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
//        String url="jdbc:sqlserver://localhost:1433;databaseName=OJT_Management;user=sa;password=12345?sslmode=require";
//        Class.forName(driver);
//        cn=DriverManager.getConnection(url);
//        return cn;
Connection cn=null;
        String driver="org.postgresql.Driver";
        String username="qgcltjgrlyeykk";
        String password="d7f4e17b3d6fbecc728efcfd7bb6125bde56d3c47523b00be7bdb70ad5d3ad8c";
        String url="jdbc:postgresql://ec2-3-248-121-12.eu-west-1.compute.amazonaws.com:5432/dep6aedi3f72e1?sslmode=require";
        Class.forName(driver);
        cn=DriverManager.getConnection(url,username,password);
        return cn;
    }
}
