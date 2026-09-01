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
@javax.servlet.annotation.WebServlet(name = "LogoutServlet", urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        Cookie cookie = new Cookie((String) session.getAttribute("username"), "");
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        session.invalidate();

        response.sendRedirect("login");
    }
}
