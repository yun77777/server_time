package com.mall.vo;

import java.util.Date;

public class CartListVO {
/*  
    cartNum     number          not null,
    userId      varchar2(50)    not null,
    gdsNum      number          not null,
    cartStock   number          not null,
    addDate     date            default sysdate,
*/
	private int cartNum;
	private String userId;
	private int gdsNum;
	private int cartStock;
	private Date addDate;
	
	private int num;
	private int tbl_cart_seq;
	
	private String gdsName;
	private int gdsPrice;
	private String gdsThumbImg;
	private String representative_file;
	
	
	public String getRepresentative_file() {
		return representative_file;
	}
	public void setRepresentative_file(String representative_file) {
		this.representative_file = representative_file;
	}
	@Override
	public String toString() {
		return "CartListVO [cartNum=" + cartNum + ", userId=" + userId + ", gdsNum=" + gdsNum + ", cartStock="
				+ cartStock + ", addDate=" + addDate + ", num=" + num + ", tbl_cart_seq=" + tbl_cart_seq + ", gdsName="
				+ gdsName + ", gdsPrice=" + gdsPrice + ", gdsThumbImg=" + gdsThumbImg + ", representative_file="
				+ representative_file + "]";
	}
	public int getTbl_cart_seq() {
		return tbl_cart_seq;
	}
	public void setTbl_cart_seq(int tbl_cart_seq) {
		this.tbl_cart_seq = tbl_cart_seq;
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getGdsName() {
		return gdsName;
	}
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	public int getGdsPrice() {
		return gdsPrice;
	}
	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	public String getGdsThumbImg() {
		return gdsThumbImg;
	}
	public void setGdsThumbImg(String gdsThumbImg) {
		this.gdsThumbImg = gdsThumbImg;
	}
			
}