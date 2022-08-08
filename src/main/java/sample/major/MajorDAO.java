/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.major;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import sample.utils.DBUtils;

/**
 *
 * @author Tranduc
 */
public class MajorDAO {

    public static ArrayList<MajorDTO> getMajors() throws SQLException {
        ArrayList<MajorDTO> list = new ArrayList<>();
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select majorID,majorName\n"
                        + "from Major";
                st = cn.createStatement();
                rs = st.executeQuery(sql);
                while (rs != null && rs.next()) {
                    String majorid = rs.getString("majorID");
                    String majorname = rs.getString("majorName");
                    MajorDTO m = new MajorDTO(majorid, majorname);
                    list.add(m);
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
