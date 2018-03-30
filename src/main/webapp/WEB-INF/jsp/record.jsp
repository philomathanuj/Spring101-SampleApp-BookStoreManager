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
<script type="text/javascript">
function goHome(frm){

frm.action="index.jsp";

frm.submit();
	
}
</script>
</head>
<body>

<div class="error">
${requestScope.error}
</div>

<form:form action="record.action" method="POST" commandName="book">
Partial Title <input type="text" name="partialTitle" />
<input type="submit" value="Search" />
<input type="button" value="Cancel" onclick="goHome(this.form)" />
</form:form>


<c:if test="${recordVisibility=='1'}">
<table border="2" bgcolor="grey">
	<tr>
	<th bgcolor="grey">Title</th> <th bgcolor="grey">Category</th> <th bgcolor="grey">Author</th> <th bgcolor="grey">Price</th> <th bgcolor="grey">Copies Left</th> <th bgcolor="grey">Action</th>
	</tr>
	
	

	<c:forEach var="book" items="${bookList}">
		<tr>
			<td>${book.title}</td>
			<td>${book.category}</td>
			<td>${book.author}</td>
			<td>${book.price}</td>
			<td>${book.copiesLeft}</td>
			
			<td> 
				<c:if test="${book.copiesLeft!='0'}">
					<form:form action="addToCart.action" method="POST">
					<input type="hidden" name="bookId" value="${book.bookId}">
					<input type="submit" value="Add to Current Purchase" />
					</form:form>
				</c:if>
		 </td>
		</tr>
	</c:forEach>

	

</table>
</c:if>

<c:if test="${recordVisibility=='0'}"><br /> No Matching Book Found </c:if>


<br /> <br /> <br /> <hr />

<form:form method="POST" action="sell.action">
<c:if test="${recordVisibility=='2'}">
<br/>
 <h3>The following books have been added to the current purchase:</h3> <br/>
<table border="2" bgcolor="grey">
	<tr>
	<th bgcolor="grey">Title</th> <th bgcolor="grey">Category</th> <th bgcolor="grey">Author</th>  <th bgcolor="grey">Copies Purchased</th> <th bgcolor="grey">Total Price</th>
	</tr>
	
	<c:forEach var="lineItem" items="${requestScope.itemList}">
		<tr>
			<td>${lineItem.title}</td>
			<td>${lineItem.category}</td>
			<td>${lineItem.author}</td>
			<td>${lineItem.copiesPurchased}</td>
			<td>${lineItem.totalPrice}</td>
			
		</tr>
	</c:forEach>
	<tr>
		<td></td> <td></td>  <td></td>
		<td>Total Price</td> <td>${requestScope.totalCartPrice}<input type="submit" value="Save" /></td>
	</tr>
</table>
</c:if>

</form:form>



</body>
</html>