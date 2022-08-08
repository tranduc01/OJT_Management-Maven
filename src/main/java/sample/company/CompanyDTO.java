/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.company;

/**
 *
 * @author Tranduc
 */
public class CompanyDTO {
    private int comID;
    private String comDescription;
    private String comAddress;
    private int accID;
    private String website;
    private String bannerImage;

    public CompanyDTO() {
    }

    public CompanyDTO(int comID, String comDescription, String comAddress, int accID, String website, String bannerImage) {
        this.comID = comID;
        this.comDescription = comDescription;
        this.comAddress = comAddress;
        this.accID = accID;
        this.website = website;
        this.bannerImage = bannerImage;
    }

    public String getBannerImage() {
        return bannerImage;
    }

    public void setBannerImage(String bannerImage) {
        this.bannerImage = bannerImage;
    }

    

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

   

    public int getComID() {
        return comID;
    }

    public void setComID(int comID) {
        this.comID = comID;
    }

    public String getComDescription() {
        return comDescription;
    }

    public void setComDescription(String comDescription) {
        this.comDescription = comDescription;
    }

    public String getComAddress() {
        return comAddress;
    }

    public void setComAddress(String comAddress) {
        this.comAddress = comAddress;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    @Override
    public String toString() {
        return "CompanyDTO{" + "comID=" + comID + ", comDescription=" + comDescription + ", comAddress=" + comAddress + ", accID=" + accID + '}';
    }

    
    
}
