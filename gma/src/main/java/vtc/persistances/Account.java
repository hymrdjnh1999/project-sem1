package vtc.persistances;

import java.util.Date;

public class Account {
    Integer accountID;
    String fullName, email, passWord, userName, address, phone, position;
    Date birthDate;
    Double money;
    Date accountCreatedDate;
    String status = "non-active";

    public void setAccountID(Integer accountID) {
        this.accountID = accountID;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAccountCreatedDate(Date accountCreatedDate) {
        this.accountCreatedDate = accountCreatedDate;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getAccountID() { 
        return accountID;
    }

    public String getFullName() {
        return fullName;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public Double getMoney() {
        return money;
    }

    public Date getAccountCreatedDate() {
        return accountCreatedDate;
    }

    public String getPosition() {
        return position;
    }

    public String getStatus() {
        return status;
    }

}