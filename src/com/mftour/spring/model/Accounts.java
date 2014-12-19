package com.mftour.spring.model;

import java.math.BigDecimal;

public class Accounts {
	private String userId;					//用户ID
	private BigDecimal availableMoney;	   //可用余额
	private BigDecimal availableReward;	   //可用投资券
	private BigDecimal frozen_money_invest;	   //投资冻结实付金额(不含投资劵)
	private BigDecimal frozen_money_repay;	   //
	private BigDecimal frozenMoneyWithdraw;	   //
	private BigDecimal frozenRewardRay;	       //投资冻结投资劵金额
	private BigDecimal usedReward;	   //已用投资劵
	private BigDecimal receivablePrincipal;	   //待收本金
	private BigDecimal receivableInterest;	   //待收收益
	private BigDecimal accumulateRecharge;	   //累计充值金额
	private Integer accumulateRechargeCount;	   //累计充值次数'
	private BigDecimal accumulatePrincipal;	   //已完成回款本金(包括投资劵)
	private BigDecimal accumulate_money_invest;	   //已投资累计总金额(不包括投资劵)',
	private BigDecimal accumulateInterest;	   //已收收益
	private Integer accumulateInvest_count;	   //累计投资次数
	private BigDecimal accumulateFreeWithdraw;
	private BigDecimal accumulateWithdraw;	//累计提现金额
	private Integer accumulateWithdrawCount;	//累计提现次数
	private BigDecimal balanceAvailable;	
	private BigDecimal balanceTotal;	
	private String yeepayBindcardCardno;	
	private String yeepayBindcardBank;	
	private Boolean yeepayBindcardIsok;	
	private BigDecimal accumulateLender;	
	private BigDecimal accumulateRepay;	
	private BigDecimal accumulateRepayCount;	
	private BigDecimal yeepayAccumulateRepay;	
	private BigDecimal otherAccumulateRepay;	
	private BigDecimal accumuateLenderInterest;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public BigDecimal getAvailableMoney() {
		return availableMoney;
	}
	public void setAvailableMoney(BigDecimal availableMoney) {
		this.availableMoney = availableMoney;
	}
	public BigDecimal getAvailableReward() {
		return availableReward;
	}
	public void setAvailableReward(BigDecimal availableReward) {
		this.availableReward = availableReward;
	}
	public BigDecimal getFrozen_money_invest() {
		return frozen_money_invest;
	}
	public void setFrozen_money_invest(BigDecimal frozen_money_invest) {
		this.frozen_money_invest = frozen_money_invest;
	}
	public BigDecimal getFrozen_money_repay() {
		return frozen_money_repay;
	}
	public void setFrozen_money_repay(BigDecimal frozen_money_repay) {
		this.frozen_money_repay = frozen_money_repay;
	}
	public BigDecimal getFrozenMoneyWithdraw() {
		return frozenMoneyWithdraw;
	}
	public void setFrozenMoneyWithdraw(BigDecimal frozenMoneyWithdraw) {
		this.frozenMoneyWithdraw = frozenMoneyWithdraw;
	}
	public BigDecimal getFrozenRewardRay() {
		return frozenRewardRay;
	}
	public void setFrozenRewardRay(BigDecimal frozenRewardRay) {
		this.frozenRewardRay = frozenRewardRay;
	}
	public BigDecimal getUsedReward() {
		return usedReward;
	}
	public void setUsedReward(BigDecimal usedReward) {
		this.usedReward = usedReward;
	}
	public BigDecimal getReceivablePrincipal() {
		return receivablePrincipal;
	}
	public void setReceivablePrincipal(BigDecimal receivablePrincipal) {
		this.receivablePrincipal = receivablePrincipal;
	}
	public BigDecimal getReceivableInterest() {
		return receivableInterest;
	}
	public void setReceivableInterest(BigDecimal receivableInterest) {
		this.receivableInterest = receivableInterest;
	}
	public BigDecimal getAccumulateRecharge() {
		return accumulateRecharge;
	}
	public void setAccumulateRecharge(BigDecimal accumulateRecharge) {
		this.accumulateRecharge = accumulateRecharge;
	}
	public Integer getAccumulateRechargeCount() {
		return accumulateRechargeCount;
	}
	public void setAccumulateRechargeCount(Integer accumulateRechargeCount) {
		this.accumulateRechargeCount = accumulateRechargeCount;
	}
	public BigDecimal getAccumulatePrincipal() {
		return accumulatePrincipal;
	}
	public void setAccumulatePrincipal(BigDecimal accumulatePrincipal) {
		this.accumulatePrincipal = accumulatePrincipal;
	}
	public BigDecimal getAccumulate_money_invest() {
		return accumulate_money_invest;
	}
	public void setAccumulate_money_invest(BigDecimal accumulate_money_invest) {
		this.accumulate_money_invest = accumulate_money_invest;
	}
	public BigDecimal getAccumulateInterest() {
		return accumulateInterest;
	}
	public void setAccumulateInterest(BigDecimal accumulateInterest) {
		this.accumulateInterest = accumulateInterest;
	}
	public Integer getAccumulateInvest_count() {
		return accumulateInvest_count;
	}
	public void setAccumulateInvest_count(Integer accumulateInvest_count) {
		this.accumulateInvest_count = accumulateInvest_count;
	}
	public BigDecimal getAccumulateFreeWithdraw() {
		return accumulateFreeWithdraw;
	}
	public void setAccumulateFreeWithdraw(BigDecimal accumulateFreeWithdraw) {
		this.accumulateFreeWithdraw = accumulateFreeWithdraw;
	}
	public BigDecimal getAccumulateWithdraw() {
		return accumulateWithdraw;
	}
	public void setAccumulateWithdraw(BigDecimal accumulateWithdraw) {
		this.accumulateWithdraw = accumulateWithdraw;
	}
	public Integer getAccumulateWithdrawCount() {
		return accumulateWithdrawCount;
	}
	public void setAccumulateWithdrawCount(Integer accumulateWithdrawCount) {
		this.accumulateWithdrawCount = accumulateWithdrawCount;
	}
	public BigDecimal getBalanceAvailable() {
		return balanceAvailable;
	}
	public void setBalanceAvailable(BigDecimal balanceAvailable) {
		this.balanceAvailable = balanceAvailable;
	}
	public BigDecimal getBalanceTotal() {
		return balanceTotal;
	}
	public void setBalanceTotal(BigDecimal balanceTotal) {
		this.balanceTotal = balanceTotal;
	}
	public String getYeepayBindcardCardno() {
		return yeepayBindcardCardno;
	}
	public void setYeepayBindcardCardno(String yeepayBindcardCardno) {
		this.yeepayBindcardCardno = yeepayBindcardCardno;
	}
	public String getYeepayBindcardBank() {
		return yeepayBindcardBank;
	}
	public void setYeepayBindcardBank(String yeepayBindcardBank) {
		this.yeepayBindcardBank = yeepayBindcardBank;
	}
	public Boolean getYeepayBindcardIsok() {
		return yeepayBindcardIsok;
	}
	public void setYeepayBindcardIsok(Boolean yeepayBindcardIsok) {
		this.yeepayBindcardIsok = yeepayBindcardIsok;
	}
	public BigDecimal getAccumulateLender() {
		return accumulateLender;
	}
	public void setAccumulateLender(BigDecimal accumulateLender) {
		this.accumulateLender = accumulateLender;
	}
	public BigDecimal getAccumulateRepay() {
		return accumulateRepay;
	}
	public void setAccumulateRepay(BigDecimal accumulateRepay) {
		this.accumulateRepay = accumulateRepay;
	}
	public BigDecimal getAccumulateRepayCount() {
		return accumulateRepayCount;
	}
	public void setAccumulateRepayCount(BigDecimal accumulateRepayCount) {
		this.accumulateRepayCount = accumulateRepayCount;
	}
	public BigDecimal getYeepayAccumulateRepay() {
		return yeepayAccumulateRepay;
	}
	public void setYeepayAccumulateRepay(BigDecimal yeepayAccumulateRepay) {
		this.yeepayAccumulateRepay = yeepayAccumulateRepay;
	}
	public BigDecimal getOtherAccumulateRepay() {
		return otherAccumulateRepay;
	}
	public void setOtherAccumulateRepay(BigDecimal otherAccumulateRepay) {
		this.otherAccumulateRepay = otherAccumulateRepay;
	}
	public BigDecimal getAccumuateLenderInterest() {
		return accumuateLenderInterest;
	}
	public void setAccumuateLenderInterest(BigDecimal accumuateLenderInterest) {
		this.accumuateLenderInterest = accumuateLenderInterest;
	}	
	
}
