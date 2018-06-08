package com.itheima.core.service;
import com.itheima.common.utils.Page;
import com.itheima.core.po.Customer;
import com.itheima.core.po.product;
public interface CustomerService {
	// 查询客户信息列表
	public Page<Customer> findCustomerList(Integer page, Integer rows, 
                                        String custName,String custSource,
                                        String custIndustry,String custLevel);
	//添加器材信息
	public int createProduct(product p);
	//添加报修器材信息
	public int createRepairProduct(product p);
	// 更新报修表器材信息
	public int updateRepair(product p);
	//添加报废器材信息
	public int createScrapProduct(product p);
	// 通过id查询器材信息
	public product getProductById(Integer id);
	// 创建允许报修器材信息
	public int createAgreeRepair(product p);
	//查看允许报修器材信息
	public Page<product> selectAgreeRepair(Integer page, Integer rows,String remark);
	//添加完成报修器材信息
	public int createEndRepair(product p);
	//更新报修表器材信息
	public int updateEndRepair(product p);
	// 更新器材信息
	public int updateProduct(product p);
	// 删除器材信息
	public int deleteProduct(Integer id);
	// 创建删除器材信息
	public int createDeleteProduct(product p);
	// 查询器材信息列表
	public Page<product> findProductLast(Integer page, Integer rows,Integer s_productId,String s_className,String s_modelName,String s_manufacturer);
    // 查询报修器材信息
	public Page<product> queryRepair(Integer page, Integer rows,String remark);
}
