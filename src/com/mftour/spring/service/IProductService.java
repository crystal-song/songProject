package com.mftour.spring.service;

import java.util.List;

import com.mftour.spring.model.TUser;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.util.Page;

public interface IProductService {
	
	public List<TProduct> getProduct(Page page)throws Exception;
	
	 public TProduct getProductById(Long id);

}
