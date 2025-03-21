<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #003366;
            margin-bottom: 20px;
            font-size: 2em;
        }

        .flex {
            display: flex;
            gap: 20px;
        }

        .column {
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            flex: 1;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            color: #0C0C0C;
        }

        input[type="text"], input[type="number"] {
            width: 95%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ced4da;
            border-radius: 5px;
            font-size: 1em;
        }

        input[type="number"] {
            text-align: right;
        }

        input[type="submit"] {
            background-color: #101434;
            color: white;
            border: none;
            padding: 12px 15px;
            cursor: pointer;
            border-radius: 5px;
            margin: 0 auto;
            display: block;
            width: 70%;
            font-size: 1.1em;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #061172;
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 1.8em;
            }
        }
    </style>

    <script>
        function calculateTotal(row) {
            const price = parseFloat(row.querySelector('input[name="price"]').value) || 0;
            const quantity = parseInt(row.querySelector('input[name="quantity"]').value) || 0;
            const total = price * quantity;
            row.querySelector('input[name="total"]').value = total.toFixed(2); // Update total field
            updateSummary();
        }

        function updateSummary() {
            const rows = document.querySelectorAll('tbody tr');
            let subtotal = 0;

            rows.forEach(row => {
                const total = parseFloat(row.querySelector('input[name="total"]').value) || 0;
                subtotal += total;
            });

            // Update the subtotal and total display
            document.querySelector('.subtotal').textContent = `$${subtotal.toFixed(2)}`;
            document.querySelector('.total').textContent = `$${subtotal.toFixed(2)}`; // Total is the same as subtotal for now
        }

        window.onload = function() {
            const rows = document.querySelectorAll('tbody tr');
            rows.forEach(row => {
                // Calculate total for each row on page load
                calculateTotal(row);
            });
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Shopping Cart</h1>
        <div class="flex">
            <div class="column">
                <form action="InsertServlet" method="post">
                    <table>
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="text" name="product_name" value="<%= request.getParameter("product_name") != null ? request.getParameter("product_name") : "" %>" required>
                                </td>
                                <td>
                                    <input type="number" name="price" step="0.01" value="<%= request.getParameter("price") != null ? request.getParameter("price") : "" %>" oninput="calculateTotal(this.closest('tr'))" required>
                                </td>
                                <td>
                                    <input type="number" name="quantity" value="<%= request.getParameter("quantity") != null ? request.getParameter("quantity") : "" %>" oninput="calculateTotal(this.closest('tr'))" required>
                                </td>
                                <td>
                                    <input type="number" name="total" step="0.01" value="<%= request.getParameter("total") != null ? request.getParameter("total") : "" %>" required readonly>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <h2 class="text-lg font-semibold mb-4">Summary</h2>
                    <div class="flex justify-between mb-2">
                        <span>Subtotal</span>
                        <span class="subtotal">
                            <% 
                                // Initialize subtotal based on the total parameter
                                double subtotal = 0.0;
                                if (request.getParameter("total") != null) {
                                    try {
                                        subtotal = Double.parseDouble(request.getParameter("total"));
                                    } catch (NumberFormatException e) {
                                        subtotal = 0.0; // Handle invalid number format
                                    }
                                }
                            %>
                            $<%= String.format("%.2f", subtotal) %>
                        </span>
                    </div><br>
                    <div class="flex justify-between mb-2">
                        <span>Taxes</span>
                        <span>$0.00</span> 
                    </div><br>
                    
                    <hr class="my-2">
                    <div class="flex justify-between mb-2">
                        <span class="font-semibold">Total</span>
                        <span class="font-semibold total">
                            $<%= String.format("%.2f", subtotal) %>
                        </span>
                    </div>
                    <br><br><br>
                    <input type="submit" value="Proceed to Checkout">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
