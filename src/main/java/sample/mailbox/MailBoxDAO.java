/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.mailbox;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import sample.account.AccountDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Tranduc
 */
public class MailBoxDAO {

    public static ArrayList<MailBoxDTO> getMailBox() throws SQLException {
        ArrayList<MailBoxDTO> list = new ArrayList<>();
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [boxID],[name],[email],[phone],[companyName],[major],[description],[url],status,sendDate\n"
                        + "from [dbo].[MailBox]\n"
                        +"order by sendDate desc";
                st = cn.createStatement();
                rs = st.executeQuery(sql);
                while (rs != null && rs.next()) {
                    int boxid = rs.getInt("boxID");
                    String Email = rs.getString("email");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String major = rs.getString("major");
                    String comname = rs.getString("companyName");
                    String description = rs.getString("description");
                    String url = rs.getString("url");
                    int status = rs.getInt("status");
                    Date sendDate = rs.getDate("sendDate");
                    MailBoxDTO mail = new MailBoxDTO(boxid, name, Email, phone, comname, major, description, url, status, sendDate);
                    list.add(mail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;
    }

    public static ArrayList<MailBoxDTO> getMailStatus(int status) throws SQLException {
        ArrayList<MailBoxDTO> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [boxID],[name],[email],[phone],[companyName],[major],[description],[url],status,sendDate\n"
                        + "from [dbo].[MailBox]\n"
                        + "where status=?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int boxid = rs.getInt("boxID");
                    String Email = rs.getString("email");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String major = rs.getString("major");
                    String comname = rs.getString("companyName");
                    String description = rs.getString("description");
                    String url = rs.getString("url");
                    int statuss = rs.getInt("status");
                    Date sendDate = rs.getDate("sendDate");
                    MailBoxDTO mail = new MailBoxDTO(boxid, name, Email, phone, comname, major, description, url, statuss, sendDate);
                    list.add(mail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;
    }

    public static int insertMailBox(String name, String email, String phone, String companyName, String major, String desciption, String url, int status, Date sendDate) throws SQLException {
        int result = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into MailBox([name],[email],[phone],[companyName],[major],[description],[url],status,sendDate) values(?,?,?,?,?,?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, email);
                pst.setString(3, phone);
                pst.setString(4, companyName);
                pst.setString(5, major);
                pst.setString(6, desciption);
                pst.setString(7, url);
                pst.setInt(8, status);
                pst.setDate(9, sendDate);
                pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (pst != null) {
                pst.close();
            }
        }
        return result;
    }

    public static int updateMailStatus(int mailID, int status) throws SQLException {
        int result = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [MailBox]\n"
                        + "set [status]=?\n"
                        + "where boxID=?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, mailID);
                pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (pst != null) {
                pst.close();
            }
        }
        return result;
    }
}
