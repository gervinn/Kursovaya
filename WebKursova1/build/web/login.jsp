<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Вхід для адміністратора</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Вхід для адміністратора</h1>
        <form action="loginServlet" method="post">
            <label for="username">Логін:</label>
            <input type="text" id="username" name="username" required><br><br>

            <label for="password">Пароль:</label>
            <input type="password" id="password" name="password" required><br><br>

            <button type="submit">Увійти</button>
        </form>
        <a href="index.jsp">Назад до розкладу</a>
    </div>
</body>
</html>
