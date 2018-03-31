<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	

<table class="table table-striped">
	<thead>
	<tr>
	<th >Title</th> <th >Category</th> <th >Author</th> <th >Price</th> <th >Copies Left</th> <th >Action</th>
	</tr>
	</thead>
	
	<tbody>
	
		<tr>
			<td>${requestScope.bookDetails.title}</td>
			<td>${bookDetails.category}</td>
			<td>${bookDetails.author}</td>
			<td>${bookDetails.price}</td>
			<td>${bookDetails.copiesLeft}</td>
		</tr>
		<tr>
			<td>${requestScope.bookDetails.title}</td>
			<td>${bookDetails.category}</td>
			<td>${bookDetails.author}</td>
			<td>${bookDetails.price}</td>
			<td>${bookDetails.copiesLeft}</td>
		</tr>
		<tr>
			<td>${requestScope.bookDetails.title}</td>
			<td>${bookDetails.category}</td>
			<td>${bookDetails.author}</td>
			<td>${bookDetails.price}</td>
			<td>${bookDetails.copiesLeft}</td>
		</tr>
		<tr>
			<td>${requestScope.bookDetails.title}</td>
			<td>${bookDetails.category}</td>
			<td>${bookDetails.author}</td>
			<td>${bookDetails.price}</td>
			<td>${bookDetails.copiesLeft}</td>
		</tr>
		<tr>
			<td>${requestScope.bookDetails.title}</td>
			<td>${bookDetails.category}</td>
			<td>${bookDetails.author}</td>
			<td>${bookDetails.price}</td>
			<td>${bookDetails.copiesLeft}</td>
		</tr>
		<tr>
			<td>${requestScope.bookDetails.title}</td>
			<td>${bookDetails.category}</td>
			<td>${bookDetails.author}</td>
			<td>${bookDetails.price}</td>
			<td>${bookDetails.copiesLeft}</td>
		</tr>
		<tr>
			<td>${requestScope.bookDetails.title}</td>
			<td>${bookDetails.category}</td>
			<td>${bookDetails.author}</td>
			<td>${bookDetails.price}</td>
			<td>${bookDetails.copiesLeft}</td>
		</tr>
		<tr>
			<td>${requestScope.bookDetails.title}</td>
			<td>${bookDetails.category}</td>
			<td>${bookDetails.author}</td>
			<td>${bookDetails.price}</td>
			<td>${bookDetails.copiesLeft}</td>
		</tr>
		<tr>
			<td>${requestScope.bookDetails.title}</td>
			<td>${bookDetails.category}</td>
			<td>${bookDetails.author}</td>
			<td>${bookDetails.price}</td>
			<td>${bookDetails.copiesLeft}</td>
		</tr>
		<tr>
			<td>${requestScope.bookDetails.title}</td>
			<td>${bookDetails.category}</td>
			<td>${bookDetails.author}</td>
			<td>${bookDetails.price}</td>
			<td>${bookDetails.copiesLeft}</td>
		</tr>
		</tbody>
</table>
