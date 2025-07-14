<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.artist.connectiondb.ConnectionDb"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.artist.connectiondb.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Management</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            padding: 20px;
        }

        /* Table styling */
        table {
            width: 90%;
            max-width: 1200px;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
            font-size: 1.1em;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Button styling */
        .btn {
            padding: 8px 15px;
            color: #ffffff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9em;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }

        .btn-home {
            margin: 20px 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th colspan="5">Bookings</th>
            </tr>
            <tr>
                <th>ID</th>
                <th>User ID</th>
                <th>Artist ID</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    int id = Data.getId();
                    Connection con = ConnectionDb.dbCon();
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM bookings");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getInt(2)%></td>
                <td><%=rs.getInt(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td>
                    <form action="DeleteBooking" method="post" style="display:inline;">
                        <input type="hidden" id="id" name="id" value="<%=rs.getInt(1)%>">
                        <input type="submit" value="Delete" class="btn btn-delete">
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
    <div class="btn-home">
        <a href="admindashboard.html">
            <button class="btn">Home</button>
        </a>
    </div>
</body>
</html>
