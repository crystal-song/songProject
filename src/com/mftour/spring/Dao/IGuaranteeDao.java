package com.mftour.spring.Dao;

import java.util.List;

import com.mftour.spring.model.TChannel;

public interface IGuaranteeDao {

	public List<TChannel> getTChannel() throws Exception;

}
