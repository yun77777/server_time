package com.mall.user;

public class UserVO {

	private String ID;
	private String PW;
//    private String userName;
//    private String userEmail;
//    private Date userJoinDate;
//    private Date userLoginDate;
//    private String userSignature;
//    private String userImg;
//    private int userPoint;
	private String NAME;
	private String ADDRESS;
	private String CONTACT;
	private String PHONE;
	private String EMAIL;
	
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getCONTACT() {
		return CONTACT;
	}
	public void setCONTACT(String cONTACT) {
		CONTACT = cONTACT;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getID() {
		return ID;
	}
	public void setID(String ID) {
		this.ID = ID;
	}
	public String getPW() {
		return PW;
	}
	public void setPW(String PW) {
		this.PW = PW;
	}
	@Override
	public String toString() {
		return "UserVO [ID=" + ID + ", PW=" + PW + ", NAME=" + NAME + ", ADDRESS=" + ADDRESS + ", CONTACT=" + CONTACT
				+ ", PHONE=" + PHONE + ", EMAIL=" + EMAIL + "]";
	}

	// getter, setter, toString 생략
}