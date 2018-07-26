package com.spark.service;

import com.spark.bean.Product;
import com.spark.dao.ProductDao;

public class ProductService {
	public boolean isEmptyProduct(int productId){
		ProductDao productDao=new ProductDao();
		Product product=productDao.getProductByProductId(productId);
		if(product.getAmount()<=0){
			//System.out.println(product.getAmount());
			return true;
		}
		return false;
	}
}
