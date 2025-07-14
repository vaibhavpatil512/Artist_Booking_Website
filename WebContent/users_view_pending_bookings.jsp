<%@page import="com.artist.connectiondb.Data"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.artist.connectiondb.ConnectionDb"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Bookings</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #007bff;
            color: white;
        }

        table td {
            color: #333;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .home-button {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border-radius: 4px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .home-button:hover {
            background-color: #0056b3;
        }

        @media screen and (max-width: 600px) {
            .container {
                padding: 15px;
                width: 100%;
            }

            table th, table td {
                font-size: 14px;
                padding: 8px;
            }

            .home-button {
                font-size: 14px;
                padding: 8px 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Pending Bookings</h1>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>UserID</th>
                    <th>ArtistID</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    try {
                        int id = Data.getId();
                        Connection con = ConnectionDb.dbCon();
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM bookings WHERE uid=? AND status=?");
                        ps.setInt(1, id);
                        ps.setString(2, "pending");
                        ResultSet rs = ps.executeQuery();
                        while(rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getInt(1) %></td>
                        <td><%= rs.getInt(2) %></td>
                        <td><%= rs.getInt(3) %></td>
                        <td><%= rs.getString(4) %></td>
                    </tr>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>

        <a href="userdashboard.html" class="home-button">Home</a>
    </div>
</body>
</html>
