package com.sram.entity;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;

public class Emp {
	
	// 静态属性,属性字典
	
	/** 试用期入职 */
	public static final String ENTRY_TYPE_PROBATION = "试用期入职";
	/** 直接入职 */
	public static final String ENTRY_TYPE_DIRECT = "直接入职";
	/** 试用期 */
	public static final String EMP_STATUS_PROBATION = "试用期";
	/** 在职 */
	public static final String EMP_STATUS_INSERVICE = "在职";
	/** 离职 */
	public static final String EMP_STATUS_LEAVED = "离职";
	
	
	private int id;
	private String name;
	private String password;
	private Date hiredate; // 入职日期
	private Date conversionDate; // 转正日期
	private String entryType = Emp.ENTRY_TYPE_PROBATION; // 入职类型
	private String empStatus;
	private String tel;
	private String sex;
	private Date birth;
	private String idCard;
	private String province;
	private String city;
	private String nation;
	private String diploma;

	private List<Role> roles;
	private Dept dept;

	
	/**
	 * 判断本用户是否有指定名称的权限
	 * @param privilegeName
	 * @return
	 */
	public boolean hasPrivilegeByName(String privilegeName) {
		
		// 超级管理员有所有的权限
		if (isAdmin()) {
			return true;
		}

		// 其他用户要是有权限才返回true
		for (Role role : roles) {
			for (Privilege privilege : role.getPrivileges()) {
				if (privilege.getName().equals(privilegeName)) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 判断本用户是否有指定URL的权限
	 * @param privilegeUrl
	 * @return
	 */
	public boolean hasPrivilegeByUrl(String privilegeUrl) {
		// 超级管理员有全部权限
		if (isAdmin()) {
			return true;
		}

		// 如果以UI后缀结尾，就去掉UI后缀，以得到对应的权限（例如：addUI与add是同一个权限）
		if (privilegeUrl.endsWith("UI")) {
			privilegeUrl = privilegeUrl.substring(0, privilegeUrl.length() - 2);
		}

		// 其他用户要是有权限才返回true
		@SuppressWarnings("unchecked")
		List<String> allPrivilegeUrls = (List<String>) ActionContext
				.getContext().getApplication().get("allPrivilegeUrls");
		if (!allPrivilegeUrls.contains(privilegeUrl)) {
			// 如果是不需要控制的功能，则所有用户都可以使用
			return true;
		} else {
			// 如果是要控制的功能，则有权限才能使用
			for (Role role : roles) {
				for (Privilege privilege : role.getPrivileges()) {
					if (privilegeUrl.equals(privilege.getUrl())) {
						return true;
					}
				}
			}
			return false;
		}
	}

	/**
	 * 是否是超级管理员
	 * 
	 * @return
	 */
	public boolean isAdmin() {
		return "admin".equals(name);
	}

	// --------------------------
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	public Date getConversionDate() {
		return conversionDate;
	}

	public void setConversionDate(Date conversionDate) {
		this.conversionDate = conversionDate;
	}

	public String getEntryType() {
		return entryType;
	}

	public void setEntryType(String entryType) {
		this.entryType = entryType;
	}

	public String getEmpStatus() {
		return empStatus;
	}

	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getDiploma() {
		return diploma;
	}

	public void setDiploma(String diploma) {
		this.diploma = diploma;
	}

}
