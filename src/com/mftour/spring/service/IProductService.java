package com.mftour.spring.service;

import java.util.List;

import com.mftour.spring.model.TUser;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.util.Page;

public interface IProductService {
	
	public List<TProduct> getProduct(Page page,TProduct product)throws Exception;
	
	 public TProduct getProductById(Long id);
	 
	  public List<TProduct> queryProductByType(Integer type);
	  
	  public List<TProduct> queryProduct(TProduct product)throws Exception;
	  
	  public List<TProduct> queryProductByNumber(String  enterpriseNumber)throws Exception;
	  
	  public void deleteProduct(Long id) throws Exception;
	  
	 

}
