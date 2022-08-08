/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.result;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import sample.job.JobDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Tranduc
 */
public class ResultDAO {

    public static int insertResult(String comment, int grade, String status, int appID) throws SQLException {
        int result = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into [OJT_Result]([comment],[grade],[status],appID) values(?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, comment);
                pst.setInt(2, grade);
                pst.setString(3, status);
                pst.setInt(4, appID);
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

    public static int UpdateResultApplication(int appID, int resultID) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        int result = 0;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE [OJT_Result]\n"
                        + "SET appID=?\n"
                        + "WHERE resultID = ?";
                pst = cn.prepareStatement(sql);
                pst.setInt(2, resultID);
                pst.setInt(1, appID);
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

    public static ArrayList<ResultDTO> getResults() throws SQLException {
        ArrayList<ResultDTO> list = new ArrayList<>();
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [resultID],[comment],[grade],[modifyDate],[status],[appID]\n"
                        + "from [OJT_Result]";
                st = cn.createStatement();
                rs = st.executeQuery(sql);
                while (rs != null && rs.next()) {
                    int resultid = rs.getInt("resultID");
                    String comment = rs.getString("comment");
                    int grade = rs.getInt("grade");                  
                    String status = rs.getString("status");            
                    int appid = rs.getInt("appID");
                    ResultDTO re = new ResultDTO(null, resultid, comment, status, grade, appid);
                    list.add(re);
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
}
