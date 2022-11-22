package vn.edu.hcmuaf.fit.laptrinhweb.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Account extends AbsModel implements Serializable {
	private String id;
	private String username;
	private String fullname;
	private String phoneNumber;
	private String email;
	private Date emailVerifiedAt;
	private String password;
	private String avatar;
	private String aboutMe;
	private Date lastLogin;
	private String groupId;
	private boolean active;
	private String rememberToken;
	private String addressId;
	public  Account(String username,String password,String fullname){
		this.username = username;
		this.password = password;
		this.fullname = fullname;
	}

	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	private List<String> listAddressId;

	public Account() {
	}

	@Override
	public String toString() {
		return "Account{" +
				"id='" + id + '\'' +
				", username='" + username + '\'' +
				", fullname='" + fullname + '\'' +
				", phoneNumber='" + phoneNumber + '\'' +
				", email='" + email + '\'' +
				", emailVerifiedAt=" + emailVerifiedAt +
				", password='" + password + '\'' +
				", avatar='" + avatar + '\'' +
				", aboutMe='" + aboutMe + '\'' +
				", lastLogin=" + lastLogin +
				", groupId='" + groupId + '\'' +
				", active=" + active +
				", rememberToken='" + rememberToken + '\'' +
				", addressId='" + addressId + '\'' +
				", listAddressId=" + listAddressId +
				'}';
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEmailVerifiedAt() {
		return emailVerifiedAt;
	}

	public void setEmailVerifiedAt(Date emailVerifiedAt) {
		this.emailVerifiedAt = emailVerifiedAt;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getRememberToken() {
		return rememberToken;
	}

	public void setRememberToken(String rememberToken) {
		this.rememberToken = rememberToken;
	}

	public List<String> getListAddressId() {
		return listAddressId;
	}

	public void setListAddressId(List<String> listAddressId) {
		this.listAddressId = listAddressId;
	}
}
