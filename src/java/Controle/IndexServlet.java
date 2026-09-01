package Controle;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

/**
 *
 * @author vitor
 */
@javax.servlet.annotation.WebServlet(name = "IndexServlet", urlPatterns = {"/home"})

public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session != null && session.getAttribute("username") != null) {
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }
}
