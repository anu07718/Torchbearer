/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Bean;

/**
 *
 * @author skota
 */


import java.util.List;

public class TeateryBean {
    private int eateryId;
    private String name;
    private String famousDish;
    private String specialty;
    private String timings;
    private String specialOffer;
    private String locationUrl;
    private List<String> comments;
    private boolean liked;

    // Getters and Setters
    public int getEateryId() {
        return eateryId;
    }
    
    public void setEateryId(int eateryId) {
        this.eateryId = eateryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFamousDish() {
        return famousDish;
    }

    public void setFamousDish(String famousDish) {
        this.famousDish = famousDish;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getTimings() {
        return timings;
    }

    public void setTimings(String timings) {
        this.timings = timings;
    }

    public String getSpecialOffer() {
        return specialOffer;
    }

    public void setSpecialOffer(String specialOffer) {
        this.specialOffer = specialOffer;
    }

    public String getLocationUrl() {
        return locationUrl;
    }

    public void setLocationUrl(String locationUrl) {
        this.locationUrl = locationUrl;
    }

    public List<String> getComments() {
        return comments;
    }

    public void setComments(List<String> comments) {
        this.comments = comments;
    }

    public boolean isLiked() {
        return liked;
    }

    public void setLiked(boolean liked) {
        this.liked = liked;
    }
}
