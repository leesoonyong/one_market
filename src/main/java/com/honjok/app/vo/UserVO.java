package com.honjok.app.vo;

import java.util.Date;

public class UserVO {
		private String name;
		private String id;
		private String password;
		private String email;
		private String adrCode;
		private String adr1;
		private String adr2;
		private String phone;
		private Date regdate;
		private String gender;
		private int birth;
		private int type;
		private int age;
		private String nickName;
		private String userKey;
		
		
		public String getUserKey() {
			return userKey;
		}
		public void setUserKey(String userKey) {
			this.userKey = userKey;
		}
		public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
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
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getAdrCode() {
			return adrCode;
		}
		public void setAdrCode(String adrCode) {
			this.adrCode = adrCode;
		}
		public String getAdr1() {
			return adr1;
		}
		public void setAdr1(String adr1) {
			this.adr1 = adr1;
		}
		public String getAdr2() {
			return adr2;
		}
		public void setAdr2(String adr2) {
			this.adr2 = adr2;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public int getBirth() {
			return birth;
		}
		public void setBirth(int birth) {
			this.birth = birth;
		}
		public int getType() {
			return type;
		}
		public void setType(int type) {
			this.type = type;
		}
		public String getNickName() {
			return nickName;
		}
		public void setNickName(String nickName) {
			this.nickName = nickName;
		}
		@Override
		public String toString() {
			return "UserVO [name=" + name + ", id=" + id + ", password=" + password + ", email=" + email + ", adrCode="
					+ adrCode + ", adr1=" + adr1 + ", adr2=" + adr2 + ", phone=" + phone + ", regdate=" + regdate
					+ ", gender=" + gender + ", birth=" + birth + ", type=" + type + ", nickName=" + nickName + "]";
		}
		
		

}
