package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DatabaseConnectionListener implements ServletContextListener {

    private Connection connection;

    // Called when the web application starts
    @Override
    public void contextInitialized(ServletContextEvent event) {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver Load Success!!!");

            // Create DB connection
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_pharma_mgmt_system","root","Vedant_K@5126");
            System.out.println("Authentication Success!!!");

            // Store connection in ServletContext for global access
            ServletContext servletContext = event.getServletContext();
            servletContext.setAttribute("myConnection", connection);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Called when the web application shuts down
    @Override
    public void contextDestroyed(ServletContextEvent event) {
        try {
            if (connection != null) {
                connection.close();
                System.out.println("Database Connection Closed Successfully.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
