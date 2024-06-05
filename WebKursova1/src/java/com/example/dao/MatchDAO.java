package com.example.dao;

import com.example.model.Match;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class MatchDAO {
    private static List<Match> matches = new ArrayList<>();

    static {
        matches.add(new Match(1, "2024-06-01", "14:00", "Команда A vs Команда B", "3-1", "1-1"));
        matches.add(new Match(2, "2024-06-02", "16:00", "Команда C vs Команда D", "1-2", "1-2"));
        matches.add(new Match(3, "2024-06-03", "14:00", "Команда E vs Команда F", "2-2", "3-0"));
        matches.add(new Match(4, "2024-06-04", "16:00", "Команда G vs Команда H", "3-0", "4-2"));
    }

    public static List<Match> getAllMatches() {
        return new ArrayList<>(matches);
    }

    public static Match getMatchById(int id) {
        return matches.stream().filter(match -> match.getId() == id).findFirst().orElse(null);
    }

    public static void addMatch(Match match) {
        match.setId(matches.size() + 1);
        matches.add(match);
    }

    public static void updateMatch(Match match) {
        for (int i = 0; i < matches.size(); i++) {
            if (matches.get(i).getId() == match.getId()) {
                matches.set(i, match);
                return;
            }
        }
    }

    public static void deleteMatch(int id) {
        matches.removeIf(match -> match.getId() == id);
    }

    public static List<Match> searchMatches(String date, String team) {
        return matches.stream().filter(match -> 
            (date == null || date.isEmpty() || match.getDate().equals(date)) && 
            (team == null || team.isEmpty() || match.getTeams().toLowerCase().contains(team.toLowerCase()))
        ).collect(Collectors.toList());
    }
}
