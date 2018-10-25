<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>

<html>

<head>
<title>List Customers</title>

<!-- reference our style sheet -->


	
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>
<body>

	<div id="wrapper">
		<div id="header">
			<h2>Customer List</h2>
		</div>
	</div>

	<div id="container">

		<div id="content">

			<p>
				User:
				<security:authentication property="principal.username" />
				, Role:
				<security:authentication property="principal.authorities" />
			</p>


			<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">

				<!-- put new button: Add Customer -->

				<input type="button" value="Add Customer"
					onclick="window.location.href='showFormForAdd'; return false;"
					class="add-button" />


			</security:authorize>


			<!--  add our html table here -->

			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>

					<%-- Only show "Action" column for managers or admin --%>
					<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">

						<th>Action</th>

					</security:authorize>

				</tr>

				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${customers}">

					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>

					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>

						<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">

							<td><security:authorize
									access="hasAnyRole('MENADZER', 'ADMIN')">
									<!-- display the update link -->
									<a href="${updateLink}">Update</a>
								</security:authorize> <security:authorize access="hasAnyRole('ADMIN')">
									<a href="${deleteLink}"
										onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
								</security:authorize></td>

						</security:authorize>

					</tr>

				</c:forEach>

			</table>

		</div>
		<br>

	</div>

	
	<!-- Add a back to home page button -->
	<a><form:form action="${pageContext.request.contextPath}/"
		method="POST">

		<input type="submit" value="Home page" class="add-button" />

	</form:form> </a>

	<!-- Add a logout button -->
	<a><form:form action="${pageContext.request.contextPath}/logout"
		method="POST">

		<input type="submit" value="Logout" class="add-button" />

	</form:form></a>

</body>

</html>









