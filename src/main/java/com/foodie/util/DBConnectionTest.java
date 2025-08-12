package com.foodie.util;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Test class to verify database connection
 * Run this class to test if database connection is working properly
 */
public class DBConnectionTest {
    
    public static void main(String[] args) {
        System.out.println("Testing Database Connection...");
        
        try {
            // Print connection info (without password)
            DBConnection.printConnectionInfo();
            
            // Test connection
            Connection conn = DBConnection.getConnection();
            
            if (conn != null) {
                System.out.println("✅ Database connection successful!");
                System.out.println("Connection URL: " + conn.getMetaData().getURL());
                System.out.println("Database Product: " + conn.getMetaData().getDatabaseProductName());
                System.out.println("Database Version: " + conn.getMetaData().getDatabaseProductVersion());
                
                // Close connection
                conn.close();
                System.out.println("✅ Connection closed successfully!");
                
            } else {
                System.out.println("❌ Failed to establish database connection!");
            }
            
        } catch (SQLException e) {
            System.out.println("❌ Database connection failed!");
            System.out.println("Error: " + e.getMessage());
            System.out.println("SQLState: " + e.getSQLState());
            System.out.println("Error Code: " + e.getErrorCode());
            
            // Common troubleshooting tips
            System.out.println("\n🔧 Troubleshooting Tips:");
            System.out.println("1. Make sure MySQL server is running");
            System.out.println("2. Verify database 'foodie_db' exists");
            System.out.println("3. Check username and password in database.properties");
            System.out.println("4. Ensure MySQL connector JAR is in classpath");
            
        } catch (Exception e) {
            System.out.println("❌ Unexpected error occurred!");
            e.printStackTrace();
        }
    }
}
