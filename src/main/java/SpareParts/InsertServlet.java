package SpareParts;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product_name = request.getParameter("product_name");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String total = request.getParameter("total");

        boolean isTrue;

        // Insert data into the database using CartControl
        isTrue = CartControl.insertdata(product_name, price, quantity, total);

        if (isTrue) {
            // Data successfully inserted, redirect to the dashboard (or another page handling product listing)
            response.sendRedirect("CartAllServlet");  // Make sure "dashboard.jsp" displays updated product list
        } else {
            // Data insertion failed, forward to insert.jsp
            request.setAttribute("cartStatus", "failed");
            RequestDispatcher dispatcher = request.getRequestDispatcher("insert.jsp");
            dispatcher.forward(request, response);
        }
    }
}
