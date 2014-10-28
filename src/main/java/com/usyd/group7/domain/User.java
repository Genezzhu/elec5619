package com.usyd.group7.domain;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.usyd.group7.util.DateSerializer;

import javax.persistence.*;

import java.util.Date;


@Entity
@Table(name = "t_user")
public class User {
    @Id
	@GeneratedValue
	@Column(name="userid")
	long userID;
	
	@Column(name="username", nullable = false)
	String userName;
	
	@Column(name="sex")
	String sex;

    @Column(name = "birthday")
    Date birthday;

	@Column(name="passwd", nullable = false)
	String passwd;
	
	@Column(name="telephone")
	String telephone;
	
	@Column(name="address")
	String address;
	
	@Column(name="age")
	int age;

    @Column(name = "email")
    private String email;

	public long getUserID() {
		return userID;
	}

	public void setUserID(long userID) {
		this.userID = userID;
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

    @JsonSerialize(using = DateSerializer.class)
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "userID=" + userID +
                ", userName='" + userName + '\'' +
                ", sex='" + sex + '\'' +
                ", birthday=" + birthday +
                ", passwd='" + passwd + '\'' +
                ", telephone='" + telephone + '\'' +
                ", address='" + address + '\'' +
                ", age=" + age +
                ", email='" + email + '\'' +
                '}';
    }
}
