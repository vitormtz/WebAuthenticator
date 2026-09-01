<%-- 
    Document   : login
    Created on : 21 de mai. de 2023, 10:22:55
    Author     : vitor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container"> 
            <div>
                <h1>Tela de Login</h1>
            </div>
            <div class="form">
                <form action="login" method="post">
                    <input type="text" name="nome" placeholder="Nome">
                    <input type="password" name="senha" placeholder="Senha">
                    <input type="submit" value="Logar">
                </form>
            </div>
        </div>
        <footer>
            <% if (request.getAttribute("error") != null) { %>
            <script>
                alert("Credenciais inválidas. Tente novamente.");
            </script>
            <% }%>
        </footer>
    </body>
</html>
