<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5+zJ3eQoH3VlARvRfBtTEv2h2tF5fVTvC2KxOrZt" crossorigin="anonymous">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
            width: 400px;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: #fff;
            border-radius: 15px 15px 0 0;
            padding: 20px; /* Add padding */
        }
        .card-header h3 {
            margin-bottom: 0; /* Remove margin */
        }
        .card-body {
            padding: 20px;
        }
        .form-label {
            font-weight: bold;
        }
        .form-control {
            border-radius: 10px;
            border: 1px solid #ced4da;
            padding: 10px;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 10px;
            padding: 10px 20px;
            font-size: 16px;
            width: 100%; 
			margin-top: 4%;
			
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="card text-center">
        <div class="card-header">
            <h3>Add New Product</h3>
        </div>
        <div class="card-body">
            <form action="AddProduct" method="post">
                <div class="row mb-3">
                    <label for="productId" class="col-sm-4 col-form-label">Product ID</label>
                    <div class="col-sm-8">
                        <input type="text" id="productId" name="productId" class="form-control">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="productName" class="col-sm-4 col-form-label">Product Name</label>
                    <div class="col-sm-8">
                        <input type="text" id="productName" name="productName" class="form-control">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="quantity" class="col-sm-4 col-form-label">Quantity</label>
                    <div class="col-sm-8">
                        <input type="number" id="quantity" name="quantity" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-primary">Add Product</button>
                    </div>
                </div>
            </form>
            <a href="/Assignment5" class="back-to-home-link">Back to Home</a>
        </div>
    </div>
    <!-- Bootstrap JS bundle (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-Ur5Yr5kiEhCIhVA9ECE5wGpOVIlPwqIyL/Adk8c+E+nSu3HpCy3pjI1JswbFjciI" crossorigin="anonymous"></script>
</body>
</html>
