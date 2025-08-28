package onlineJobPortal;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminServlet")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        String email = req.getParameter("email");
        String jobId = req.getParameter("jobId");

        String redirectPage = "admin/dashboard.jsp";

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = null;

            switch (action) {
                case "deleteEmployer":
                    ps = con.prepareStatement(
                            "DELETE FROM userss WHERE email=? AND role='employer'");
                    ps.setString(1, email);
                    int empRows = ps.executeUpdate();
                    redirectPage = "admin/manage_employers.jsp?msg="
                            + (empRows > 0 ? "Employer+deleted" : "Employer+not+found");
                    break;

                case "deleteSeeker":
                    ps = con.prepareStatement(
                            "DELETE FROM userss WHERE email=? AND role='seeker'");
                    ps.setString(1, email);
                    int seekerRows = ps.executeUpdate();
                    redirectPage = "admin/manage_seekers.jsp?msg="
                            + (seekerRows > 0 ? "Seeker+deleted" : "Seeker+not+found");
                    break;

                case "deleteJob":
                    if (jobId != null && !jobId.isEmpty()) {
                        int totalDeleted = 0;

                        // delete applications first
                        ps = con.prepareStatement(
                                "DELETE FROM applications WHERE job_id=?");
                        ps.setInt(1, Integer.parseInt(jobId));
                        int appsDeleted = ps.executeUpdate();

                        // then delete the job
                        ps = con.prepareStatement(
                                "DELETE FROM jobs WHERE id=?");
                        ps.setInt(1, Integer.parseInt(jobId));
                        int jobsDeleted = ps.executeUpdate();

                        totalDeleted = appsDeleted + jobsDeleted;

                        System.out.println("Deleted applications: " + appsDeleted);
                        System.out.println("Deleted job: " + jobsDeleted);

                        if (jobsDeleted > 0) {
                            redirectPage = "admin/manage_jobs.jsp?msg=Job+and+" + appsDeleted + "+applications+deleted";
                        } else {
                            redirectPage = "admin/manage_jobs.jsp?msg=Job+not+found+or+already+deleted";
                        }
                    } else {
                        redirectPage = "admin/manage_jobs.jsp?msg=Invalid+Job+ID";
                    }
                    break;

                default:
                    redirectPage = "admin/dashboard.jsp?msg=Invalid+action";
            }

        } catch (Exception e) {
            e.printStackTrace();
            redirectPage = "admin/dashboard.jsp?msg=Error:" + e.getMessage().replace(" ", "+");
        }

        res.sendRedirect(redirectPage);
    }
}
