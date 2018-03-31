<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css" type="text/css">
<title>Book Store Manager: Index</title>
</head>
<body>
<div class="message">${requestScope.message}</div>

<a href="CreateAssessment.do">Add a purchase</a>
<br />
<a href="viewPurchase.do">View Purchase By ID</a>
<br />
<a href="viewAllPurchase.do">View All Purchases</a>
<br />

</body>
</html>