package com.itheima.core.service.impl;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.core.util.Integers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.itheima.common.utils.Page;
import com.itheima.core.dao.CustomerDao;
import com.itheima.core.po.Customer;
import com.itheima.core.po.product;
import com.itheima.core.service.CustomerService;
/**
 * 客户管理
 */
@Service("CustomerService") //当Spring要创建CustomerServiceImpl的的实例时，bean的名字必须叫做"CustomerService"
@Transactional
public class CustomerServiceImpl implements CustomerService {
	// 声明DAO属性并注入
	@Autowired
	private CustomerDao customerDao;
	// 客户信息列表
	public Page<Customer> findCustomerList(Integer page, Integer rows, 
			String custName,  String custSource,String custIndustry,
                                                          String custLevel) {
		// 创建客户对象
         Customer customer = new Customer();
		// 判断客户名称
		if(StringUtils.isNotBlank(custName)){
			customer.setCust_name(custName);
		}
		// 判断客户信息来源
		if(StringUtils.isNotBlank(custSource)){
			customer.setCust_source(custSource);
		}
		// 判断客户所属行业
		if(StringUtils.isNotBlank(custIndustry)){
			customer.setCust_industry(custIndustry);
		}
		// 判断客户级别
		if(StringUtils.isNotBlank(custLevel)){
			customer.setCust_level(custLevel);
		}
		// 当前页
		customer.setStart((page-1) * rows) ;
		// 每页数
		customer.setRows(rows);
		// 查询客户列表
		List<Customer> customers = 
                            customerDao.selectCustomerList(customer);
		// 查询客户列表总记录数
		Integer count = customerDao.selectCustomerListCount(customer);
		// 创建Page返回对象
		Page<Customer> result = new Page<Customer>();
		result.setPage(page);
		result.setRows(customers);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
	/**
	 * 创建器材信息
	 */
	public int createProduct(product p) {
	    return customerDao.createProduct(p);
	}
	/**
	 * 创建报修器材信息
	 */
	public int createRepairProduct(product p) {
		product p1 = new product();
		p1.setProductId(p.getProductId());
		p1.setSituation("报修中");
		customerDao.updateProduct(p1);
		return customerDao.createRepairProduct(p);
	}
	/**
	 * 创建报废器材信息
	 */
	public int createScrapProduct(product p) {
		return customerDao.createScrapProduct(p);
	}
	/**
	 * 通过id查询器材信息
	 */
	public product getProductById(Integer id) {	
	    product p = customerDao.getProductById(id);
	    return p;		
	}
	/**
	 * 创建允许报修器材信息
	 */
	public int createAgreeRepair(product p) {
		String ids = p.getAgreeid();
		String agreeId[]= ids.split(",");
		int row = 0;
		for(int i=1;i<agreeId.length;i++){
			  int id =Integer.parseInt(agreeId[i]);
			  p.setProductId(id);
			   row = customerDao.createAgreeRepair(p);
			  }
		return row;
				
	}
	/**
	 * 更新报修表器材信息 and 器材表器材状态
	 */
	public int updateRepair(product p) {	
		String ids = p.getAgreeid();
		String agreeId[]= ids.split(",");
		  for(int i=1;i<agreeId.length;i++){
		  int id =Integer.parseInt(agreeId[i]);
		  product p2 = new product();
		  p2.setProductId(id);
		  p2.setRemark("已处理");
		  int updateRepair = customerDao.updateRepair(p2);
		  product p1 = new product();
		  p1.setProductId(id);
		  p1.setSituation("已批报修");
		  int updateProduct = customerDao.updateProduct(p1);
		  }
		return 1;
	}
	/**
	 * 创建完成报修器材信息
	 */
	public int createEndRepair(product p){
		
		int row = customerDao.createEndRepair(p);
		return row;
	}
	/**
	 * 完成报修后 更新器材表器材状态
	 */
	public int updateEndRepair(product p){
		p.setSituation("可用");
		p.setRemark("完成修理");
		int row = customerDao.updateEndRepair(p);
		int row1 = customerDao.updateRepair(p);
		return row;
		
	}
	/**
	 * 查看允许报修器材信息
	 */
	public Page<product> selectAgreeRepair(Integer page, Integer rows,String remark) {
		// 创建客户对象
         product p = new product();
		// 当前页
         p.setStart(((page-1) * rows));
		// 每页数
		p.setRows(rows);
		if(remark!=null&&remark!=""&&remark.equals("41")){
			p.setRemark("未处理");
			}
			if(remark!=null&&remark!=""&&remark.equals("42")){
				p.setRemark("已处理");
			}
			if(remark!=null&&remark!=""&&remark.equals("43")){
				p.setRemark("完成修理");
			}
		// 查询器材列表
		List<product> ps = customerDao.selectAgreeRepair(p);
		// 查询器材列表总记录数
		Integer count = customerDao.selectAgreeRepairCount(p);
		// 创建Page返回对象
		Page<product> result = new Page<product>();
		result.setPage(page);
		result.setRows(ps);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
	/**
	 * 更新器材信息
	 */
	public int updateProduct(product p) {
	    return customerDao.updateProduct(p);
	}
	/**
	 * 删除器材信息
	 */
	public int deleteProduct(Integer id) {
	    return customerDao.deleteProduct(id);	
	}
	/**
	 * 创建删除器材信息
	 */
		public int createDeleteProduct(product p) {
		return customerDao.createDeleteProduct(p);	
	}
	/**
	 * 器材信息列表
	 */
	public Page<product> findProductLast(Integer page, Integer rows,Integer s_productId,String s_className,String s_modelName,String s_manufacturer) {
		// 创建客户对象
         product p = new product();
		// 当前页
         p.setStart(((page-1) * rows));
		// 每页数
		p.setRows(rows);
		
		if(s_productId !=null){
			System.out.println("asdasdasdasdasdasd");
			p.setProductId(s_productId);
		}
		// 判断器材类别
		if(StringUtils.isNotBlank(s_className)){
			p.setClassName(s_className);
		}
		// 判断器材型号
		if(StringUtils.isNotBlank(s_modelName)){
			p.setModelName(s_modelName);
		}
		// 判断器材生产厂家
		if(StringUtils.isNotBlank(s_manufacturer)){
		    p.setManufacturer(s_manufacturer);
		}
		
		// 查询器材列表
		List<product> ps = customerDao.selectProductLast(p);
		// 查询器材列表总记录数
		Integer count = customerDao.selectProductLastCount(p);
		// 创建Page返回对象
		Page<product> result = new Page<product>();
		result.setPage(page);
		result.setRows(ps);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
  /**
   * 查看报修器材信息列表
   */
	public Page<product> queryRepair(Integer page, Integer rows,String remark) {
		// 创建客户对象
         product p = new product();
		// 当前页
         p.setStart(((page-1) * rows));
		// 每页数
		p.setRows(rows);
		if(remark!=null&&remark!=""&&remark.equals("41")){
		p.setRemark("未处理");
		}
		if(remark!=null&&remark!=""&&remark.equals("42")){
			p.setRemark("已处理");
		}
		if(remark!=null&&remark!=""&&remark.equals("43")){
			p.setRemark("完成修理");
		}
		// 查询器材列表
		List<product> ps = customerDao.queryRepair(p);
		// 查询器材列表总记录数
		Integer count = customerDao.queryRepairCount(p);
		// 创建Page返回对象
		Page<product> result = new Page<product>();
		result.setPage(page);
		result.setRows(ps);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
	
}
