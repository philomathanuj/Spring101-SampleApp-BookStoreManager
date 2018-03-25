# bookstoremanager
Tech Stack:
- Spring Boot
- Jersey REST
- Hibernate
- MariaDB

Description:
An application to maintain information for a book store. The application will be used by the store manager. The details of books and sales are maintained in the application database. The user can record the sale of a book, and view bestsellers in the store. The home page contains the following links:
- Record a Sale
- View Best Sellers

Features:
Use Case 1: Record a Sale: The details of a purchase are added to the application database using this feature.
Use Case 2: View Bestsellers
The overall top N bestselling books in the store is displayed in the following format in the decreasing order of the 'Copies Sold' column.
The page size (N) is configured in a resource bundle (configuration file). 
The system displays N number of bestsellers, in each category of books present in the store. 

<table>
<tr>
<th>Title</td>
<th>Category</td>
<th>Author</td>
<th>Price</td>
</tr>
<tr>
<td>Effective Java</td>
<td>Non-fiction</td>
<td>Joshua Bloch</td>
<td>600</td>
</tr>
<tr>
<td>Java Concurrency</td>
<td>Non-fiction</td>
<td>Joshua Bloch</td>
<td>650</td>
</tr>
<tr>
<td>The Fountainhead</td>
<td>Fiction</td>
<td>Ayn Rand</td>
<td>450</td>
</tr>
</table>
