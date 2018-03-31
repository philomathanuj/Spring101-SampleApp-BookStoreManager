<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Record a Sale</title>
<link rel="stylesheet" href="style.css" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	

<body>


<div class = "container-fluid">
<form:form action="/saveBook.act" modelAttribute="book">
<c:if test="${recordVisibility=='1'}">
<div class="row alert alert-success">
  <strong>Success!</strong> Purchase details have been added successfully
</div>
</c:if>
<c:if test="${recordVisibility=='-1'}">
<div class="row alert alert-danger">
  <strong>Error!</strong> An unexpected error has occurred while saving the purchase details
</div>
</c:if>
<div class = "row">
<div class="col-sm-4">
<h2>Add Your Book Purchase</h2>
</div>
</div>



  <div class="form-group">
    <label for="title">Title:</label>
    <form:input type="text" path="title" class="form-control" id="title" ></form:input>
  </div>
  <div class="form-group">
    <label for="category">Category:</label>
    <form:input type="text" path="category" class="form-control" id="category"></form:input>
  </div>
    <div class="form-group">
    <label for="language">Language:</label>
    <form:input type="text" path="language" class="form-control" id="language"></form:input>
  </div>
  <div class="form-group">
    <label for="author">Author:</label>
    <form:input type="text" path="author" class="form-control" id="author"></form:input>
  </div>
  <div class="form-group">
    <label for="price">Price:</label>
    <form:input type="text" path="price" class="form-control" id="price"></form:input>
  </div>
  <div class="form-group">
    <label for="copiesSold">Copies Sold:</label>
    <form:input type="text" path="copiesSold" class="form-control" id="copiesSold"></form:input>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
  </div>
</form:form>
</body>
</html>