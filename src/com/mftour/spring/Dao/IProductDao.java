package com.mftour.spring.Dao;

import java.util.List;

import com.mftour.spring.model.TProduct;
import com.mftour.spring.util.Page;

public interface IProductDao {
	
	public List<TProduct> getProduct(Page page,TProduct product)throws Exception;
	
	 public TProduct getProductById(Long id);
	 
	 public List<TProduct> queryProductByType(Integer type);
	 
	 
	 
	
	
	

}
