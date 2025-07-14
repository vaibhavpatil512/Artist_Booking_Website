<%@page import="com.artist.connectiondb.Data"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.artist.connectiondb.ConnectionDb"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookings Management</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 1100px;
            background-color: #fff;
            margin-top: 30px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
            font-size: 16px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td form {
            display: inline;
            margin: 0 5px;
        }

        input[type="submit"] {
            padding: 8px 16px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .disapprove-btn {
            background-color: #dc3545;
        }

        .disapprove-btn:hover {
            background-color: #c82333;
        }

        .home-button {
            text-align: center;
            margin-top: 20px;
        }

        .home-button a {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .home-button a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Bookings Management</h1>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>ArtistID</th>
                    <th>UserID</th>
                    <th>Status</th>
                    <th colspan="2">Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    try {
                        int id = Data.getId();
                        Connection con = ConnectionDb.dbCon();
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM bookings WHERE aid=?");
                        ps.setInt(1, id);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getInt(2)%></td>
                    <td><%=rs.getInt(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td>
                        <form action="ApproveBooking" method="post">
                            <input type="hidden" name="id" value="<%=rs.getInt(1)%>">
                            <input type="submit" value="Approve">
                        </form>
                    </td>
                    <td>
                        <form action="DisapproveBooking" method="post">
                            <input type="hidden" name="id" value="<%=rs.getInt(1)%>">
                            <input type="submit" class="disapprove-btn" value="Disapprove">
                        </form>
                    </td>
                </tr>
                <% 
                    }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>

        <div class="home-button">
            <a href="artistdashboard.html">Back to Dashboard</a>
        </div>
    </div>

</body>
</html>
