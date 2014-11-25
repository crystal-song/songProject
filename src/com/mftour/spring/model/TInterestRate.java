package com.mftour.spring.model;

public class TInterestRate implements java.io.Serializable {
	private static final long serialVersionUID = -8032668954376548825L;
	private Long id;
	private String enterpriseNumber; //
	private int startMoney; // 初始金额
	private Double startInterestRate; // 初始利率
	private int moneyIncrease; // 金额步长值
	private Double interestRateIncrease; // 利率步长值
	private int highestMoney; // 封顶金额

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEnterpriseNumber() {
		return enterpriseNumber;
	}

	public void setEnterpriseNumber(String enterpriseNumber) {
		this.enterpriseNumber = enterpriseNumber;
	}

	public int getStartMoney() {
		return startMoney;
	}

	public void setStartMoney(int startMoney) {
		this.startMoney = startMoney;
	}

	public Double getStartInterestRate() {
		return startInterestRate;
	}

	public void setStartInterestRate(Double startInterestRate) {
		this.startInterestRate = startInterestRate;
	}

	public int getMoneyIncrease() {
		return moneyIncrease;
	}

	public void setMoneyIncrease(int moneyIncrease) {
		this.moneyIncrease = moneyIncrease;
	}

	public Double getInterestRateIncrease() {
		return interestRateIncrease;
	}

	public void setInterestRateIncrease(Double interestRateIncrease) {
		this.interestRateIncrease = interestRateIncrease;
	}

	public int getHighestMoney() {
		return highestMoney;
	}

	public void setHighestMoney(int highestMoney) {
		this.highestMoney = highestMoney;
	}

}
