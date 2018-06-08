package com.itheima.core.po;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;



public class product {
  
	private String className;
	private String modelName;
	private String manufacturer;
	private String handler;
	private String leader;
	private int productId;
	private String productName;
	private int productNumber;
	private int price;
	private String guaranteeperiod;  
	private String dataofPurchase;
	private String situation;
	private String remark;
	private Date repairDate;
	private Date scrapDate;
	private int repairCost;
	private int id;
	private String agreeid;
	private Integer start;            // 起始行
	private Integer rows;             // 所取行数
	private Date recordDate;
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public Date getScrapDate() {
		return scrapDate;
	}
	public void setScrapDate(Date scrapDate) {
		this.scrapDate = scrapDate;
	}
	
	public Date getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAgreeid() {
		return agreeid;
	}
	public void setAgreeid(String agreeid) {
		this.agreeid = agreeid;
	}
	public Date getRepairDate() {
		return repairDate;
	}
	public void setRepairDate(Date repairDate) {
		this.repairDate = repairDate;
	}
	public int getRepairCost() {
		return repairCost;
	}
	public void setRepairCost(int repairCost) {
		this.repairCost = repairCost;
	}
	public String getSituation() {
		return situation;
	}
	public void setSituation(String situation) {
		this.situation = situation;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String model) {
		this.modelName = model;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getHandler() {
		return handler;
	}
	public void setHandler(String handler) {
		this.handler = handler;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductNumber() {
		return productNumber;
	}
	public void setProductNumber(int productNumber) {
		this.productNumber = productNumber;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getGuaranteeperiod() {
		return guaranteeperiod;
	}
	public void setGuaranteeperiod(String guaranteeperiod) {
		this.guaranteeperiod = guaranteeperiod;
	}
	public String getDataofPurchase() {
		return dataofPurchase;
	}
	public void setDataofPurchase(String dataofPurchase) {
		this.dataofPurchase = dataofPurchase;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
}
