/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Bean;

/**
 *
 * @author skota
 */
public class TusBean {
    private int id;
    private String name;
    private String email;
    private String feedback;

    // Constructor
    public TusBean() {}

    // Constructor with parameters
    public TusBean(int id, String name, String email, String feedback) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.feedback = feedback;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
}
