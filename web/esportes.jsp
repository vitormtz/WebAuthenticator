<%-- 
    Document   : esportes
    Created on : 21 de mai. de 2023, 22:37:08
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
                <h1>Esportes</h1>
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
        <img src="imagens/esportes.svg" alt="esportes" width="960" height="540"/>
    </body>
</html>
