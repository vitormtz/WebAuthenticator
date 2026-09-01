/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controle;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vitor
 */
@javax.servlet.annotation.WebServlet(name = "CulinariaServlet", urlPatterns = {"/culinaria"})
public class CulinariaServlet extends HttpServlet {

    private Map<String, Integer> preferences;

    @Override
    public void init() throws ServletException {
        preferences = new HashMap<>();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session != null && session.getAttribute("username") != null) {

            preferences.put("", preferences.getOrDefault("", 0) + 1);
            Cookie cookie = new Cookie(((String) session.getAttribute("username")) + "_culinaria", preferences.getOrDefault("", 0).toString());
            cookie.setMaxAge(30 * 24 * 60 * 60); // 30 dias
            response.addCookie(cookie);

            request.getRequestDispatcher("culinaria.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }
}
