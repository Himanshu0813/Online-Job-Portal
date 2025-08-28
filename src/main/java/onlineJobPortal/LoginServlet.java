package onlineJobPortal;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// Map the Servlet to this URL
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 📝 Read form inputs
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // 🔒 Validate input — you may want to add checks for null/empty here

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM userss WHERE email = ? AND password = ? AND role = ?");

            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, role);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // ✅ Login successful — create a session
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("role", role);

                // 📍 Redirect to appropriate dashboard
                if ("employer".equals(role)) {
                    response.sendRedirect("employer/dashboard.jsp");
                } else if ("seeker".equals(role)) {
                    response.sendRedirect("seeker/dashboard.jsp");
                } else if ("admin".equals(role)) {
                    response.sendRedirect("admin/dashboard.jsp");
                } else {
                    response.getWriter().println("Invalid role specified.");
                }

            } else {
                // ❌ Login failed
                response.getWriter().println("Invalid email, password, or role. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Something went wrong. Please try again later.");
        }
    }
}
















