/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.job;

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
public class JobDAO {

    public static ArrayList<JobDTO> getJobs() throws SQLException {
        ArrayList<JobDTO> list = new ArrayList<>();
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [jobID],[jobName],[jobTitle],[jobDescription],[jobRequirements],[jobBenefits],[jobSalary],[jobCreateDate],[jobEndDate],[status],amount,majorID,comID,modifyDate\n"
                        + "from Job\n"
                        + "where job.status=1";
                st = cn.createStatement();
                rs = st.executeQuery(sql);
                while (rs != null && rs.next()) {
                    int jobid = rs.getInt("jobID");
                    String jobname = rs.getString("jobName");
                    String jobtitle = rs.getString("jobTitle");
                    String jobdescription = rs.getString("jobDescription");
                    String jobrequirement = rs.getString("jobRequirements");
                    String jobbenefit = rs.getString("jobBenefits");
                    int salary = rs.getInt("jobSalary");
                    Date createdate = rs.getDate("jobCreateDate");
                    Date enddate = rs.getDate("jobEndDate");
                    int status = rs.getInt("status");
                    int amount = rs.getInt("amount");
                    int comid = rs.getInt("comID");
                    String majorID = rs.getString("majorID");
                    Date modifyDate=rs.getDate("modifyDate");
                    JobDTO job = new JobDTO(jobid, jobname, jobtitle, jobdescription, jobrequirement, jobbenefit, salary, createdate, enddate, modifyDate, status, amount, comid, majorID);
                    list.add(job);
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

    public static void createJobCompany(String jobTitle, String jobName, String jobDescription, String jobRequirement, int amount, String jobBenefits,
            int jobSalary, String createDate, String endDate, int comID, String major,String modifyDate) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO [dbo].[Job] ([jobName],[jobTitle],[jobDescription],[jobRequirements],[amount],[jobBenefits],\n"
                        + "[jobSalary],[jobCreateDate],[jobEndDate],[status],[comID],[majorID],modifyDate)\n"
                        + "VALUES(?,?,?,?,?,?,?,?,?,0,?,?,?)\n";
                pst = cn.prepareStatement(sql);
                pst.setString(1, jobName);
                pst.setString(2, jobTitle);
                pst.setString(3, jobDescription);
                pst.setString(4, jobRequirement);
                pst.setInt(5, amount);
                pst.setString(6, jobBenefits);
                pst.setInt(7, jobSalary);
                pst.setString(8, createDate);
                pst.setString(9, endDate);
                pst.setInt(10, comID);
                pst.setString(11, major);
                pst.setString(12, modifyDate);
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

    public static int updateJobCompany(String jobTitle, String jobName, String jobDescription, String jobRequirement, int amount, String jobBenefits,
            int jobSalary, String endDate, int jobID, String major,int status,String modifyDate) throws SQLException {
        int result=0;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [dbo].[Job]\n"
                        + "set [jobName]=?,[jobTitle]=?,[jobDescription]=?,[jobRequirements]=?,[amount]=?,[jobBenefits]=?,[jobSalary]=?,[jobEndDate]=?,[status]=?,majorID=?,modifyDate=?\n"
                        + "where jobID=?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, jobName);
                pst.setString(2, jobTitle);
                pst.setString(3, jobDescription);
                pst.setString(4, jobRequirement);
                pst.setInt(5, amount);
                pst.setString(6, jobBenefits);
                pst.setInt(7, jobSalary);
                pst.setString(8, endDate);
                pst.setInt(9, status);
                pst.setString(10, major);
                pst.setString(11, modifyDate);
                pst.setInt(12, jobID);
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

    public static JobDTO getJobByID(int jobID) throws SQLException {
        JobDTO job = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [jobID],[jobName],[jobTitle],[jobDescription],[jobRequirements],[jobBenefits],[jobSalary],amount,[jobCreateDate],[jobEndDate],[status],majorID,comID,modifyDate\n"
                        + "from Job\n"
                        + "where job.status=1 and jobID=?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, jobID);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int jobid = rs.getInt("jobID");
                    String jobname = rs.getString("jobName");
                    String jobtitle = rs.getString("jobTitle");
                    String jobdescription = rs.getString("jobDescription");
                    String jobrequirement = rs.getString("jobRequirements");
                    String jobbenefit = rs.getString("jobBenefits");
                    int salary = rs.getInt("jobSalary");
                    Date createdate = rs.getDate("jobCreateDate");
                    Date enddate = rs.getDate("jobEndDate");
                    int status = rs.getInt("status");
                    int amount = rs.getInt("amount");
                    int comid = rs.getInt("comID");
                    String majorID = rs.getString("majorID");
                    Date modifyDate=rs.getDate("modifyDate");
                    job = new JobDTO(jobid, jobname, jobtitle, jobdescription, jobrequirement, jobbenefit, salary, createdate, enddate, modifyDate, status, amount, comid, majorID);
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
        return job;
    }

    public static JobDTO getJobByID_V2(int jobID) throws SQLException {
        JobDTO job = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [jobID],[jobName],[jobTitle],[jobDescription],[jobRequirements],[jobBenefits],[jobSalary],amount,[jobCreateDate],[jobEndDate],[status],majorID,comID,modifyDate\n"
                        + "from Job\n"
                        + "where jobID=?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, jobID);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int jobid = rs.getInt("jobID");
                    String jobname = rs.getString("jobName");
                    String jobtitle = rs.getString("jobTitle");
                    String jobdescription = rs.getString("jobDescription");
                    String jobrequirement = rs.getString("jobRequirements");
                    String jobbenefit = rs.getString("jobBenefits");
                    int salary = rs.getInt("jobSalary");
                    Date createdate = rs.getDate("jobCreateDate");
                    Date enddate = rs.getDate("jobEndDate");
                    int status = rs.getInt("status");
                    int amount = rs.getInt("amount");
                    int comid = rs.getInt("comID");
                    String majorID = rs.getString("majorID");
                    Date modifyDate=rs.getDate("modifyDate");
                    job = new JobDTO(jobid, jobname, jobtitle, jobdescription, jobrequirement, jobbenefit, salary, createdate, enddate, modifyDate, status, amount, comid, majorID);
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
        return job;
    }

    public static ArrayList<JobDTO> getJobByComID(int comID) throws SQLException {
        ArrayList<JobDTO> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [jobID],[jobName],[jobTitle],[jobDescription],[jobRequirements],[jobBenefits],[jobSalary],amount,[jobCreateDate],[jobEndDate],[status],majorID,comID,modifyDate\n"
                        + "from Job\n"
                        + "where comID=?\n"
                        + "order by modifyDate desc";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, comID);
                rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int jobid = rs.getInt("jobID");
                    String jobname = rs.getString("jobName");
                    String jobtitle = rs.getString("jobTitle");
                    String jobdescription = rs.getString("jobDescription");
                    String jobrequirement = rs.getString("jobRequirements");
                    String jobbenefit = rs.getString("jobBenefits");
                    int salary = rs.getInt("jobSalary");
                    Date createdate = rs.getDate("jobCreateDate");
                    Date enddate = rs.getDate("jobEndDate");
                    int status = rs.getInt("status");
                    int amount = rs.getInt("amount");
                    int comid = rs.getInt("comID");
                    String majorID = rs.getString("majorID");
                    Date modifyDate=rs.getDate("modifyDate");
                    JobDTO job = new JobDTO(jobid, jobname, jobtitle, jobdescription, jobrequirement, jobbenefit, salary, createdate, enddate, modifyDate, status, amount, comid, majorID);
                    list.add(job);
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

    public static ArrayList<JobDTO> getJobByComIDV2(int comID) throws SQLException {
        ArrayList<JobDTO> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [jobID],[jobName],[jobTitle],[jobDescription],[jobRequirements],[jobBenefits],[jobSalary],amount,[jobCreateDate],[jobEndDate],[status],majorID,comID,modifyDate\n"
                        + "from Job\n"
                        + "where status=1 and comID=?";
                        
                pst = cn.prepareStatement(sql);
                pst.setInt(1, comID);
                rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int jobid = rs.getInt("jobID");
                    String jobname = rs.getString("jobName");
                    String jobtitle = rs.getString("jobTitle");
                    String jobdescription = rs.getString("jobDescription");
                    String jobrequirement = rs.getString("jobRequirements");
                    String jobbenefit = rs.getString("jobBenefits");
                    int salary = rs.getInt("jobSalary");
                    Date createdate = rs.getDate("jobCreateDate");
                    Date enddate = rs.getDate("jobEndDate");
                    int status = rs.getInt("status");
                    int amount = rs.getInt("amount");
                    int comid = rs.getInt("comID");
                    String majorID = rs.getString("majorID");
                    Date modifyDate=rs.getDate("modifyDate");
                    JobDTO job = new JobDTO(jobid, jobname, jobtitle, jobdescription, jobrequirement, jobbenefit, salary, createdate, enddate, modifyDate, status, amount, comid, majorID);
                    list.add(job);
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
    
    public static ArrayList<JobDTO> getJobByMajor(String majorID) throws SQLException {
        ArrayList<JobDTO> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [jobID],[jobName],[jobTitle],[jobDescription],[jobRequirements],[jobBenefits],[jobSalary],amount,[jobCreateDate],[jobEndDate],[status],majorID,comID,modifyDate\n"
                        + "from Job\n"
                        + "where job.status=1 and majorID=?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, majorID);
                rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int jobid = rs.getInt("jobID");
                    String jobname = rs.getString("jobName");
                    String jobtitle = rs.getString("jobTitle");
                    String jobdescription = rs.getString("jobDescription");
                    String jobrequirement = rs.getString("jobRequirements");
                    String jobbenefit = rs.getString("jobBenefits");
                    int salary = rs.getInt("jobSalary");
                    Date createdate = rs.getDate("jobCreateDate");
                    Date enddate = rs.getDate("jobEndDate");
                    int status = rs.getInt("status");
                    int amount = rs.getInt("amount");
                    int comid = rs.getInt("comID");
                    String majorid = rs.getString("majorID");
                    Date modifyDate=rs.getDate("modifyDate");
                    JobDTO job = new JobDTO(jobid, jobname, jobtitle, jobdescription, jobrequirement, jobbenefit, salary, createdate, enddate, modifyDate, status, amount, comid, majorid);
                    list.add(job);
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

    public static ArrayList<JobDTO> getJobByFilter(int status) throws SQLException {
        ArrayList<JobDTO> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [jobID],[jobName],[jobTitle],[jobDescription],[jobRequirements],[jobBenefits],[jobSalary],amount,[jobCreateDate],[jobEndDate],[status],majorID,comID,modifyDate\n"
                        + "from Job\n"
                        + "where job.status=?\n"
                        +"order by modifyDate desc";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int jobid = rs.getInt("jobID");
                    String jobname = rs.getString("jobName");
                    String jobtitle = rs.getString("jobTitle");
                    String jobdescription = rs.getString("jobDescription");
                    String jobrequirement = rs.getString("jobRequirements");
                    String jobbenefit = rs.getString("jobBenefits");
                    int salary = rs.getInt("jobSalary");
                    Date createdate = rs.getDate("jobCreateDate");
                    Date enddate = rs.getDate("jobEndDate");
                    int statuss = rs.getInt("status");
                    int amount = rs.getInt("amount");
                    int comid = rs.getInt("comID");
                    String majorid = rs.getString("majorID");
                    Date modifyDate=rs.getDate("modifyDate");
                    JobDTO job = new JobDTO(jobid, jobname, jobtitle, jobdescription, jobrequirement, jobbenefit, salary, createdate, enddate, modifyDate, statuss, amount, comid, majorid);
                    list.add(job);
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
    
    public static ArrayList<JobDTO> getJobByFilterCompany(int status,int comID) throws SQLException {
        ArrayList<JobDTO> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [jobID],[jobName],[jobTitle],[jobDescription],[jobRequirements],[jobBenefits],[jobSalary],amount,[jobCreateDate],[jobEndDate],[status],majorID,comID,modifyDate\n"
                        + "from Job\n"
                        + "where job.status=? and comID=?\n"
                        +"order by modifyDate desc";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, comID);
                rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int jobid = rs.getInt("jobID");
                    String jobname = rs.getString("jobName");
                    String jobtitle = rs.getString("jobTitle");
                    String jobdescription = rs.getString("jobDescription");
                    String jobrequirement = rs.getString("jobRequirements");
                    String jobbenefit = rs.getString("jobBenefits");
                    int salary = rs.getInt("jobSalary");
                    Date createdate = rs.getDate("jobCreateDate");
                    Date enddate = rs.getDate("jobEndDate");
                    int statuss = rs.getInt("status");
                    int amount = rs.getInt("amount");
                    int comid = rs.getInt("comID");
                    String majorid = rs.getString("majorID");
                    Date modifyDate=rs.getDate("modifyDate");
                    JobDTO job = new JobDTO(jobid, jobname, jobtitle, jobdescription, jobrequirement, jobbenefit, salary, createdate, enddate, modifyDate, statuss, amount, comid, majorid);
                    list.add(job);
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

    public static ArrayList<JobDTO> getJobsByPage(int pageNumber, int rowOfPage) throws SQLException {
        ArrayList<JobDTO> list = new ArrayList<>();
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [jobID],[jobName],[jobTitle],[jobDescription],[jobRequirements],[jobBenefits],[jobSalary],[jobCreateDate],[jobEndDate],[status],amount,majorID,comID,modifyDate\n"
                        + "from Job\n"
                        + "where job.status=1\n"
                        + "order by jobCreateDate desc\n"
                        + "offset (? -1)* ? rows\n"
                        + "fetch next ? rows only";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, pageNumber);
                pst.setInt(2, rowOfPage);
                pst.setInt(3, rowOfPage);
                rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int jobid = rs.getInt("jobID");
                    String jobname = rs.getString("jobName");
                    String jobtitle = rs.getString("jobTitle");
                    String jobdescription = rs.getString("jobDescription");
                    String jobrequirement = rs.getString("jobRequirements");
                    String jobbenefit = rs.getString("jobBenefits");
                    int salary = rs.getInt("jobSalary");
                    Date createdate = rs.getDate("jobCreateDate");
                    Date enddate = rs.getDate("jobEndDate");
                    int status = rs.getInt("status");
                    int amount = rs.getInt("amount");
                    int comid = rs.getInt("comID");
                    String majorID = rs.getString("majorID");
                    Date modifyDate=rs.getDate("modifyDate");
                    JobDTO job = new JobDTO(jobid, jobname, jobtitle, jobdescription, jobrequirement, jobbenefit, salary, createdate, enddate, modifyDate, status, amount, comid, majorID);
                    list.add(job);
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

    public static ArrayList<JobDTO> getJobsPost(int pageNumber, int rowOfPage) throws SQLException {
        ArrayList<JobDTO> list = new ArrayList<>();
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [jobID],[jobName],[jobTitle],[jobDescription],[jobRequirements],[jobBenefits],[jobSalary],[jobCreateDate],[jobEndDate],[status],amount,majorID,comID,modifyDate\n"
                        + "from Job\n"
                        + "order by modifyDate desc\n"
                        + "offset (? -1)* ? rows\n"
                        + "fetch next ? rows only";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, pageNumber);
                pst.setInt(2, rowOfPage);
                pst.setInt(3, rowOfPage);
                rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int jobid = rs.getInt("jobID");
                    String jobname = rs.getString("jobName");
                    String jobtitle = rs.getString("jobTitle");
                    String jobdescription = rs.getString("jobDescription");
                    String jobrequirement = rs.getString("jobRequirements");
                    String jobbenefit = rs.getString("jobBenefits");
                    int salary = rs.getInt("jobSalary");
                    Date createdate = rs.getDate("jobCreateDate");
                    Date enddate = rs.getDate("jobEndDate");
                    int status = rs.getInt("status");
                    int amount = rs.getInt("amount");
                    int comid = rs.getInt("comID");
                    String majorID = rs.getString("majorID");
                    Date modifyDate=rs.getDate("modifyDate");
                    JobDTO job = new JobDTO(jobid, jobname, jobtitle, jobdescription, jobrequirement, jobbenefit, salary, createdate, enddate, modifyDate, status, amount, comid, majorID);
                    list.add(job);
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

    public static int updateJobStatus(int jobID, int status,String modifyDate) throws SQLException {
        int result = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [Job]\n"
                        + "set status=?,modifyDate=?\n"
                        + "where jobID=?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setString(2, modifyDate);
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

    public static ArrayList<JobDTO> JobListBySeach(String keyword, String majorID) throws SQLException {
        ArrayList<JobDTO> list = new ArrayList<>();
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [jobID],[jobName],[jobTitle],[jobDescription],[jobRequirements],[jobBenefits],[jobSalary],[jobCreateDate],[jobEndDate],[status],amount,majorID,comID,modifyDate\n"
                        + "from Job\n";
                if (majorID.equals("all")) {
                    sql = sql + "where status=1 and jobName like ?";
                    PreparedStatement pst = cn.prepareStatement(sql);
                    pst.setString(1, "%" + keyword + "%");
                    rs = pst.executeQuery();
                } else {
                    sql = sql + "where status=1 and jobName like ? and majorID = ?";
                    PreparedStatement pst = cn.prepareStatement(sql);
                    pst.setString(1, "%" + keyword + "%");
                    pst.setString(2, majorID);
                    rs = pst.executeQuery();
                }
                while (rs != null && rs.next()) {
                    int jobid = rs.getInt("jobID");
                    String jobname = rs.getString("jobName");
                    String jobtitle = rs.getString("jobTitle");
                    String jobdescription = rs.getString("jobDescription");
                    String jobrequirement = rs.getString("jobRequirements");
                    String jobbenefit = rs.getString("jobBenefits");
                    int salary = rs.getInt("jobSalary");
                    Date createdate = rs.getDate("jobCreateDate");
                    Date enddate = rs.getDate("jobEndDate");
                    int status = rs.getInt("status");
                    int amount = rs.getInt("amount");
                    int comid = rs.getInt("comID");
                    String majorid = rs.getString("majorID");
                    Date modifyDate=rs.getDate("modifyDate");
                    JobDTO job = new JobDTO(jobid, jobname, jobtitle, jobdescription, jobrequirement, jobbenefit, salary, createdate, enddate, modifyDate, status, amount, comid, majorid);
                    list.add(job);
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
