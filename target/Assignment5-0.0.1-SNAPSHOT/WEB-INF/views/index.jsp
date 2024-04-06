<%@ page import="com.assignment5.model.Product" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Optional: Custom styles for the page */
        body {
            padding: 20px;
        }
    </style>
</head>
<body>
    <h2>Product List</h2>
    <div class="mt-2 mb-2">
    	<a href="AddProduct" class="btn btn-primary">Add New Product</a>
    </div>
    
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Update</th>
                <th>Remove</th>
            </tr>
        </thead>
        <tbody>
            <% if (request.getAttribute("products") != null) {
                List<Product> products = (List<Product>) request.getAttribute("products");
                for (Product product : products) { %>
                    <tr>
                        <td><%= product.getId() %></td>
                        <td><%= product.getName() %></td>
                        <td><%= product.getQuantity() %></td>
                        <td>
                            <form action="addProduct" method="post">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <!--  <button type="submit" class="btn btn-success">Update</button>-->
                                <a href="updateForm?productId=<%= product.getId() %>" class="btn btn-primary btn-sm">Update</a>
                            </form>
                        </td>
                        <td>
                            <form action="removeProduct" method="post">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <button type="submit" class="btn btn-danger">Remove</button>
                            </form>
                        </td>
                    </tr>
                <% }
            } %>
        </tbody>
    </table>
    <!-- Include Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
