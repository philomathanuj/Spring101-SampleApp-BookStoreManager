<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table border="2" bgcolor="grey">
	<tr>
	<th bgcolor="grey">Title</th> <th bgcolor="grey">Category</th> <th bgcolor="grey">Author</th> <th bgcolor="grey">Price</th> <th bgcolor="grey">Copies Left</th> <th bgcolor="grey">Action</th>
	</tr>
	
	
		<tr>
			<td>${requestScope.bookDetails.title}</td>
			<td>${bookDetails.category}</td>
			<td>${bookDetails.author}</td>
			<td>${bookDetails.price}</td>
			<td>${bookDetails.copiesLeft}</td>
		</tr>
</table>
