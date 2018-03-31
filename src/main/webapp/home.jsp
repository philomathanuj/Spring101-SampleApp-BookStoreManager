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
  
  
  $("#fc").click(function(){
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


<h2>Data Retrieval from plain Servlet Front Controller</h2>

<div class="container-fluid">
  <div class="row">
    <div class="col-xs-4">
      <button id = "fc" class="btn btn-primary">Get Front Controller Data</button>
    </div>
   </div>
 </div>
<div id= "fcresults">
</div>
<h2>Data Retrieval from Spring MVC Controller</h2>
<div class="container-fluid">
  <div class="row">
    <div class="col-xs-4">
      <button id = "springmvc" class="btn btn-primary">Get MVC Data Data</button>
    </div>
   </div>
 </div>

<div id= "springmvcresults">
</div>



<h2>Data Retrieval from Spring REST Service/REST Controller</h2>
<div class="container-fluid">
  <div class="row">
    <div class="col-xs-4">
      <button id ="springrestresultsbutton" class="btn btn-primary">Get Spirng REST Data</button>
    </div>
   </div>
 </div>


<div id= "springrestresults">
</div>

<h2>Data Retrieval from Jersey REST Service</h2>
<div class="container-fluid">
  <div class="row">
    <div class="col-xs-4">
      <button id = "jerseyrestresultsbutton" class="btn btn-primary">Get Jersey REST Data</button>
    </div>
   </div>
 </div>

<div id= "jerseyrestresults">
</div>

<br /> <br /> <br /> <hr />

</body>
</html>