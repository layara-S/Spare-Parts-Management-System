<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart Details</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif; /* Set font family for the entire page */
            background-color: #f8f9fa; /* Light gray background */
            margin: 0;
            padding: 20px; /* Padding around the body */
        }

        h2 {
            text-align: center; /* Center the heading */
            color: #003366; /* Dark Blue */
            margin-bottom: 20px; /* Space below heading */
            font-size: 2em;
        }

        /* Table Styles */
        table {
            width: 100%; /* Full width for the table */
            border-collapse: collapse; /* Merge borders */
            margin-top: 20px; /* Space above the table */
        }

        thead {
            background-color: #003366; /* Dark Blue background for header */
            color: white; /* White text for header */
        }

        th, td {
            padding: 12px; /* Padding for cells */
            text-align: left; /* Left align text */
            border-bottom: 1px solid #ddd; /* Light gray border */
        }

        .action-column {
            text-align: center; /* Center align action column */
        }

        /* Button Styles */
        .update-button, .delete-button {
            background-color: #101434; /* Dark Blue */
            color: white; /* White text */
            border: none; /* No border */
            padding: 8px 12px; /* Padding for buttons */
            cursor: pointer; /* Pointer cursor on hover */
            border-radius: 5px; /* Rounded edges */
            transition: background-color 0.3s; /* Smooth transition */
            font-size: 0.9em;
        }

        .update-button:hover, .delete-button:hover {
            background-color: #061172; /* Darker blue on hover */
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            h2 {
                font-size: 1.8em; /* Smaller header on mobile */
            }

            th, td {
                padding: 8px; /* Less padding on smaller screens */
            }

            .update-button, .delete-button {
                font-size: 0.8em; /* Smaller buttons on mobile */
                padding: 6px 8px; /* Less padding for smaller buttons */
            }
        }
    </style>
</head>
<body>
    <h2>Shopping Cart Details</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th class="action-column">Action</th> <!-- Action column for Update/Delete -->
            </tr>
        </thead>
        <tbody>
            <c:forEach var="carts" items="${allCart}">
                <tr>
                    <td>${carts.id}</td>
                    <td>${carts.product_name}</td>
                    <td>${carts.price}</td>
                    <td>${carts.quantity}</td>
                    <td>${carts.total}</td>
                    <td class="action-column">
                        <a href="UpdateCart.jsp?id=${carts.id}&product_name=${carts.product_name}&price=${carts.price}&quantity=${carts.quantity}&total=${carts.total}">
                            <button class="update-button">Update</button>
                        </a>
                        <form action="DeleteServlet" method="post" style="display:inline;"> <!-- Added inline style to avoid block element spacing -->
                            <input type="hidden" name="id" value="${carts.id}">
                            <button type="submit" class="delete-button">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Optional JavaScript file -->
    <!-- <script src="JS/SellerDashBoard.js"></script> -->

</body>
</html>
