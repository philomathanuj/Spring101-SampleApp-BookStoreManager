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
<script>
$(document).ready(function(){
    $("#springrestresultsbutton").click(function(){
        $.ajax({url: "http://localhost:8080/getBookByID/1", success: function(result){
        	console.log(result);
            $("#springrestresults").html("<table border='2' bgcolor='grey'><tr><th bgcolor='grey'>Title</th> <th bgcolor='grey'>Category</th> <th bgcolor='grey'>Author</th> <th bgcolor='grey'>Price</th> <th bgcolor='grey'>Copies Left</th> <th bgcolor='grey'>Action</th></tr><tr><td>"+result.title+"</td>"
            		+"<td>"+result.category+"</td>"
            		+"<td>"+result.author+"</td>"
            		+"<td>"+result.price+"</td>"
            		+"<td>"+result.copiesLeft+"</td></tr></table>"
            		);
        }});
    });
    
    $("#jerseyrestresultsbutton").click(function(){
    	
        $.ajax({url: "http://localhost:8080/rest/bookstore/purchase/view/1", success: function(result){
        	console.log(result);
        	 $("#jerseyrestresults").html("<table border='2' bgcolor='grey'><tr><th bgcolor='grey'>Title</th> <th bgcolor='grey'>Category</th> <th bgcolor='grey'>Author</th> <th bgcolor='grey'>Price</th> <th bgcolor='grey'>Copies Left</th> <th bgcolor='grey'>Action</th></tr><tr><td>"+result.title+"</td>"
             		+"<td>"+result.category+"</td>"
             		+"<td>"+result.author+"</td>"
             		+"<td>"+result.price+"</td>"
             		+"<td>"+result.copiesLeft+"</td></tr></table>"
             		);
        }});
    });
    
  $("#springmvc").click(function(){
    	
        $.ajax({url: "http://localhost:8080/getBook.act", success: function(result){
        	console.log(result);
        	 $("#springmvcresults").html(result);
        }});
    });
  
  
  $("#fcbutton").click(function(){
  	
      $.ajax({url: "http://localhost:8080/plainfrontcontroller/viewPurchase.do?bookID=1", success: function(result){
      	console.log(result);
      	 $("#fcresults").html(result);
      }});
  });
});
</script>
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

<h1>Data Retrieval from plain Servlet Front Controller</h1>

<button id = "fc">Get Jersey REST Data</button>
<div id= "fcresults">
</div>
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

<h1>Data Retrieval from Spring MVC Controller</h1>
<button id = "springmvc">Get Jersey REST Data</button>
<div id= "springmvcresults">
</div>


<table border="2" bgcolor="grey">
	<tr>
	<th bgcolor="grey">Title</th> <th bgcolor="grey">Category</th> <th bgcolor="grey">Author</th> <th bgcolor="grey">Price</th> <th bgcolor="grey">Copies Left</th> <th bgcolor="grey">Action</th>
	</tr>
	
	
		<tr>
			<td>${requestScope.book.title}</td>
			<td>${book.category}</td>
			<td>${book.author}</td>
			<td>${book.price}</td>
			<td>${book.copiesLeft}</td>
		</tr>
<%-- 	<c:forEach var="book" items="${bookDetails}">
		<tr>
			<td>${book.title}</td>
			<td>${book.category}</td>
			<td>${book.author}</td>
			<td>${book.price}</td>
			<td>${book.copiesLeft}</td>
		</tr>
	</c:forEach> --%>

	

</table>

<h1>Data Retrieval from Spring REST Service/REST Controller</h1>
<button id ="springrestresultsbutton">Get Spirng REST Data</button>
<div id= "springrestresults">
</div>

<h1>Data Retrieval from Jersey REST Service</h1>
<button id = "jerseyrestresultsbutton">Get Jersey REST Data</button>
<div id= "jerseyrestresults">
</div>

<br /> <br /> <br /> <hr />

<form:form method="POST" action="saveBook.act">
<br/>
 <h3>The following books have been added to the current purchase:</h3> <br/>

</form:form>

</body>
</html>