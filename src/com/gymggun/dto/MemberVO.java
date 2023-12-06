package com.gymggun.dto;

public class MemberVO {
	private String mem_class;
	private int mem_num;
	private String id;
	private String password;
	private String gender;
	private String name;
	private String email;
	private String nickname;
	
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
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@Override
	public String toString() {
		return "MemberVO [mem_class=" + mem_class + ", id=" + id + ", password=" + password + ", gender=" + gender
				+ ", name=" + name + ", email=" + email + ", nickname=" + nickname + "]";
	}
		
}
