<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%> <!-- 引入自定义标签 -->
<%@ page import="com.itheima.core.po.product"%>
<%@ page import="com.itheima.common.utils.Page"%>
<%@ page import="java.util.Date"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>实验室管理-BootCRM</title>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
  <!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
	<div class="navbar-header">
	    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> 
	    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
	    </button>
		<a class="navbar-brand" href="<%=basePath%>customer/list.action">BOOT客户管理系统 v2.0</a>
	</div>
	<!-- 导航栏右侧图标部分 -->
	<ul class="nav navbar-top-links navbar-right">
	    <!-- 邮件通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-envelope fa-fw"></i>        <!--图标应用  -->
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-messages">
				<li>
				    <a href="#">
						<div>
							<strong>张经理</strong> <span class="pull-right text-muted">
								<em>昨天</em>
							</span>
						</div>
						<div>今天晚上开会，讨论一下下个月工作的事...</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="#">
				        <strong>查看全部消息</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul>
		</li>
		<!-- 邮件通知 end -->
		<!-- 任务通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
			    <i class="fa fa-tasks fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-tasks">
				<li>
				    <a href="#">
						<div>
							<p>
								<strong>任务 1</strong> 
								<span class="pull-right text-muted">完成40%</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100" style="width: 40%">
									<span class="sr-only">完成40%</span>
								</div>
							</div>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<p>
								<strong>任务 2</strong> 
								<span class="pull-right text-muted">完成20%</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-info" role="progressbar"
									aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
									style="width: 20%">
									<span class="sr-only">完成20%</span>
								</div>
							</div>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="#"> 
				        <strong>查看所有任务</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul> 
		</li>
		<!-- 任务通知 end -->
		<!-- 消息通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-bell fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-alerts">
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-comment fa-fw"></i> 新回复 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-envelope fa-fw"></i> 新消息 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-tasks fa-fw"></i> 新任务 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-upload fa-fw"></i> 服务器重启 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="#"> 
				        <strong>查看所有提醒</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul> 
		</li>
		<!-- 消息通知 end -->
		<!-- 用户信息和系统设置 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#"><i class="fa fa-user fa-fw"></i>
				               用户：${USER_SESSION.user_name}
				    </a>
				</li>
				<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
				<li class="divider"></li>
				<li>
					<a href="${pageContext.request.contextPath }/logout.action">
					<i class="fa fa-sign-out fa-fw"></i>退出登录
					</a>
				</li>
			</ul> 
		</li>
		<!-- 用户信息和系统设置结束 -->
	</ul>
	<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="查询内容...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
					</div> 
				</li>
				<li>
				    <a href="#">
				       <i class="fa fa-edit fa-fw"></i>首页
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath }/product/last.action" class="active">
				      <i class="fa fa-edit fa-fw"></i> 查询器材
				    </a>
				    <ul class="nav">
                            
                                <li>
                                    <a href="queryAgreeRepair.action">&nbsp;&nbsp;报修器材信息</a>
                                </li>
                                <li>
                                    <a href="#">&nbsp;&nbsp;报废器材信息</a>
                                </li>
                                <li>
                                    <a href="#">&nbsp;&nbsp;学生信息</a>
                                </li>
                            </ul>
				</li>
				<li>
				    <a  href="#" data-toggle="modal" 
		           data-target="#newProductDialog" onclick="clearProduct()">
				      <i class="fa fa-dashboard fa-fw" ></i>添加器材
				    </a>
				</li>
				<li>
				    <a href="#" data-toggle="modal"
				    data-target="#repairProductDialog" onclick="clearRepairProduct()">
				      <i class="fa fa-dashboard fa-fw" ></i>报修器材
				    </a>
				</li>
				<li>
				    <a href="#" data-toggle="modal"
				    data-target="#scrapProductDialog" onclick="clearScrapProduct()">
				      <i class="fa fa-dashboard fa-fw" ></i>报废器材
				    </a>
				</li>
				<li>
				    <a href="#" data-toggle="modal"
				    data-target="#endRepairProductDialog" onclick="clearEndRepairProduct()">
				      <i class="fa fa-dashboard fa-fw" ></i>完成修理
				    </a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 左侧显示列表部分 end--> 
  </nav>
    <!-- 客户列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">器材信息</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" 
				      action="${pageContext.request.contextPath }/customer/last.action">
					<div class="form-group">
						<label for="productName">产品编号</label> 
						<select	class="form-control" id="productId" name="s_productId">
							<option value="">--请选择--</option>
							<c:forEach items="${page.rows}" var="item">
								<option value="${item.productId}"
								 <c:if test="${item.productId == productId}">selected</c:if>>

								    ${item.productId }
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="productFrom">器材类别</label> 
						<select	class="form-control" id="className" name="s_className">
							<option value="">--请选择--</option>
							<c:forEach items="${classNameType}" var="item">
								<option value="${item.dict_id}"
								       <c:if test="${item.dict_id == className}">selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="productId">器材型号</label> 
						<select	class="form-control" id="modelName"  name="s_modelName">
							<option value="">--请选择--</option>
							<c:forEach items="${modelNameType}" var="item">
								<option value="${item.dict_id}"
								        <c:if test="${item.dict_id == modelName}"> selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="manufacturer">生产厂家</label>
						<select	class="form-control" id="manufacturer" name="s_manufacturer">
							<option value="">--请选择--</option>
							<c:forEach items="${manufacturerType}" var="item">
								<option value="${item.dict_id}"
								        <c:if test="${item.dict_id == manufacturer}"> selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newCustomerDialog" onclick="clearCustomer()">新建</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">客户信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
								<tr>
									<th>编号</th>
									<th>类别</th>
									<th>型号</th>
									<th>生产厂家</th>
									<th>名称</th>
									<th>数量</th>
									<th>单价</th>
									<th>保质期</th>
									<th>登记日期</th>
									<th>使用现状</th>
									<th>经办人</th>
									<th>备注</th>
								</tr>
							</thead>
						
								<%
									Page<product> p = (Page<product>) request.getAttribute("page");
									for (product row : p.getRows()) {
									
								%>
								<tr>
									<td><%=row.getProductId() %></td>
									<td><%=row.getClassName()  %></td>
									<td><%=row.getModelName() %></td>
									<td><%=row.getManufacturer() %></td>
									<td><%=row.getProductName() %></td>
									<td><%=row.getProductNumber() %></td>
									<td><%=row.getPrice() %></td>
									<td><%=row.getGuaranteeperiod() %></td>
									<td><%  
									SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								   out.print(sdf.format(row.getRecordDate())); %></td>
									<td><%=row.getSituation() %></td>
									<td><%=row.getHandler() %></td>
									<td><%=row.getRemark() %></td>
									<td style="text-align: center;">
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#productEditDialog" onclick= "editProduct(<%=row.getProductId() %>)">修改</a>
										<a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#productDeleteDialog" onclick="deleteProduct(<%= row.getProductId() %>)" >删除</a>
									</td>
								</tr>
						<% }%>
						
					</table>
					<div class="col-md-12 text-right">
						<itheima:page url="${pageContext.request.contextPath }/product/last.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 客户列表查询部分  end-->
