package Controle;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import Suporte.Criptografa;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author vitor
 */
@javax.servlet.annotation.WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    private Map<String, Integer> contador;

    @Override
    public void init() throws ServletException {
        contador = new HashMap<>();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("username", "vitor");
        session.setAttribute("password", Criptografa.criptografa("teste123"));

        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");
        senha = Criptografa.criptografa(senha);

        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        if (nome.equals(username) && senha.equals(password)) {
            /*Cookie cookie = new Cookie("nome", username);
            cookie.setMaxAge(30 * 24 * 60 * 60); // 30 dias
            response.addCookie(cookie);

            cookie = new Cookie("senha", password);
            cookie.setMaxAge(30 * 24 * 60 * 60); // 30 dias
            response.addCookie(cookie);*/

            contador.put("", contador.getOrDefault("", 0) + 1);

            Cookie cookie = new Cookie(((String) session.getAttribute("username")) + "_contador", contador.getOrDefault("", 0).toString());
            cookie.setMaxAge(30 * 24 * 60 * 60); // 30 dias
            response.addCookie(cookie);

            response.sendRedirect("home");
        } else {
            request.setAttribute("error", "Credenciais inválidas. Tente novamente.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
