/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.application;

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
public class ApplicationDAO {

    public static ArrayList<ApplicationDTO> getApplicationByID(String stuID) throws SQLException {
        ArrayList<ApplicationDTO> list = new ArrayList<>();
        ApplicationDTO app = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [applyID],[applyDate],[stuID],[jobID],[status],[stu_confirm],[com_comfirm]\n"
                        + "from Application\n"
                        + "where stuID=?\n"
                        + "order by applyDate desc";
                pst = cn.prepareStatement(sql);
                pst.setString(1, stuID);
                rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int applyID = rs.getInt("applyID");
                    Date applyDate = rs.getDate("applyDate");
                    String stuid = rs.getString("stuID");
                    int jobID = rs.getInt("jobID");
                    int status = rs.getInt("status");
                    int stuconfirm = rs.getInt("stu_confirm");
                    int comconfirm = rs.getInt("com_comfirm");
                    app = new ApplicationDTO(applyID, applyDate, stuid, jobID, status, stuconfirm, comconfirm);
                    list.add(app);
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

    public static ArrayList<ApplicationDTO> getApplicationByIDV2(String stuID) throws SQLException {
        ArrayList<ApplicationDTO> list = new ArrayList<>();
        ApplicationDTO app = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [applyID],[applyDate],[stuID],[jobID],[status],[stu_confirm],[com_comfirm]\n"
                        + "from Application\n"
                        + "where stuID=? and status=1\n"
                        + "order by applyDate desc";
                pst = cn.prepareStatement(sql);
                pst.setString(1, stuID);
                rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int applyID = rs.getInt("applyID");
                    Date applyDate = rs.getDate("applyDate");
                    String stuid = rs.getString("stuID");
                    int jobID = rs.getInt("jobID");
                    int status = rs.getInt("status");
                    int stuconfirm = rs.getInt("stu_confirm");
                    int comconfirm = rs.getInt("com_comfirm");
                    app = new ApplicationDTO(applyID, applyDate, stuid, jobID, status, stuconfirm, comconfirm);
                    list.add(app);
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
    public static int insertApplication(int status, Date appllyDate, int stu_confirm, int com_comfirm, String stuID, int jobID) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        int result = 0;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into [Application]([status],[applyDate],[stu_confirm],[com_comfirm],[stuID],[jobID]) "
                        + "values (?,?,?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setDate(2, appllyDate);
                pst.setInt(3, stu_confirm);
                pst.setInt(4, com_comfirm);
                pst.setString(5, stuID);
                pst.setInt(6, jobID);
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

    public static ArrayList<ApplicationDTO> getApplications() throws SQLException {
        ArrayList<ApplicationDTO> list = new ArrayList<>();
        ApplicationDTO app = null;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [applyID],[applyDate],[stuID],[jobID],[status],[stu_confirm],[com_comfirm]\n"
                        + "from Application\n"
                        + "order by applyDate desc";
                st = cn.createStatement();
                rs = st.executeQuery(sql);
                while (rs != null && rs.next()) {
                    int applyID = rs.getInt("applyID");
                    Date applyDate = rs.getDate("applyDate");
                    String stuid = rs.getString("stuID");
                    int jobID = rs.getInt("jobID");
                    int status = rs.getInt("status");
                    int stuconfirm = rs.getInt("stu_confirm");
                    int comconfirm = rs.getInt("com_comfirm");
                    app = new ApplicationDTO(applyID, applyDate, stuid, jobID, status, stuconfirm, comconfirm);
                    list.add(app);
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



    
    
    public static int SendOffer(Date appllyDate, String stuID, int jobID) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        int result = 0;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into [Application]([status],[applyDate],[stu_confirm],[com_comfirm],[stuID],[jobID]) "
                        + "values (2,?,0,1,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setDate(1, appllyDate);
                pst.setString(2, stuID);
                pst.setInt(3, jobID);
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

    public static void AcceptOJTApplication(int id) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[Application]\n"
                        + "SET [status] = 1, [stu_confirm] = 1,[com_comfirm] = 1\n"
                        + "WHERE Application.applyID = ?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
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
    }
    
    
    
    public static void RejectOJTApplication(int id) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[Application]\n"
                        + "SET [status] = 3, [stu_confirm] = 1,[com_comfirm] = 2\n"
                        + "WHERE Application.applyID = ?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
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
    }
}