</div>
<!-- 创建器材信息模态框 -->
<div class="modal fade" id="newProductDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建器材信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_product_form">
					<div class="form-group">
						<label for="new_className" style="float:left;padding:7px 15px 0 27px;">器材类别</label> 
						<div class="col-sm-10">
							<select	class="form-control" id="new_className" name="className">
							<option value="">--请选择--</option>
							<c:forEach items="${classNameType}" var="item">
								<option value="${item.dict_id}"
								       <c:if test="${item.dict_id == className}">selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_modelName" style="float:left;padding:7px 15px 0 27px;">器材型号</label>
						<div class="col-sm-10"> 
							<select	class="form-control" id="new_modelName"  name="modelName">
							<option value="">--请选择--</option>
							<c:forEach items="${modelNameType}" var="item">
								<option value="${item.dict_id}"
								        <c:if test="${item.dict_id == modelName}"> selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_manufacturer" style="float:left;padding:7px 15px 0 27px;">生产厂家</label>
						<div class="col-sm-10">
							<select	class="form-control" id="new_manufacturer" name="manufacturer">
							<option value="">--请选择--</option>
							<c:forEach items="${manufacturerType}" var="item">
								<option value="${item.dict_id}"
								        <c:if test="${item.dict_id == manufacturer}"> selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_productName" class="col-sm-2 control-label">名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_productName" placeholder="名称" name="productName" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_productNumber" class="col-sm-2 control-label">数量</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_productNumber" placeholder="数量" name="productNumber" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_price" class="col-sm-2 control-label">单价</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_price" placeholder="单价" name="price" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_guaranteeperiod" class="col-sm-2 control-label">保质期</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_guaranteeperiod" placeholder="保质期" name="guaranteeperiod" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_dataofPurchase" class="col-sm-2 control-label">购置日期</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_dataofPurchase" placeholder="购置日期" name="dataofPurchase" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_situation" class="col-sm-2 control-label">使用现状</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_situation" placeholder="使用现状" name="situation" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="new_remark" class="col-sm-2 control-label">备注</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_remark" placeholder="备注" name="remark" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createProduct()">创建客户</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改器材信息模态框 -->
