<%-- 
    Document   : home
    Created on : 21 de mai. de 2023, 23:12:37
    Author     : vitor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .banner {
                float: right;
                width: 960px;
                height: 540px;
                background-color: #f1f1f1;
            }
        </style>
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
                <h1>Bem-vindo ao Site</h1>        
                <p>Você está logado como <%= (String) session.getAttribute("username")%></p>
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
        <%
            Object[][] banner = {
                {"", 0},
                {"", 0},
                {"", 0},
                {"", 0}
            };

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    String cookieName = cookie.getName();
                    if (cookieName.equals(session.getAttribute("username") + "_politica")) {
                        banner[0][0] = cookieName;
                        banner[0][1] = Integer.parseInt(cookie.getValue());
                    } else if (cookieName.equals(session.getAttribute("username") + "_esportes")) {
                        banner[1][0] = cookieName;
                        banner[1][1] = Integer.parseInt(cookie.getValue());
                    } else if (cookieName.equals(session.getAttribute("username") + "_culinaria")) {
                        banner[2][0] = cookieName;
                        banner[2][1] = Integer.parseInt(cookie.getValue());
                    } else if (cookieName.equals(session.getAttribute("username") + "_contador")) {
                        banner[3][0] = cookieName;
                        banner[3][1] = Integer.parseInt(cookie.getValue());
                    }
                }
            }

            int politicaValue = Integer.parseInt(banner[0][1].toString());
            int esportesValue = Integer.parseInt(banner[1][1].toString());
            int culinariaValue = Integer.parseInt(banner[2][1].toString());
            int contadorValue = Integer.parseInt(banner[3][1].toString());

            if (contadorValue >= 2) {
                if (politicaValue > esportesValue && politicaValue > culinariaValue) {
        %>
        <div class="banner">
            <img src="imagens/politica.svg" alt="politica" width="960" height="540"/>
            <p>Esteja atualizado sobre as últimas notícias e acontecimentos políticos. Informe-se sobre os debates, eleições e decisões que impactam nosso país e a sociedade.</p>
        </div>
        <%
        } else if (esportesValue > politicaValue && esportesValue > culinariaValue) {
        %>
        <div class="banner">
            <img src="imagens/esportes.svg" alt="esportes" width="960" height="540"/>
            <p>Fique por dentro do mundo dos esportes e acompanhe os principais campeonatos, competições e eventos esportivos. Descubra histórias inspiradoras de atletas, vitórias emocionantes e momentos inesquecíveis.</p>
        </div>
        <%
        } else if (culinariaValue > politicaValue && culinariaValue > esportesValue) {
        %>
        <div class="banner">
            <img src="imagens/culinaria.svg" alt="culinaria" width="960" height="540"/>
            <p>Explore o universo da culinária e descubra novas receitas, dicas de gastronomia e técnicas culinárias. Aventure-se na cozinha, experimente sabores diferentes e desfrute de pratos deliciosos para surpreender seus amigos e familiares.</p>
        </div>
        <%
        } else {
        %> 
        <div class="banner">
            <img src="imagens/empate.svg" alt="empate" width="960" height="540"/>
        </div>
        <%
                }
            }
        %>
    </body>
</html>