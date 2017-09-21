package com.analysis.search;

public class Page {
	private Integer pagesize;
	private Integer pageno;
	private Integer startrow;
	private Integer totalpage;
	private Integer totalcount;
	
	public Page(){
	}
	
	public Page(Integer pageSize,Integer pageNo,Integer totalCount){
		this.pagesize = pageSize;
		this.pageno = pageNo;
		this.totalcount = totalCount;
		this.setStartrow(pageNo,pageSize);
		this.setTotalpage(totalCount,pageSize);
	}
	public Integer getPagesize(){
		return pagesize;
	}
	public void setPagesize(Integer pageSize){
		this.pagesize = pageSize;
	}
	public Integer getPageno(){
		return pageno;
	}
	public void setPageno(Integer pageNo){
		this.pageno = pageNo; 
	}
	public void setStartrow(Integer pageNo,Integer pageSize){
		this.startrow = (pageNo - 1) * pageSize;
	}
	public Integer getTotalpage(){
		return totalpage;
	}
	public void setTotalpage(Integer totalCount,Integer pageSize){
		this.totalpage = totalCount % pageSize == 0? totalCount / pageSize : totalCount / pageSize + 1;
	}
	public Integer getTotalcount(){
		return totalcount;
	}
	public void setTotalCount(Integer totalCount){
		this.totalcount = totalCount;
	}
}
