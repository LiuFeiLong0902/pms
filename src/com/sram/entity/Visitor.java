package com.sram.entity;

import java.util.Date;

public class Visitor {
	@Override
	public String toString() {
		return "Visitor [address=" + address + ", age=" + age + ", birthday="
				+ birthday + ", career=" + career + ", citizenship="
				+ citizenship + ", confirm=" + confirm + ", edu=" + edu
				+ ", email=" + email + ", hometown=" + hometown + ", id=" + id
				+ ", idCard=" + idCard + ", image=" + image + ", name=" + name
				+ ", nation=" + nation + ", politics=" + politics
				+ ", postcode=" + postcode + ", profession=" + profession
				+ ", school=" + school + ", sex=" + sex + ", state=" + state
				+ ", tel=" + tel + ", workTime=" + workTime + ", zongJiao="
				+ zongJiao + ", getAddress()=" + getAddress() + ", getAge()="
				+ getAge() + ", getBirthday()=" + getBirthday()
				+ ", getCareer()=" + getCareer() + ", getCitizenship()="
				+ getCitizenship() + ", getConfirm()=" + getConfirm()
				+ ", getEdu()=" + getEdu() + ", getEmail()=" + getEmail()
				+ ", getHometown()=" + getHometown() + ", getId()=" + getId()
				+ ", getIdCard()=" + getIdCard() + ", getImage()=" + getImage()
				+ ", getName()=" + getName() + ", getNation()=" + getNation()
				+ ", getPolitics()=" + getPolitics() + ", getPostcode()="
				+ getPostcode() + ", getProfession()=" + getProfession()
				+ ", getSchool()=" + getSchool() + ", getSex()=" + getSex()
				+ ", getState()=" + getState() + ", getTel()=" + getTel()
				+ ", getWorkTime()=" + getWorkTime() + ", getZongJiao()="
				+ getZongJiao() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}


	private int id;
	
	private String name;
	private int age;
	private Date birthday;
	
	private String hometown;
	private int workTime;
	private String idCard;
	
	private String zongJiao;
	private String politics;
	private String citizenship;//国籍
	
	private String nation;
	private String sex;
	private String profession;
	
	private String image;
	private String address;
	private String tel;
	
	private String postcode;
	private String email;
	
	private String school;
	private String edu;
	private String career;
	
	
	//审核？
	private String confirm;//审核，未审核
	private String state;//通过，未通过
	


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public Date getBirthday() {
		return birthday;
	}


	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}


	public String getHometown() {
		return hometown;
	}


	public void setHometown(String hometown) {
		this.hometown = hometown;
	}


	public int getWorkTime() {
		return workTime;
	}


	public void setWorkTime(int workTime) {
		this.workTime = workTime;
	}


	public String getIdCard() {
		return idCard;
	}


	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}


	public String getZongJiao() {
		return zongJiao;
	}


	public void setZongJiao(String zongJiao) {
		this.zongJiao = zongJiao;
	}


	public String getPolitics() {
		return politics;
	}


	public void setPolitics(String politics) {
		this.politics = politics;
	}


	public String getCitizenship() {
		return citizenship;
	}


	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}


	public String getNation() {
		return nation;
	}


	public void setNation(String nation) {
		this.nation = nation;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getProfession() {
		return profession;
	}


	public void setProfession(String profession) {
		this.profession = profession;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getPostcode() {
		return postcode;
	}


	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getSchool() {
		return school;
	}


	public void setSchool(String school) {
		this.school = school;
	}


	public String getEdu() {
		return edu;
	}


	public void setEdu(String edu) {
		this.edu = edu;
	}


	public String getCareer() {
		return career;
	}


	public void setCareer(String career) {
		this.career = career;
	}
	
	
	public String getConfirm() {
		return confirm;
	}


	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	
}
