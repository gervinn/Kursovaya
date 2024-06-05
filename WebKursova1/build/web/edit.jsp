<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.model.Match" %>
<%@ page import="com.example.dao.MatchDAO" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Match match = MatchDAO.getMatchById(id);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Редагувати змагання</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Редагувати змагання</h1>
        
        <form action="editMatch" method="post" accept-charset="UTF-8">
            <input type="hidden" name="id" value="<%= match.getId() %>">
            
            <label for="date">Дата:</label>
            <input type="date" id="date" name="date" value="<%= match.getDate() %>" required><br><br>

            <label for="time">Час:</label>
            <input type="time" id="time" name="time" value="<%= match.getTime() %>" required><br><br>

            <label for="teams">Команди:</label>
            <input type="text" id="teams" name="teams" value="<%= match.getTeams() %>" required><br><br>

            <label for="place">Рахунок:</label>
            <input type="text" id="place" name="place" value="<%= match.getPlace() %>" required><br><br>

            <button type="submit">Зберегти</button>
        </form>
        
        <a href="index.jsp">Назад до розкладу</a>
    </div>
</body>
</html>