<div class="modal fade" id="productEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改器材信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_product_form">
				<div class="form-group">
						<label for="edit_productId"style="float:left;padding:7px 15px 0 27px;">产品编号</label> 
						<div class="col-sm-10">
						<input	class="form-control" id="edit_productId" name="productId" readonly="readonly">
					    </div>
					</div>
					<div class="form-group">
						<label for="edit_className" style="float:left;padding:7px 15px 0 27px;">器材类别</label> 
						<div class="col-sm-10">
							<select	class="form-control" id="edit_className" name="className">
							<option value="">--请选择--</option>
							<c:forEach items="${classNameType}" var="item">
								<option value="${item.dict_id}"
								       <c:if test="${item.dict_id == className}">selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_modelName" style="float:left;padding:7px 15px 0 27px;">器材型号</label>
						<div class="col-sm-10"> 
							<select	class="form-control" id="edit_modelName"  name="modelName">
							<option value="">--请选择--</option>
							<c:forEach items="${modelNameType}" var="item">
								<option value="${item.dict_id}"
								        <c:if test="${item.dict_id == modelName}"> selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_manufacturer" style="float:left;padding:7px 15px 0 27px;">生产厂家</label>
						<div class="col-sm-10">
							<select	class="form-control" id="edit_manufacturer" name="manufacturer">
							<option value="">--请选择--</option>
							<c:forEach items="${manufacturerType}" var="item">
								<option value="${item.dict_id}"
								        <c:if test="${item.dict_id == manufacturer}"> selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_productName" class="col-sm-2 control-label">名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_productName" placeholder="名称" name="productName" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_productNumber" class="col-sm-2 control-label">数量</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_productNumber" placeholder="数量" name="productNumber" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_price" class="col-sm-2 control-label">单价</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_price" placeholder="单价" name="price" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_guaranteeperiod" class="col-sm-2 control-label">保质期</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_guaranteeperiod" placeholder="保质期" name="guaranteeperiod" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_dataofPurchase" class="col-sm-2 control-label">购置日期</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_dataofPurchase" placeholder="购置日期" name="dataofPurchase" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_situation" class="col-sm-2 control-label">使用现状</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_situation" placeholder="使用现状" name="situation" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="edit_remark" class="col-sm-2 control-label">备注</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_remark" placeholder="备注" name="remark" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<!-- 删除器材信息模态框 -->
