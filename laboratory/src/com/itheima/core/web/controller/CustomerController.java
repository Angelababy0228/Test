package com.itheima.core.web.controller;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itheima.common.utils.Page;
import com.itheima.core.po.BaseDict;
import com.itheima.core.po.Customer;
import com.itheima.core.po.User;
import com.itheima.core.po.product;
import com.itheima.core.service.BaseDictService;
import com.itheima.core.service.CustomerService;
/**
 * 客户管理控制器类
 */
@Controller
public class CustomerController {
	// 依赖注入
	@Autowired
	private CustomerService customerService;//避免去new
	@Autowired
	private BaseDictService baseDictService;
	// 客户来源
	@Value("${customer.from.type}")
	private String FROM_TYPE;
	// 客户所属行业
	@Value("${customer.industry.type}")
	private String INDUSTRY_TYPE;
	// 客户级别
	@Value("${customer.level.type}")
	private String LEVEL_TYPE;
	//器材类别
	@Value("${product.className}")
	private String CLASSNAME_TYPE;
	//器材型号
	@Value("${product.modelName}")
	private String MODELNAME_TYPE;
	//生产厂家
	@Value("${product.manufacturer}")
	private String MANUFACTURER_TYPE;
	//处理情况
	@Value("${product.remark}")
	private String REMARK_TYPE;
	/**
	 *  客户列表
	 */
	@RequestMapping(value = "/customer/list.action")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows, 
			String custName, String custSource, String custIndustry,
			String custLevel, Model model,HttpSession session) {
		// 条件查询所有客户
		Page<Customer> customers = customerService
				.findCustomerList(page, rows, custName, 
                                        custSource, custIndustry,custLevel);
		model.addAttribute("page", customers);
		// 客户来源
		List<BaseDict> fromType = baseDictService
				.findBaseDictByTypeCode(FROM_TYPE);
		// 客户所属行业
		List<BaseDict> industryType = baseDictService
				.findBaseDictByTypeCode(INDUSTRY_TYPE);
		// 客户级别
		List<BaseDict> levelType = baseDictService
				.findBaseDictByTypeCode(LEVEL_TYPE);
		// 添加参数
		model.addAttribute("fromType", fromType);
		model.addAttribute("industryType", industryType);
		model.addAttribute("levelType", levelType);
		model.addAttribute("custName", custName);
		model.addAttribute("custSource", custSource);
		model.addAttribute("custIndustry", custIndustry);
		model.addAttribute("custLevel", custLevel);
	    
				return "customer";
	}
	
	/**
	 * 创建器材信息
	 * 
	 */
	@RequestMapping("/product/create.action")
	@ResponseBody  //加上@responsebody后，返回结果直接写入HTTP response body中，不会被解析为跳转路径。比如异步请求，希望响应的结果是json数据，那么加上@responsebody后，就会直接返回json数据。

	public String customerCreate(product p,HttpSession session) throws ParseException {
	    // 获取Session中的当前用户信息
		
	    User user = (User) session.getAttribute("USER_SESSION");
	    // 将当前用户id存储在客户对象中
	    p.setHandler(user.getUser_name());
	    // 创建Date对象
	    Date date = new Date();
	    // 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
	    Timestamp timeStamp = new Timestamp(date.getTime());
	    p.setRecordDate(timeStamp);
	    
		
	    // 执行Service层中的创建方法，返回的是受影响的行数
	    int rows = customerService.createProduct(p);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 通过id获取器材信息
	 */
	@RequestMapping("/product/getProductById.action")
	@ResponseBody
	public product getProductById(Integer id) {
	    product p = customerService.getProductById(id);
	    return p;
	}
	/**
	 * 通过id删除器材信息
	 */
	@RequestMapping("/product/deleteProductById.action")
	@ResponseBody
	public String deleteProductById(product p1,HttpSession session) {
		Integer rows = 0;
		Integer id = p1.getProductId();
		Integer number = p1.getProductNumber();
		product p = customerService.getProductById(id);
		Integer number1 = p.getProductNumber();
		User user = (User) session.getAttribute("USER_SESSION");
		p.setHandler(user.getUser_name());
		Date date = new Date();
		Timestamp timeStamp = new Timestamp(date.getTime());
		p.setRecordDate(timeStamp);
		p.setProductNumber(number);
		int row = customerService.createDeleteProduct(p);
		if(number==number1){
		rows = customerService.deleteProduct(id);
		}else{
			product p2 = new product();
			int number2 = number1 - number;
			p2.setProductNumber(number2);
			p2.setProductId(p1.getProductId());
			System.out.println(p2.getPrice());
			rows = customerService.updateProduct(p2);
		}
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	/**
	 * 创建允许报修器材信息
	 */
	@RequestMapping("/product/agreeRepair.action")
	@ResponseBody
	public String agreeRepair(product p, String agreeid,HttpSession session) {
		User user = (User) session.getAttribute("USER_SESSION");
	    // 将当前用户id存储在客户对象中
	    p.setLeader(user.getUser_name());
	    // 创建Date对象
	    Date date = new Date();
	    // 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
	    Timestamp timeStamp = new Timestamp(date.getTime());
	    p.setRecordDate(timeStamp);
		p.setAgreeid(agreeid);
		int rows1 = customerService.createAgreeRepair(p);   //添加允许报修产品id
		int rows2 = customerService.updateRepair(p);      //更新报修表为“已处理” ，更新产品表为“已批报修”
		if(rows1 > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}
	/**
	 * 更新器材信息
	 */
	@RequestMapping("/product/update.action")
	@ResponseBody
	public String productUpdate(product p) {
		System.out.println(p.getProductId());
	    int rows = customerService.updateProduct(p);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	
	/**
	 * 查询器材信息
	 */
	@RequestMapping(value = "/product/last.action")
	public String creat(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows,Integer s_productId,String s_className, String s_modelName, String s_manufacturer,
			Model model,HttpSession session) {
		session.setAttribute("goddess", "angelababy");
		// 条件查询所有客户
		Page<product> products = customerService.findProductLast(page, rows,s_productId,s_className,s_modelName,s_manufacturer);
		model.addAttribute("page", products);
		Page<product> AgreeRepairProduct = customerService.selectAgreeRepair(page, rows,"42");
		model.addAttribute("page3", AgreeRepairProduct);
		
		// 器材类别
		List<BaseDict> classNameType = baseDictService
				.findBaseDictByTypeCode(CLASSNAME_TYPE);
		// 器材型号
		List<BaseDict> modelNameType = baseDictService
				.findBaseDictByTypeCode(MODELNAME_TYPE);
		// 生产厂家
		List<BaseDict> manufacturerType = baseDictService
				.findBaseDictByTypeCode(MANUFACTURER_TYPE);
		model.addAttribute("classNameType", classNameType);
		model.addAttribute("modelNameType", modelNameType);
		model.addAttribute("manufacturerType", manufacturerType);
		model.addAttribute("productId", s_productId);
		model.addAttribute("className", s_className);
		model.addAttribute("modelName", s_modelName);
		model.addAttribute("manufacturer", s_manufacturer);
		User user = (User) session.getAttribute("USER_SESSION");
		if(user.getUser_state().equals("1")){
				return "leader";
		}
		else if(user.getUser_state().equals("2")){
			    return "manager";
		} 
		else return "student";
			
	}
	/**
	 * 创建报修器材信息
	 */
	@RequestMapping("/product/createRepair.action")
	@ResponseBody
	public String repairCreate(product p,HttpSession session) throws ParseException {
	    // 获取Session中的当前用户信息
		
	    User user = (User) session.getAttribute("USER_SESSION");
	    // 将当前用户id存储在客户对象中
	    p.setHandler(user.getUser_name());
	    // 创建Date对象
	    Date date = new Date();
	    // 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
	    Timestamp timeStamp = new Timestamp(date.getTime());
	    p.setRecordDate(timeStamp);
	    p.setRemark("未处理");
		
	    // 执行Service层中的创建方法，返回的是受影响的行数
	    int rows = customerService.createRepairProduct(p);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}
	/**
	 * 创建报废器材信息
	 */
	@RequestMapping("/product/createScrap.action")
	@ResponseBody
	public String scrapCreate(product p,HttpSession session) throws ParseException {
		// 获取Session中的当前用户信息
		
		User user = (User) session.getAttribute("USER_SESSION");
		// 将当前用户id存储在客户对象中
		p.setHandler(user.getUser_name());
		// 创建Date对象
		Date date = new Date();
		// 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
		Timestamp timeStamp = new Timestamp(date.getTime());
		p.setScrapDate(timeStamp);
		p.setRemark("未处理");
		
		// 执行Service层中的创建方法，返回的是受影响的行数
		int rows = customerService.createScrapProduct(p);
		if(rows > 0){
			return "OK";
		}else{
			return "FAIL";
		}
	}
	/**
	 * 查看报修器材信息
	 * 
	 */
	@RequestMapping(value = "/product/queryRepair.action")
	public String queryRepair(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows,Model model,String remark)  {
		// 条件查询所有客户
		// 器材类别
		List<BaseDict> remarkType = baseDictService
				.findBaseDictByTypeCode(REMARK_TYPE);
		model.addAttribute("remarkType", remarkType);
		model.addAttribute("remark", remark);
		Page<product> repairProduct = customerService.queryRepair(page, rows,
				remark);
		model.addAttribute("page1", repairProduct);

		return "repair";
		
			
	}
	/**
	 * 查看已批报修器材信息
	 */
	@RequestMapping(value = "/product/queryAgreeRepair.action")
	public String queryAgreeRepair(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows,Model model,String remark) {
		// 条件查询所有客户
		List<BaseDict> remarkType = baseDictService
				.findBaseDictByTypeCode(REMARK_TYPE);
		model.addAttribute("remarkType", remarkType);
		model.addAttribute("remark", remark);
		Page<product> AgreeRepairProduct1 = customerService.selectAgreeRepair(page, rows,"42");
		model.addAttribute("page3", AgreeRepairProduct1);
		Page<product> AgreeRepairProduct = customerService.selectAgreeRepair(page, rows,remark);
		model.addAttribute("page2", AgreeRepairProduct);
		return "agreeRepair";
	}
	/**
	 * 完成报修
	 */
	@RequestMapping("/product/endRepair.action")
	@ResponseBody
	public String endRepair(product p, HttpSession session) {
		// 获取Session中的当前用户信息

		User user = (User) session.getAttribute("USER_SESSION");
		// 将当前用户id存储在客户对象中
		p.setHandler(user.getUser_name());
		// 创建Date对象
		Date date = new Date();
		// 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
		Timestamp timeStamp = new Timestamp(date.getTime());
		p.setRecordDate(timeStamp);
		p.setSituation("可用");
		int rows1 = customerService.createEndRepair(p); // 添加完成报修产品
		int rows2 = customerService.updateEndRepair(p); // 更新产品表为“可用”
		if (rows1 > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

}
