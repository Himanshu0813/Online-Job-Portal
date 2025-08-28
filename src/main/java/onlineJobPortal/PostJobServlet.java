package onlineJobPortal;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/postJobServlet")
public class PostJobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String location = req.getParameter("location");
        String postedBy = (String) req.getSession().getAttribute("email"); // FIX

        if (postedBy == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO jobs(title, description, location, posted_by) VALUES (?, ?, ?, ?)"
            );
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setString(3, location);
            ps.setString(4, postedBy);
            ps.executeUpdate();

            resp.sendRedirect("employer/view_jobs.jsp");
        } catch (Exception e) {
            resp.getWriter().print("Error: " + e.getMessage());
        }
    }
}
