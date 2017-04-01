package com.zhousf.office.entity;

public class User {
	
	private long userId;
	
	private String userName;
	
	private String sex;
	
	private int age;
	
	private String department;
	
	
	

	@Override
	public String toString() {
		return "user[userId="+userId+",userName="+userName+",sex="+sex+",age="+age+",department="+department+"]";
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
	
	
	
}
