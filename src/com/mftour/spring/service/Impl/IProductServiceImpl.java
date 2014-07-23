package com.mftour.spring.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mftour.spring.Dao.IProductDao;
import com.mftour.spring.Dao.IUserDao;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.util.Page;


@Service("productService")
public class IProductServiceImpl implements  IProductService {

	
	@Autowired
	private IProductDao productDao;
	
	

	@Override
	public List<TProduct> getProduct(Page page) throws Exception {
		return  productDao.getProduct(page);
	}



	@Override
	public TProduct getProductById(Long id) {
		
		return  productDao.getProductById(id);
	}



	
	
	
	
	
	

}