<div class="modal fade" id="productDeleteDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">删除器材信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="delete_product_form">
				<div class="form-group">
						<label for="delete_productId"style="float:left;padding:7px 15px 0 27px;">产品编号</label> 
						<div class="col-sm-10">
						<input	class="form-control" id="delete_productId" name="productId" readonly="readonly">
					    </div>
					</div>
					
					<div class="form-group">
						<label for="delete_productNumber" class="col-sm-2 control-label">删除数量</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="delete_productNumber" placeholder="数量" name="productNumber" />
						</div>
					</div>
					
				
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateDelete()">提交</button>
			</div>
		</div>
	</div>
</div>
<!-- 增加报修信息模态框 -->
<div class="modal fade" id="repairProductDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">创建报修器材信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="repair_product_form">
				<div class="form-group">
						<label for="repair_productId" style="float:left;padding:7px 15px 0 27px">产品编号</label> 
						<div class="col-sm-10">
						<select	class="form-control" id="repair_productId" name="productId">
							<option value="">--请选择--</option>
							<c:forEach items="${page.rows}" var="item">
								<option value="${item.productId}"
								 <c:if test="${item.productId == productId}">selected</c:if>>

								    ${item.productId }
								</option>
							</c:forEach>
						</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="repair_number" class="col-sm-2 control-label">报修数量</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="repair_number" placeholder="报修数量" name="productNumber" />
						</div>
					</div>
					<div class="form-group">
						<label for="repair_cost" class="col-sm-2 control-label">报修费用</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="repair_cost" placeholder="报修费用" name="repairCost" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="repairProduct()">提交</button>
			</div>
		</div>
	</div>
</div>
<!-- 完成报修信息模态框 -->
<div class="modal fade" id="endRepairProductDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">完成报修器材信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="endRepair_product_form">
				<div class="form-group">
						<label for="repair_productId" style="float:left;padding:7px 15px 0 27px">产品编号</label> 
						<div class="col-sm-10">
						<select	class="form-control" id="repair_productId" name="productId">
							<option value="">--请选择--</option>
							<c:forEach items="${page3.rows}" var="item">
								<option value="${item.productId}"
								 <c:if test="${item.productId == productId}">selected</c:if>>

								    ${item.productId }
								</option>
							</c:forEach>
						</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="repair_number" class="col-sm-2 control-label">报修数量</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="repair_number" placeholder="报修数量" name="productNumber" />
						</div>
					</div>
					<div class="form-group">
						<label for="repair_cost" class="col-sm-2 control-label">报修费用</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="repair_cost" placeholder="报修费用" name="repairCost" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="endRepairProduct()">提交</button>
			</div>
		</div>
	</div>
</div>
<!-- 增加报废信息模态框 -->
<div class="modal fade" id="scrapProductDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">创建报废器材信息信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="scrap_product_form">
				<div class="form-group">
						<label for="scrap_productId" style="float:left;padding:7px 15px 0 27px">产品编号</label> 
						<div class="col-sm-10">
						<select	class="form-control" id="scrap_productId" name="productId"> <!--for 属性规定 label 与哪个表单元素绑定。与绑定元素的id一致  -->
							<option value="">--请选择--</option>
							<c:forEach items="${page.rows}" var="item">
								<option value="${item.productId}"
								 <c:if test="${item.productId == productId}">selected</c:if>>

								    ${item.productId }
								</option>
							</c:forEach>
						</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="scrap_number" class="col-sm-2 control-label">报废数量</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="scrap_number" placeholder="报修数量" name="productNumber" />
						</div>
					</div>
					
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="scrapProduct()">提交</button>
			</div>
		</div>
	</div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<!--日期组件  -->
