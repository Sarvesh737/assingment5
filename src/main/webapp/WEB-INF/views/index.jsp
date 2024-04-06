<%@ page import="com.assignment5.model.Product"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Custom styles for the page */
        body {
            padding: 20px;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa; /* Change background color */
        }
        .btn-action {
            min-width: 100px;
        }
        .btn-add {
            width: 150px;
        }
        .btn-remove {
            width: 120px;
        }
        .container {
            background-color: #fff; /* Change container background color */
            border-radius: 10px; /* Add border radius */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Add box shadow */
            padding: 30px;
            margin-top: 20px;
        }
        .table {
            background-color: #fff; /* Change table background color */
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .thead-dark th {
            color: #fff; 
            background-color: #343a40; 
            border-color: #454d55; 
        }
        .btn-primary {
            background-color: #17a2b8; 
            border-color: #17a2b8; 
        }
        .btn-primary:hover {
            background-color: #138496; 
            border-color: #117a8b; 
        }
        .btn-danger {
            background-color: #dc3545; 
            border-color: #dc3545; 
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="my-4 text-center">Product List</h2>
        <div class="mb-3">
            <a href="AddProduct" class="btn btn-primary btn-add">Add New Product</a>
        </div>
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th colspan="2">Actions</th>
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
                                <form action="updateForm" method="get">
                                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                                    <button type="submit" class="btn btn-primary btn-action">Update</button>
                                </form>
                            </td>
                            <td>
                                <form action="removeProduct" method="post">
                                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                                    <button type="button" class="btn btn-danger btn-action remove-product">Remove</button>
                                </form>
                            </td>
                        </tr>
                    <% }
                } %>
            </tbody>
        </table>
    </div>
    
    <!-- Toast Notification -->
    <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" style="position: absolute; top: 20px; right: 20px;">
        <div class="toast-header bg-danger text-white">
            <strong class="mr-auto">Product Removed</strong>
            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="toast-body">
            The product quantity is reduced by 1
        </div>
    </div>
    
    <!-- Include Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- Custom Script for Toast -->
    <script>
    $(document).ready(function() {
        $(".remove-product").click(function(event) {
            // Prevent the default form submission behavior
            event.preventDefault();

            // Show the toast notification
            $('.toast').toast('show');

            // Hide the toast after 3 seconds
            setTimeout(function() {
                $('.toast').toast('hide');

                // After the toast is hidden, trigger the form submission
                $(event.target).closest('form').submit();
            }, 1000); // 3000 milliseconds = 3 seconds
        });
    });
    </script>
</body>
</html>
