package com.mftour.spring.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mftour.spring.Dao.IProductDao;
import com.mftour.spring.Dao.IUserDao;
import com.mftour.spring.model.ProductRepays;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.UserRepays;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.util.Page;

@Service("productService")
public class IProductServiceImpl implements IProductService {

	@Autowired
	private IProductDao productDao;

	@Override
	public List<TProduct> getProduct(Page page, TProduct product)
			throws Exception {
		return productDao.getProduct(page, product);
	}

	@Override
	public TProduct getProductById(Long id) {

		return productDao.getProductById(id);
	}

	@Override
	public List<TProduct> queryProductByType(Integer type) {

		return productDao.queryProductByType(type);
	}

	@Override
	public List<TProduct> queryProduct(TProduct product) throws Exception {
		return productDao.queryProduct(product);
	}

	@Override
	public List<TProduct> queryProductByNumber(String enterpriseNumber)
			throws Exception {

		return productDao.queryProductByNumber(enterpriseNumber);
	}

	@Override
	public void deleteProduct(Long id) throws Exception {
		productDao.deleteProduct(id);

	}
	public List<TProduct> queryProductByTargetPlatformUserNo(Page page,String targetPlatformUserNo) throws Exception{
        	return 	productDao.queryProductByTargetPlatformUserNo(page,targetPlatformUserNo);
	}
	public List<ProductRepays> queryProductRepaysByNumber(String enterpriseNumber) throws Exception {
		return productDao.queryProductRepaysByNumber(enterpriseNumber);
	}
	public ProductRepays queryProductRepaysByid(int id) throws Exception{
		return productDao.queryProductRepaysByid(id);
	}
	public List< UserRepays> queryUserRepaysByPeriod(int period,String enterpriseNumber) throws Exception {
		return productDao.queryUserRepaysByPeriod(period, enterpriseNumber);
	}
}
