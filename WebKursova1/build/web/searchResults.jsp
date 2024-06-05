<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dao.MatchDAO" %>
<%@ page import="com.example.model.Match" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Результати пошуку</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Результати пошуку</h1>

        <% 
            String searchDate = request.getParameter("date");
            String searchTeam = request.getParameter("team");

            List<Match> searchResults = MatchDAO.searchMatches(searchDate, searchTeam); 

            if (searchResults != null && !searchResults.isEmpty()) { 
        %>
            <table>
                <thead>
                    <tr>
                        <th>Дата</th>
                        <th>Час</th>
                        <th>Команди</th>
                        <th>Рахунок</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Match match : searchResults) { %>
                        <tr>
                            <td><%= match.getDate() %></td>
                            <td><%= match.getTime() %></td>
                            <td><a href="guest.jsp"> <%= match.getTeams() %> </a></td>
                            <td><%= match.getResult() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <p>Результати відсутні.</p>
        <% } %>

        <a href="index.jsp">Назад до розкладу</a>
    </div>
</body>
</html>
