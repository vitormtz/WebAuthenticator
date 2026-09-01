<%-- 
    Document   : culinaria
    Created on : 21 de mai. de 2023, 22:37:40
    Author     : vitor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .container {
                display: flex;
            }

            .form {
                margin-left: auto;
                margin-top: 90px;
            }
        </style>
    </head>
    <body>
        <div class="container"> 
            <div>
                <h1>Culinária</h1>
                <p>Escolha uma opção abaixo:</p>
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="politica">Política</a></li>
                    <li><a href="esportes">Esportes</a></li>
                    <li><a href="culinaria">Culinária</a></li>
                </ul>
            </div>
            <div class="form">
                <form action="logout" method="post">
                    <input type="submit" value="Deslogar">
                </form>
            </div>
        </div>
        <img src="imagens/culinaria.svg" alt="culinaria" width="960" height="540"/>
    </body>
</html>
