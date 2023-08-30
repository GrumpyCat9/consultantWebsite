<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>

<tag:if test="${cookie.userRole.value ne 'Consultant'}">
	<tag:redirect url="user-login.jsp" />
</tag:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Job Consultant home page</title>
</head>
<body>

	<h1>Job Consultant home page</h1>

</body>
</html>