<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
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
				</li>
				<li>
				    <a  href="${pageContext.request.contextPath }/product/queryRepair.action">
				      <i class="fa fa-dashboard fa-fw" ></i>提交的报修器材
				    </a>
				</li>
				<li>
				    <a href="#" data-toggle="modal"
				    data-target="#scrapProductDialog" onclick="scrapProduct()">
				      <i class="fa fa-dashboard fa-fw" ></i>提交的报废器材
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
					<div class="panel-heading">器材信息列表</div>
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
									<th style="width: 5px;">登记日期</th>
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

</body>
</html>