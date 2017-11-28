<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <c:set var="ctx" value="${pageContext.request.contextPath}"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee List</title>
<%
	pageContext.setAttribute("ctx", request.getContextPath());
%>
<script type="text/javascript"
	src="${ctx}/static/js/jquery-1.12.4.min.js"></script>
<link href="${ctx}/static/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${ctx}/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">SSM-CRUD</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<div class="row">
			<table class="table table-hover">
				<!-- tr>th{#}+th{empName}+th{gender}+th{email}+th{操作} -->
				<tr>
					<th>#</th>
					<th>empName</th>
					<th>gender</th>
					<th>email</th>
					<th>操作</th>
				</tr>
				<c:forEach var="employee" items="${pageInfo.list}">
					<tr>
						<th>${employee.empId}</th>
						<th>${employee.empName}</th>
						<th>${employee.gender=='M'?"男":"女"}</th>
						<th>${employee.email}</th>
						<th>
							<button class="btn btn-primary">
								<span class="glyphicon  glyphicon-pencil" aria-hidden="true"></span>
								编辑
							</button>
							<button class="btn btn-danger">
								<span class="glyphicon  glyphicon-trash" aria-hidden="true"></span>删除
							</button>
						</th>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="row">
			<div class="col-md-6">
				当前${pageInfo.pageNum}页，总${pageInfo.pages}页，总共${pageInfo.total}条记录</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="${ctx}/employee/list?pn=1">首页</a></li>
						<c:if test="${pageInfo.hasPreviousPage}">
							<li><a href="${ctx}/employee/list?pn=${pageInfo.pageNum-1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach var="pageNum" items="${pageInfo.navigatepageNums}">
							<c:if test="${pageNum == pageInfo.pageNum}">
								<li class="active"><a href="#">${pageNum}</a></li>
							</c:if>
							<c:if test="${pageNum != pageInfo.pageNum}">
								<li><a href="${ctx}/employee/list?pn=${pageNum}">${pageNum}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageInfo.hasNextPage}">
							<li><a href="${ctx}/employee/list?pn=${pageInfo.pageNum+1}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
						<li><a href="${ctx}/employee/list?pn=${pageInfo.pages}">尾页</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>