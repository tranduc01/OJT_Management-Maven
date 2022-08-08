/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.account;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import sample.utils.DBUtils;

/**
 *
 * @author Tranduc
 */
public class AccountDAO {

    public static ArrayList<AccountDTO> getAccounts() throws SQLException {
        ArrayList<AccountDTO> list = new ArrayList<>();
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [accID],[email],[password],[name],[phone],[birthday],[avatar],[createDate],[roleID],[status]\n"
                        + "from Account";
                st = cn.createStatement();
                rs = st.executeQuery(sql);
                while (rs != null && rs.next()) {
                    int accid = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    Date birthday = rs.getDate("birthday");
                    Date createdate = rs.getDate("createDate");
                    int roleid = rs.getInt("roleID");
                    int status = rs.getInt("status");
                    AccountDTO acc = new AccountDTO(accid, Email, Password, name, phone, avatar, birthday, roleid, status, createdate);
                    list.add(acc);
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

    public static AccountDTO loginAccount(String email, String password) throws SQLException {
        AccountDTO acc = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [accID],[email],[password],[name],[phone],[birthday],[avatar],[createDate],[roleID],[status]\n"
                        + "from Account\n"
                        + "where status=1 and email=? and password=? Collate Latin1_General_CS_AS";
                pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int accid = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    Date birthday = rs.getDate("birthday");
                    Date createdate = rs.getDate("createDate");
                    int roleid = rs.getInt("roleID");
                    int status = rs.getInt("status");
                    acc = new AccountDTO(accid, Email, Password, name, phone, avatar, birthday, roleid, status, createdate);
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
        return acc;
    }

    public static AccountDTO loginAccount_V2(String email) throws SQLException {
        AccountDTO acc = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [accID],[email],[password],[name],[phone],[birthday],[avatar],[createDate],[roleID],[status]\n"
                        + "from Account\n"
                        + "where status=1 and email=?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int accid = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    Date birthday = rs.getDate("birthday");
                    Date createdate = rs.getDate("createDate");
                    int roleid = rs.getInt("roleID");
                    int status = rs.getInt("status");
                    acc = new AccountDTO(accid, Email, Password, name, phone, avatar, birthday, roleid, status, createdate);
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
        return acc;
    }

    public static AccountDTO getAccountByID(int accID) throws SQLException {
        AccountDTO acc = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [accID],[email],[password],[name],[phone],[birthday],[avatar],[createDate],[roleID],[status]\n"
                        + "from Account\n"
                        + "where status=1 and Account.[accID]=?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, accID);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int accid = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    Date birthday = rs.getDate("birthday");
                    Date createdate = rs.getDate("createDate");
                    int roleid = rs.getInt("roleID");
                    int status = rs.getInt("status");
                    acc = new AccountDTO(accid, Email, Password, name, phone, avatar, birthday, roleid, status, createdate);
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
        return acc;
    }

    public static AccountDTO getAccountByIDV2(int accID) throws SQLException {
        AccountDTO acc = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [accID],[email],[password],[name],[phone],[birthday],[avatar],[createDate],[roleID],[status]\n"
                        + "from Account\n"
                        + "where Account.[accID]=?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, accID);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int accid = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    Date birthday = rs.getDate("birthday");
                    Date createdate = rs.getDate("createDate");
                    int roleid = rs.getInt("roleID");
                    int status = rs.getInt("status");
                    acc = new AccountDTO(accid, Email, Password, name, phone, avatar, birthday, roleid, status, createdate);
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
        return acc;
    }

    public static int updateAvatarPath(String email, String newPath) throws SQLException {
        int result = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [Account]\n"
                        + "set [avatar]=?\n"
                        + "where email=?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, newPath);
                pst.setString(2, email);
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
    public static int changeStatusAccount(int accID, int status) throws SQLException {
        int result = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [Account]\n"
                        + "set [status]=?\n"
                        + "where accID=?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, accID);
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

    public static int updateProfile(String email, String newName, String newPhone, String newBirthday) throws SQLException {
        int result = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [Account]\n"
                        + "set [name]=?,phone=?,birthday=?\n"
                        + "where email=?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, newName);
                pst.setString(2, newPhone);
                pst.setString(3, newBirthday);
                pst.setString(4, email);
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

    public static int updateProfileAdmin(int accID,String email, String newName, String newPhone, String newBirthday,int status) throws SQLException {
        int result = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [Account]\n"
                        + "set [email]=?,[name]=?,[phone]=?,[birthday]=?,[status]=?\n"
                        + "where accID=?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, newName);
                pst.setString(3, newPhone);
                pst.setString(4, newBirthday);
                pst.setInt(5, status);
                pst.setInt(6, accID);
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

    public static int changePassword(String email, String newpassword) throws SQLException {
        int result = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [Account]\n"
                        + "set password=?\n"
                        + "where email=?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, newpassword);
                pst.setString(2, email);
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

    public static int insertAccount(String password, String email, String name, String phone, String birthday, String createDate, int roleID, int status) throws SQLException {
        int result = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into Account([password],[email],[name],[phone],[birthday],[createDate],[roleID],[status]) values(?,?,?,?,?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, password);
                pst.setString(2, email);
                pst.setString(3, name);
                pst.setString(4, phone);
                pst.setString(5, birthday);
                pst.setString(6, createDate);
                pst.setInt(7, roleID);
                pst.setInt(8, status);
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
