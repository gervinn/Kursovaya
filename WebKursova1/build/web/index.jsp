<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Match" %>
<%@ page import="com.example.dao.MatchDAO" %>
<%
    String searchDate = request.getParameter("searchDate");
    String searchTeam = request.getParameter("searchTeam");
    String mode = "guest";

    if (session.getAttribute("username") != null) {
        mode = "admin";
    }

    List<Match> matches;
    if ((searchDate != null && !searchDate.isEmpty()) || (searchTeam != null && !searchTeam.isEmpty())) {
        matches = MatchDAO.searchMatches(searchDate, searchTeam);
    } else {
        matches = MatchDAO.getAllMatches();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Розклад та результати спортивних змагань</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Розклад та результати спортивних змагань</h1>

        <% if (mode.equals("admin")) { %>
            <form action="logout.jsp" method="post">
                <button type="submit">Вийти</button>
            </form>
        <% } else { %>
            <form action="login.jsp" method="get">
                <button type="submit">Вхід для адміністратора</button>
            </form>
        <% } %>

        <h2>Пошук</h2>
        <form action="index.jsp" method="get">
            <label for="searchDate">Пошук за датою:</label>
            <input type="date" id="searchDate" name="searchDate">
            
            <label for="searchTeam">Пошук за командою:</label>
            <input type="text" id="searchTeam" name="searchTeam">
            
            <button type="submit">Пошук</button>
        </form>

        <h2>Розклад</h2>
        <table>
            <thead>
                <tr>
                    <th>Дата</th>
                    <th>Час</th>
                    <th>Команди</th>
                    <th>Рахунок</th>
                    <% if (mode.equals("admin")) { %>
                        <th>Дії</th>
                    <% } %>
                </tr>
            </thead>
            <tbody>
                <% for (Match match : matches) { %>
                <tr>
                    <td><%= match.getDate() %></td>
                    <td><%= match.getTime() %></td>
                    <td><a href="guest.jsp"><%= match.getTeams() %></a></td>
                    <td><%= match.getPlace() %></td>
                    <% if (mode.equals("admin")) { %>
                        <td>
                            <a href="edit.jsp?id=<%= match.getId() %>">Редагувати</a>
                            <a href="deleteMatch?id=<%= match.getId() %>">Видалити</a>
                        </td>
                    <% } %>
                </tr>
                <% } %>
            </tbody>
        </table>

        <% if (mode.equals("admin")) { %>
            <h2>Додати нове змагання</h2>
            <form action="saveMatch" method="post" accept-charset="UTF-8">
                <label for="date">Дата:</label>
                <input type="date" id="date" name="date" required><br><br>

                <label for="time">Час:</label>
                <input type="time" id="time" name="time" required><br><br>

                <label for="teams">Команди:</label>
                <input type="text" id="teams" name="teams" required><br><br>

                <label for="place">Рахунок:</label>
                <input type="text" id="place" name="place" required><br><br>

                <button type="submit">Зберегти</button>
            </form>
        <% } %>
    </div>
</body>
</html>
