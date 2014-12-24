package com.mftour.spring.rest.bean;
import com.mftour.spring.base.JsonBaseBean;
import com.mftour.spring.model.Rewards;

public class ResponseReward extends JsonBaseBean{
    private Rewards res;

    public Rewards getRes() {
        return res;
    }

    public void setRes(Rewards res) {
        this.res = res;
    }
}
