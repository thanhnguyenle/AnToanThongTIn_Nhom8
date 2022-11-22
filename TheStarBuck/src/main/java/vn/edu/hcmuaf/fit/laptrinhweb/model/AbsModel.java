package vn.edu.hcmuaf.fit.laptrinhweb.model;

import java.io.Serializable;
import java.sql.Date;

public abstract class AbsModel {
	private Date createdDate;
	private String createdBy;
	private Date modifiedDate;
	private String modifiedBy;
	// paging attribute
	private int page;
	private int totalPage; //totalPage = totalItem / maxPageItem
	private int maxPageItem;
	private int totalItem;

	public AbsModel() {
	}

	//paging getter/setter
	public int getTotalItem() {
		return totalItem;
	}

	public void setTotalItem(int totalItem) {
		this.totalItem = totalItem;
	}

	public int getPage() {
		return page;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getMaxPageItem() {
		return maxPageItem;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public void setMaxPageItem(int maxPageItem) {
		this.maxPageItem = maxPageItem;
	}
	//end paging getter/setter

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

}
