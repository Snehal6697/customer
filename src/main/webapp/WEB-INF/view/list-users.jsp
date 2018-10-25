<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>

<head>
<title>List Users</title>

<!-- reference our style sheet -->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<link type="text/css" href="<c:url value='/resources/css/style.css' />"
	rel="stylesheet" />
	

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>User List</h2>
		</div>
	</div>

	<br>

	<a
		href="${pageContext.request.contextPath}/register/showRegistrationForm"
		class="btn btn-primary" role="button" aria-pressed="true">Register
		New User</a>
	<a href="${pageContext.request.contextPath}/register/showDeleteForm"
		class="btn btn-primary" role="button" aria-pressed="true">Delete
		User</a>


	<div></div>


	<div id="container">



		<div id="content">

			<!-- put new button: Add User -->



			<!--  add our html table here -->

			<table>
				<tr>
					<th>Username</th>
					<th>Password</th>

				</tr>

				<!-- loop over and print our users -->
				<c:forEach var="tempUser" items="${users}">



					<tr>
						<td>${tempUser.username}</td>
						<td>${tempUser.password}</td>




					</tr>

				</c:forEach>

			</table>

		</div>

	</div>

	<br>

	<div>

		<!-- Add a back to home page button -->

		<a> <form:form action="${pageContext.request.contextPath}/"
				method="POST">

				<input type="submit" value="Home page" class="add-button" />

			</form:form>
		</a>


		<!-- Add a logout button -->

		<a> <form:form action="${pageContext.request.contextPath}/logout"
				method="POST">

				<input type="submit" value="Logout" class="add-button" />

			</form:form>
		</a>
	</div>

</body>

</html>









