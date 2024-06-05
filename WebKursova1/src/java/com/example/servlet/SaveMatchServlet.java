package com.example.servlet;


import com.example.dao.MatchDAO;
import com.example.model.Match;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/saveMatch")
public class SaveMatchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String teams = request.getParameter("teams");
        String place = request.getParameter("place");

        Match newMatch = new Match(date, time, teams, place, "");

        MatchDAO.addMatch(newMatch);

        response.sendRedirect("index.jsp");
    }
}
