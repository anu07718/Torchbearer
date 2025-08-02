/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Dao;

/**
 *
 * @author skota
 */

import com.Bean.SignupBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class SignupDao {
    private String jdbcUrl = "jdbc:mysql://localhost:3306/torchbearer";
    private String jdbcUsername = "root";
    private String jdbcPassword = "ak12345";
    private String jdbcDriver = "com.mysql.cj.jdbc.Driver";

    public boolean registerUser(SignupBean signupBean) {
        boolean status = false;
        try {
            Class.forName(jdbcDriver);
            Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

            String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, signupBean.getUsername());
            ps.setString(2, signupBean.getEmail());
            ps.setString(3, signupBean.getPassword());

            int rowsInserted = ps.executeUpdate();
            status = rowsInserted > 0;

            ps.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
