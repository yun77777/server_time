package com.mall.vo;

public class BoardVO {

	private int B_NO;
	private String ID;
	private String TITLE;
	private String CONTENT;
	private String INPUT_DT;
	
	public int getB_NO() {
		return B_NO;
	}
	public void setB_NO(int b_NO) {
		B_NO = b_NO;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getINPUT_DT() {
		return INPUT_DT;
	}
	public void setINPUT_DT(String iNPUT_DT) {
		INPUT_DT = iNPUT_DT;
	}
	@Override
	public String toString() {
		return "BoardVO [B_NO=" + B_NO + ", ID=" + ID + ", TITLE=" + TITLE + ", CONTENT=" + CONTENT + ", INPUT_DT="
				+ INPUT_DT + "]";
	}
	
}