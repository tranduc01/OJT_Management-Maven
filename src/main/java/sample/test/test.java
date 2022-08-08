/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.test;

import java.util.ArrayList;
import java.util.Arrays;
import sample.account.AccountDAO;
import sample.account.AccountDTO;
import sample.application.ApplicationDAO;
import sample.application.ApplicationDTO;
import sample.company.CompanyDAO;
import sample.company.CompanyDTO;
import sample.job.JobDAO;
import sample.job.JobDTO;
import sample.major.MajorDAO;
import sample.major.MajorDTO;
import sample.result.ResultDAO;
import sample.result.ResultDTO;
import sample.student.StudentDAO;
import sample.student.StudentDTO;

/**
 *
 * @author Tranduc
 */
public class test {
    public static void main(String[] args) {
        try {
//            ArrayList<ApplicationDTO> appList=ApplicationDAO.getApplicationByID("SE151204");
//            ArrayList<JobDTO> jobList=new ArrayList<>();
//            for (ApplicationDTO applicationDTO : appList) {
//                JobDTO job=JobDAO.getJobByID_V2(applicationDTO.getJobID());
//                jobList.add(job);
//            }
//            ArrayList<CompanyDTO> companyList=new ArrayList<>();
//            for (JobDTO jobDTO : jobList) {
//                CompanyDTO com=CompanyDAO.getCompanyByID(jobDTO.getComID());
//                companyList.add(com);
//            }
//            
//            JobDTO job=JobDAO.getJobByID_V2(2);
//            CompanyDTO c=CompanyDAO.getCompanyByID(job.getComID());
//            
//                boolean check=companyList.contains(c.getComID());
//                System.out.println(check);  
            ArrayList<MajorDTO> list=MajorDAO.getMajors();
            System.out.println(list.size());
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
