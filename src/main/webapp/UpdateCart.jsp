<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Cart Item</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif; /* Set font family for the entire page */
            background-color: #f8f9fa; /* Light gray background */
            margin: 0;
            padding: 0;
            height: 100vh; /* Full viewport height */
            display: flex;
            justify-content: center; /* Center content */
            align-items: center; /* Center content */
        }

        .update-container {
            width: 90%; /* Full width on smaller screens */
            max-width: 600px; /* Max width for larger screens */
            background: white; /* White background for form container */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            padding: 20px; /* Padding for the container */
        }

        h2 {
            text-align: center; /* Center the heading */
            color: #003366; /* Dark Blue */
            margin-bottom: 20px; /* Space below heading */
        }

        .input-container {
            margin-bottom: 15px; /* Space between input fields */
        }

        label {
            display: block; /* Block display for labels */
            margin-bottom: 5px; /* Space below labels */
            color: #333; /* Dark gray text */
        }

        input[type="text"] {
            width: 100%; /* Full width for inputs */
            padding: 10px; /* Padding for inputs */
            border: 1px solid #ced4da; /* Light gray border */
            border-radius: 5px; /* Rounded edges */
            font-size: 1em; /* Font size */
            transition: border-color 0.3s; /* Transition for focus effects */
        }

        input[type="text"]:focus {
            border-color: #00509E; /* Highlight border on focus */
            outline: none; /* Remove default outline */
        }

        button {
            background-color: #101434; /* Dark Blue */
            color: white; /* White text */
            border: none; /* No border */
            padding: 10px 15px; /* Padding for button */
            cursor: pointer; /* Pointer cursor on hover */
            border-radius: 5px; /* Rounded edges */
            font-size: 1em; /* Font size */
            width: 100%; /* Full width for button */
            transition: background-color 0.3s; /* Smooth transition */
        }

        button:hover {
            background-color: #061172; /* Darker blue on hover */
        }
    </style>
</head>
<body>
<%
    // Fetch parameters from the request
    int id = Integer.parseInt(request.getParameter("id"));
    String product_name = request.getParameter("product_name"); 
    String price = request.getParameter("price"); 
    String quantity = request.getParameter("quantity"); 
    String total = request.getParameter("total"); 
%>
<div class="update-container">
    <h2>Update Cart Item</h2>
    <form id="updateForm" action="UpdateServlet" method="post">
        <div class="input-container">
            <label for="id">ID</label>
            <input type="text" id="id" name="id" value="<%= id %>" readonly>
        </div>
        <div class="input-container">
            <label for="product_name">Product Name</label>
            <input type="text" id="product_name" name="product_name" value="<%= product_name %>" required>
        </div>
        <div class="input-container">
            <label for="price">Price</label>
            <input type="text" id="price" name="price" value="<%= price %>" required>
        </div>
        <div class="input-container">
            <label for="quantity">Quantity</label>
            <input type="text" id="quantity" name="quantity" value="<%= quantity %>" required>
        </div>
        <div class="input-container">
            <label for="total">Total</label>
            <input type="text" id="total" name="total" value="<%= total %>" required>
        </div>
        
        <button type="submit">Update</button>
    </form>
    <script src="JS/UpdateCart.js"></script> <!-- Adjust the JavaScript file as needed -->
</div>
</body>
</html>
