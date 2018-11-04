<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html>

<head>
<title>Home Page</title>

 <!-- Reference Bootstrap files -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>

<div class="container">
	<h2> Welcome to Home Page</h2>
	
	<hr>

	<!-- display username and role -->
	

	<p>
		User:  <span style="color:blue"><security:authentication property="principal.username" /></span>
		<br>
		Role: <security:authentication property="principal.authorities" />
		<br>
	</p>

	<security:authorize access="!hasAnyRole('MENADZER','ADMIN')">

		<p>
			<a href="${pageContext.request.contextPath}/customer/list" class="btn btn-primary">Customer
				List</a> 
		</p>

	</security:authorize>

	<security:authorize access="hasRole('MENADZER')">

		<p>
			<a href="${pageContext.request.contextPath}/customer/list" class="btn btn-primary">Customer
				List</a> 
		</p>

	</security:authorize>


	<security:authorize access="hasRole('ADMIN')">


		<p>
			<a href="${pageContext.request.contextPath}/customer/list" class="btn btn-primary">Customer
				List</a>
		
			<a href="${pageContext.request.contextPath}/user/list" class="btn btn-primary">User List</a>
		</p>

	</security:authorize>

	<hr>


	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" 
		method="POST">

		<input type="submit" class="btn btn-primary" value="Logout" />

	</form:form>
	</div>
</body>

</html>









