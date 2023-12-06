package com.gymggun.dto;

public class TrainerDTO {
	private String mem_class;
	private int mem_num;
	private String name;
	private String addr;
	private String phone_num;
	private String working_time;
	private int bookmark_count;
	private String url_addr;
	private String blog_addr;
	private String insta_addr;
	private String image;
	private double ratings;
	private String awards;
	private String introduce;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getWorking_time() {
		return working_time;
	}
	public void setWorking_time(String working_time) {
		this.working_time = working_time;
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
	public double getRatings() {
		return ratings;
	}
	public void setRatings(double ratings) {
		this.ratings = ratings;
	}
	public String getAwards() {
		return awards;
	}
	public void setAwards(String awards) {
		this.awards = awards;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	@Override
	public String toString() {
		return "TrainerDTO [mem_class=" + mem_class + ", mem_num=" + mem_num + ", name=" + name + ", addr=" + addr
				+ ", phone_num=" + phone_num + ", working_time=" + working_time + ", bookmark_count=" + bookmark_count
				+ ", url_addr=" + url_addr + ", blog_addr=" + blog_addr + ", insta_addr=" + insta_addr + ", image="
				+ image + ", ratings=" + ratings + ", awards=" + awards + ", introduce=" + introduce + "]";
	}
	
	
}
