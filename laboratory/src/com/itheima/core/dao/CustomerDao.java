package com.itheima.core.dao;
import java.util.List;
import com.itheima.core.po.Customer;
import com.itheima.core.po.product;
/**
 * Customer接口
 */
public interface CustomerDao {
    // 客户信息列表
	public List<Customer> selectCustomerList(Customer customer);
	// 客户数
	public Integer selectCustomerListCount(Customer customer);
	// 创建器材信息
	public int createProduct(product p);
	// 创建报修器材信息
	public int createRepairProduct(product p);
	// 创建报废器材信息
	public int createScrapProduct(product p);
	// 通过id查询器材信息
	public product getProductById(Integer id);
	// 创建允许报修器材信息
	public int createAgreeRepair(product p);
	//查看允许报修器材信息
	public List<product> selectAgreeRepair(product p);
	//允许报修器材信息总数
	public Integer selectAgreeRepairCount(product p);
	// 更新报修表器材信息
	public int updateRepair(product p);
	//创建完成报修器材信息
	public int createEndRepair(product p);
	//更新保修表器材状态信息
	public int updateEndRepair(product p);
	// 更新器材信息
	public int updateProduct(product p);
	// 删除器材信息
	public int deleteProduct (Integer id);
	// 创建删除器材信息
	public int createDeleteProduct (product p);
	//器材信息列表
	public List<product> selectProductLast(product p);
	//器材数
	public Integer selectProductLastCount(product p);
	//报修器材列表
	public List<product> queryRepair(product p);
	//报废器材数
	public Integer queryRepairCount(product p);

}
