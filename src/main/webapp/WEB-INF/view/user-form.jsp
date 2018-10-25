<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
	<title>Save User</title>

<!-- reference our style sheet -->

<link type="text/css" href="<c:url value='/resources/css/style.css' />"
	rel="stylesheet" />


<link type="text/css" href="<c:url value='/resources/css/add-customer-style.css' />"
	rel="stylesheet" />

</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>URM - User Relationship Manager</h2>
		</div>
	</div>

	<div id="container">
		<h3>Save User</h3>
	
		<form:form action="saveUser" modelAttribute="user" method="POST">

			<!-- need to associate this data with username -->
			<form:hidden path="username" />
					
			<table>
				<tbody>
					<tr>
						<td><label>Username:</label></td>
						<td><form:input path="username" /></td>
					</tr>
				
					<tr>
						<td><label>Password:</label></td>
						<td><form:input path="password" /></td>
					</tr>

					<tr>
						<td><label>Enabled:</label></td>
						<td><form:input path="enabled" /></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>

				
				</tbody>
			</table>
		
		
		</form:form>
	
		<div style="clear; both;"></div>
		
		<p>
			<a href="${pageContext.request.contextPath}/user/list">Back to List</a>
		</p>
	
	</div>

</body>

</html>










