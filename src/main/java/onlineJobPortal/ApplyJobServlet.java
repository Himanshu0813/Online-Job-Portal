package onlineJobPortal;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/applyJobServlet")
public class ApplyJobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession();
        String seekerEmail = (String) session.getAttribute("email");

        if (seekerEmail == null) {
            res.sendRedirect("login.jsp?msg=Please+login+first");
            return;
        }

        int jobId = Integer.parseInt(req.getParameter("jobId"));

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO applications (job_id, seeker_email) VALUES (?, ?)"
            );
            ps.setInt(1, jobId);
            ps.setString(2, seekerEmail);
            ps.executeUpdate();

            res.sendRedirect(req.getContextPath() + "/seeker/applications.jsp?msg=Application+submitted");
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}
