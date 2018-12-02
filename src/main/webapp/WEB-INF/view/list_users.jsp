<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>

<head>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>List Users</title>

</head>

<body>

<div class="container">
    <h2>User List</h2>

    <br>

    <div>
        <p>

            <a href="${pageContext.request.contextPath}/register/showRegistrationForm"
                    class="btn btn-primary" role="button" aria-pressed="true">Register
                New User</a>
            <a href="${pageContext.request.contextPath}/register/showDeleteForm"
               class="btn btn-danger" role="button" aria-pressed="true">Delete
                User</a>
        </p>
    </div>

    <!--  add our html table here -->

    <table class="table table-striped">
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
    <br>

    <div>

        <!-- Add a back to home page button -->

        <a> <form:form action="${pageContext.request.contextPath}/"
                       method="POST">

            <input type="submit" value="Back to Home Page" class="btn btn-primary"/>

        </form:form>
        </a>

    </div>
</div>
</body>

</html>









