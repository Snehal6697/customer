<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>

<head>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>List Customers</title>

</head>
<body>

<div class="container">

    <h2>Customer List</h2>

    <br>
    <!--  add our html table here -->

    <table class="table table-striped">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>

            <%-- Only show "Action" column for managers or admin --%>
            <security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">

                <th>Actions</th>

            </security:authorize>

        </tr>

        <!-- loop over and print our customers -->
        <c:forEach var="tempCustomer" items="${customers}">

            <!-- construct an "update" link with customer id -->
            <c:url var="updateLink" value="/customer/showFormForUpdate">
                <c:param name="customerId" value="${tempCustomer.id}"/>
            </c:url>

            <!-- construct an "delete" link with customer id -->
            <c:url var="deleteLink" value="/customer/delete">
                <c:param name="customerId" value="${tempCustomer.id}"/>
            </c:url>

            <tr>
                <td>${tempCustomer.firstName}</td>
                <td>${tempCustomer.lastName}</td>
                <td>${tempCustomer.email}</td>


                <td><security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">
                    <!-- display the update link -->
                    <a href="${updateLink}">Update</a>
                    <security:authorize access="hasRole('ADMIN')">
                        <a href="${deleteLink}"
                           onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                    </security:authorize>
                </security:authorize></td>


            </tr>

        </c:forEach>

    </table>


    <security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">

        <!-- put new button: Add New Customer -->

       <div>
<p>
        <input type="button" value="Add New Customer"
               onclick="window.location.href='showFormForAdd'; return false;"
               class="btn btn-primary"/>
</p>
       </div>

    </security:authorize>

    <!-- Add a back to home page button -->
    <a><form:form action="${pageContext.request.contextPath}/"
                  method="POST">

        <input type="submit" value="Go to Home Page" class="btn btn-danger"/>

    </form:form> </a>
    <br>

</div>
</body>

</html>