<script  src="<%=basePath%>My97DatePicker/WdatePicker.js"> </script>
<!-- 编写js代码 -->
<script type="text/javascript">
var number;
//清空新建客户窗口中的数据
	function clearProduct() {
	    $("#new_className").val("");
	    $("#new_modelName").val("")
	    $("#new_manufacturer").val("")
	    $("#new_productName").val("")
	    $("#new_productNumber").val("");
	    $("#new_price").val("");
	    $("#new_guaranteeperiod").val("");
	    $("#new_dataofPurchase").val("");
	    $("#new_situation").val("");
	    $("#new_remark").val("");
	}
	function clearRepairProduct() {
	    $("#repair_productId").val("");
	    $("#repair_cost").val("")
	    
	}
	function clearScrapProduct() {
	    $("#scrap_productId").val("");
	    $("#scrap_number").val("")
	    
	}
	// 创建器材信息
	function createProduct() {
	$.post("<%=basePath%>product/create.action",
	$("#new_product_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("器材信息创建成功！");
	            window.location.reload();
	        }else{
	            alert("器材信息创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的客户信息
	function editProduct(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>product/getProductById.action",
	        data:{"id":id},
	        success:function(data) {
	            alert(data.productId);
	            $("#edit_productId").val(data.productId);
	            $("#edit_className").val(data.className);
	            $("#edit_modelName").val(data.modelName);
	            $("#edit_manufacturer").val(data.manufacturer)
	            $("#edit_productName").val(data.productName)
	            $("#edit_productNumber").val(data.productNumber);
	            $("#edit_price").val(data.price);
	            $("#edit_guaranteeperiod").val(data.guaranteeperiod);
	            $("#edit_dataofPurchase").val(data.dataofPurchase);
	            $("#edit_situation").val(data.situation);
	            $("#edit_remark").val(data.remark);
	            
	        }
	    });
	}
	//通过id获取删除 产品信息
	function deleteProduct(id) {
	   $.ajax({
	        type:"get",
	        url:"<%=basePath%>product/getProductById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#delete_productId").val(data.productId);
	            $("#delete_productNumber").val(data.productNumber);
	            number = data.productNumber;
	        }
	    });
	}
	 // 执行删除客户操作
	function updateDelete() {
		var id = $("#delete_productId").val();
		var number1 = $("#delete_productNumber").val();
		if ((number1<=number)&&(number1>0)){
		  $.post("<%=basePath%>product/deleteProductById.action",$("#delete_product_form").serialize(),function(data){
			if(data =="OK"){
				alert("器材删除成功！");
				window.location.reload();
			}else{
				alert("器材删除失败！");
				window.location.reload();
			}
		});
		}
		else{
		alert("您输入得数量错误");
		}
	}
    // 执行修改器材操作
	function updateCustomer() {
		$.post("<%=basePath%>product/update.action",$("#edit_product_form").serialize(),function(data){
			if(data =="OK"){
				alert("器材信息更新成功！");
				window.location.reload();
			}else{
				alert("器材信息更新失败！");
				window.location.reload();
			}
		});
	}
	
	//创建报修器材信息
	function repairProduct() {
	$.post("<%=basePath%>product/createRepair.action",
	$("#repair_product_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("报修成功！");
	            window.location.reload();
	        }else{
	            alert("报修失败！");
	            window.location.reload();
	        }
	    });
	}
	//创建报废器材信息
	function scrapProduct() {
	$.post("<%=basePath%>product/createScrap.action",
	$("#scrap_product_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("提交成功！");
	            window.location.reload();
	        }else{
	            alert("提交失败！");
	            window.location.reload();
	        }
	    });
	}
	//完成报修
	function endRepairProduct() {
	$.post("<%=basePath%>product/endRepair.action",
	$("#endRepair_product_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("提交成功！");
	            window.location.reload();
	        }else{
	            alert("提交失败！");
	            window.location.reload();
	        }
	    });
	}
	
	
	
	
</script>
</body>
</html>