package com.gymggun.dto;

public class GymVO {

	private String mem_class;
	private int mem_num;
	private int fc_num;
	private String fc_name;
	private String addr;
	private String my_trainer;
	private String phone_num;
	private String opening_time;
	private int bookmark_count;
	private String url_addr;
	private String blog_addr;
	private String insta_addr;
	private String image;
	private int ratings;
	private String business_num;
	private String introduce;
	private String req_stat;
	
	
	public String getMem_class() {
		return mem_class;
	}
	public void setMem_class(String mem_class) {
		this.mem_class = mem_class;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getFc_num() {
		return fc_num;
	}
	public void setFc_num(int fc_num) {
		this.fc_num = fc_num;
	}
	public String getFc_name() {
		return fc_name;
	}
	public void setFc_name(String fc_name) {
		this.fc_name = fc_name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMy_trainer() {
		return my_trainer;
	}
	public void setMy_trainer(String my_trainer) {
		this.my_trainer = my_trainer;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getOpening_time() {
		return opening_time;
	}
	public void setOpening_time(String opening_time) {
		this.opening_time = opening_time;
	}
	public int getBookmark_count() {
		return bookmark_count;
	}
	public void setBookmark_count(int bookmark_count) {
		this.bookmark_count = bookmark_count;
	}
	public String getUrl_addr() {
		return url_addr;
	}
	public void setUrl_addr(String url_addr) {
		this.url_addr = url_addr;
	}
	public String getBlog_addr() {
		return blog_addr;
	}
	public void setBlog_addr(String blog_addr) {
		this.blog_addr = blog_addr;
	}
	public String getInsta_addr() {
		return insta_addr;
	}
	public void setInsta_addr(String insta_addr) {
		this.insta_addr = insta_addr;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getRatings() {
		return ratings;
	}
	public void setRatings(int ratings) {
		this.ratings = ratings;
	}
	public String getBusiness_num() {
		return business_num;
	}
	public void setBusiness_num(String business_num) {
		this.business_num = business_num;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getReq_stat() {
		return req_stat;
	}
	public void setReq_stat(String req_stat) {
		this.req_stat = req_stat;
	}
	@Override
	public String toString() {
		return "GymVO [mem_class=" + mem_class + ", mem_num=" + mem_num + ", fc_num=" + fc_num + ", fc_name=" + fc_name
				+ ", addr=" + addr + ", my_trainer=" + my_trainer + ", phone_num=" + phone_num + ", opening_time="
				+ opening_time + ", bookmark_count=" + bookmark_count + ", url_addr=" + url_addr + ", blog_addr="
				+ blog_addr + ", insta_addr=" + insta_addr + ", image=" + image + ", ratings=" + ratings
				+ ", business_num=" + business_num + ", introduce=" + introduce + ", req_stat=" + req_stat + "]";
	}
	
	
	
}
