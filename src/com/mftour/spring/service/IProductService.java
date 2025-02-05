package com.mftour.spring.service;

import java.util.List;

import com.mftour.spring.model.ProductRepays;
import com.mftour.spring.model.TUser;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.UserRepays;
import com.mftour.spring.util.Page;

public interface IProductService {

	public List<TProduct> getProduct(Page page, TProduct product)
			throws Exception;

	public TProduct getProductById(Long id);

	public List<TProduct> queryProductByType(Integer type);

	public List<TProduct> queryProduct(TProduct product) throws Exception;

	public List<TProduct> queryProductByNumber(String enterpriseNumber)
			throws Exception;

	public void deleteProduct(Long id) throws Exception;
	public List<TProduct> queryProductByTargetPlatformUserNo(Page page,String targetPlatformUserNo) throws Exception;
	public List<ProductRepays> queryProductRepaysByNumber(String enterpriseNumber) throws Exception ;
	public ProductRepays queryProductRepaysByid(int id) throws Exception;
	public List< UserRepays> queryUserRepaysByPeriod(int period,String enterpriseNumber) throws Exception ;
}
