package onlineJobPortal;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		
		try(Connection con = DBConnection.getConnection()) {
			 
			PreparedStatement ps = con.prepareStatement("INSERT INTO userss (name, email, password, role) VALUES (?, ?, ?, ?)");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, role);
			
			int count = ps.executeUpdate();

            if (count > 0) {
                response.sendRedirect("login.jsp");
            } else {
                response.getWriter().println("Registration failed. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error occurred: " + e.getMessage());
        }

	}

}
