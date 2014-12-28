package com.mftour.spring.rest.bean;

/**
 * Created by jfreebird on 14/12/25.
 */
public class YeepayAccountInfo {
    private String platformNo ;//商户编号 Y 商户编号

    private String code ;//返回码 Y 【见返回码】

    private String description ;//描述 N 描述异常信息

    private String StringmemberType ; // 会员类型 Y 【见会员类型】

    private String activeStatus;// 会员激活状态 Y 【见会员激活状态】

    private String balance;// 账户余额 Y

    private String availableAmount;// 可用余额 Y

    private String freezeAmount ;//冻结金额 Y

    private String cardNo ;//卡号 N 绑private String定的卡号

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStringmemberType() {
        return StringmemberType;
    }

    public void setStringmemberType(String stringmemberType) {
        StringmemberType = stringmemberType;
    }

    public String getActiveStatus() {
        return activeStatus;
    }

    public void setActiveStatus(String activeStatus) {
        this.activeStatus = activeStatus;
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance;
    }

    public String getAvailableAmount() {
        return availableAmount;
    }

    public void setAvailableAmount(String availableAmount) {
        this.availableAmount = availableAmount;
    }

    public String getFreezeAmount() {
        return freezeAmount;
    }

    public void setFreezeAmount(String freezeAmount) {
        this.freezeAmount = freezeAmount;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getCardStatus() {
        return cardStatus;
    }

    public void setCardStatus(String cardStatus) {
        this.cardStatus = cardStatus;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getPlatformNo() {

        return platformNo;
    }

    public void setPlatformNo(String platformNo) {
        this.platformNo = platformNo;
    }

    private String cardStatus; //卡的状态 N 【见绑卡状态】

    private String bank;
}
