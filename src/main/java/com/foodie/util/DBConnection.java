package com.foodie.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
    private static String URL;
    private static String USER;
    private static String PASSWORD;
    private static String DRIVER;

    static {
        loadDatabaseProperties();
        try {
            Class.forName(DRIVER); // Load MySQL driver
        } catch (ClassNotFoundException e) {
            System.err.println("Database driver not found: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private static void loadDatabaseProperties() {
        Properties props = new Properties();
        InputStream inputStream = null;
        
        try {
            // Try to load from classpath first
            inputStream = DBConnection.class.getClassLoader().getResourceAsStream("database.properties");
            
            // If not found in classpath, try to load from project root
            if (inputStream == null) {
                inputStream = DBConnection.class.getClassLoader().getResourceAsStream("../../../database.properties");
            }
            
            // If still not found, try loading from file system (project root)
            if (inputStream == null) {
                try {
                    java.io.FileInputStream fileInput = new java.io.FileInputStream("database.properties");
                    props.load(fileInput);
                    fileInput.close();
                } catch (IOException e) {
                    System.err.println("database.properties file not found. Using default values.");
                    setDefaultProperties();
                    return;
                }
            } else {
                props.load(inputStream);
            }
            
            // Load properties
            URL = props.getProperty("db.url", "jdbc:mysql://localhost:3306/foodie_db?useSSL=false&serverTimezone=UTC");
            USER = props.getProperty("db.username", "root");
            PASSWORD = props.getProperty("db.password", "password");
            DRIVER = props.getProperty("db.driver", "com.mysql.cj.jdbc.Driver");
            
        } catch (IOException e) {
            System.err.println("Error loading database properties: " + e.getMessage());
            setDefaultProperties();
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    System.err.println("Error closing input stream: " + e.getMessage());
                }
            }
        }
    }
    
    private static void setDefaultProperties() {
        System.out.println("Warning: Using default database configuration. Create database.properties file for custom settings.");
        URL = "jdbc:mysql://localhost:3306/foodie_db?useSSL=false&serverTimezone=UTC";
        USER = "root";
        PASSWORD = "password";
        DRIVER = "com.mysql.cj.jdbc.Driver";
    }

    public static Connection getConnection() throws SQLException {
        if (URL == null || USER == null || PASSWORD == null) {
            throw new SQLException("Database configuration not properly loaded");
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
    
    // Utility methods for testing and debugging
    public static void printConnectionInfo() {
        System.out.println("Database URL: " + URL);
        System.out.println("Database User: " + USER);
        System.out.println("Database Driver: " + DRIVER);
        // Note: Never print password for security reasons
    }
}
