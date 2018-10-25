<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html>

<head>
<title>Home Page</title>
</head>

<body>
	<h2>Home Page</h2>
	<hr>

	<p>Welcome to home page!</p>

	<hr>

	<!-- display user name and role -->

	<p>
		User: <security:authentication property="principal.username" />
		<br><br>
		Role: <security:authentication property="principal.authorities" />
	</p>

	<security:authorize access="!hasAnyRole('MENADZER','ADMIN')">

		<!-- Add a link to point to /leaders ... this is for the managers -->

		<p>
			<a href="${pageContext.request.contextPath}/customer/list">Customer
				list</a> (Samo za zaposlene)
		</p>

	</security:authorize>

	<security:authorize access="hasRole('MENADZER')">

		<!-- Add a link to point to /leaders ... this is for the managers -->

		<p>
			<a href="${pageContext.request.contextPath}/customer/list">Customer
				list</a> (Samo za menadzera)
		</p>

	</security:authorize>


	<security:authorize access="hasRole('ADMIN')">

		<!-- Add a link to point to /systems ... this is for the admins -->

		<p>
			<a href="${pageContext.request.contextPath}/customer/list">Customer
				list</a> (Samo za admina)
		</p>

		<p>
			<a href="${pageContext.request.contextPath}/user/list">User list</a>
			(Samo za admina)
		</p>

	</security:authorize>

	<hr>


	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">

		<input type="submit" value="Logout" />

	</form:form>

</body>

</html>









