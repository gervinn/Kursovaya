package com.example.model;


public class Match {
    private int id;
    private String date;
    private String time;
    private String teams;
    private String place;
    private String result;

    public Match(int id, String date, String time, String teams, String place, String result) {
        this.id = id;
        this.date = date;
        this.time = time;
        this.teams = teams;
        this.place = place;
        this.result = result;
    }

    public Match(String date, String time, String teams, String place, String result) {
        this.date = date;
        this.time = time;
        this.teams = teams;
        this.place = place;
        this.result = result;
    }

    // Геттери та сеттери
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTeams() {
        return teams;
    }

    public void setTeams(String teams) {
        this.teams = teams;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
