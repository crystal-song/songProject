package com.mftour.spring.rest.bean;
import com.mftour.spring.base.JsonBaseBean;
import com.mftour.spring.model.Rewards;

public class ResponseReward extends JsonBaseBean{
    private Rewards reward;

    public Rewards getReward() {
        return reward;
    }

    public void setReward(Rewards reward) {
        this.reward = reward;
    }
}
