<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<title>Employees</title>
</head>

<body>

	<div class="container">


		<div class="row">

			<div class="col-sm-2"></div>

			<div class="col-sm-8">
				<p>Pagination using Bootstrap</p>
			</div>

			<div class="col-sm-2"></div>

		</div>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">

				<ul class="pagination">

					<c:if test="${currentPage != 1}">
						<li class="page-item"><a class="page-link"
							href="employee.do?page=${currentPage - 1}">Previous</a></li>
					</c:if>

					<c:forEach begin="1" end="${noOfPages}" var="i">
						<c:choose>
							<c:when test="${currentPage eq i}">
								<c:if test="${i ge currentStartPageNo && i le currentEndPageNo}">
									<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
								</c:if>
							</c:when>
							<c:otherwise>

								<c:if test="${i ge currentStartPageNo && i le currentEndPageNo}">
									<li class="page-item"><a class="page-link"
										href="employee.do?page=${i}">${i}&nbsp;</a></li>
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${currentPage lt noOfPages}">
						<li class="page-item"><a class="page-link"
							href="employee.do?page=${currentPage + 1}">Next</a></li>
					</c:if>
				</ul>


				<table border="1" cellpadding="5" cellspacing="5">
					<tr>
						<th>Employee ID</th>
						<th>Empployee Name</th>
						<th>Salary</th>
						<th>Department</th>
						<th>State</th>
						<th>City</th>
						<th>Country</th>
					</tr>
					<c:forEach var="employee" items="${employeeList}">
						<tr>
							<td>${employee.id}</td>
							<td>${employee.name}</td>
							<td>${employee.salary}</td>
							<td>${employee.department}</td>
							<td>${employee.state}</td>
							<td>${employee.city}</td>
							<td>${employee.country}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-sm-2"></div>
		</div>





		<%-- <table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td><c:if test="${currentPage != 1}">
					<a href="employee.do?page=${currentPage - 1}">&nbsp;Previous</a>
				</c:if> <c:forEach begin="1" end="${noOfPages}" var="i">
					<c:choose>
						<c:when test="${currentPage eq i}">
							<c:if test="${i ge currentStartPageNo && i le currentEndPageNo}">
								<!-- <td> -->${i}&nbsp;&nbsp;<!-- </td> -->
							</c:if>
						</c:when>
						<c:otherwise>

							<c:if test="${i ge currentStartPageNo && i le currentEndPageNo}">
								<a href="employee.do?page=${i}">${i}&nbsp;</a>
							</c:if>
						</c:otherwise>
					</c:choose>
				</c:forEach> <c:if test="${currentPage lt noOfPages}">
					<a href="employee.do?page=${currentPage + 1}">&nbsp;Next</a>
				</c:if></td>
		</tr>
	</table>
 --%>



		<br>

		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td><c:if test="${currentPage != 1}">
						<a href="employee.do?page=${currentPage - 1}">&nbsp;Previous</a>
					</c:if> <c:forEach begin="1" end="${noOfPages}" var="i">
						<c:choose>
							<c:when test="${currentPage eq i}">
								<c:if test="${i ge currentStartPageNo && i le currentEndPageNo}">
									<!-- <td> -->${i}&nbsp;&nbsp;<!-- </td> -->
								</c:if>
							</c:when>
							<c:otherwise>

								<c:if test="${i ge currentStartPageNo && i le currentEndPageNo}">
									<a href="employee.do?page=${i}">${i}&nbsp;</a>
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:forEach> <c:if test="${currentPage lt noOfPages}">
						<a href="employee.do?page=${currentPage + 1}">&nbsp;Next</a>
					</c:if></td>
			</tr>
		</table>

		<br> <br>
	</div>
</body>
</html>
