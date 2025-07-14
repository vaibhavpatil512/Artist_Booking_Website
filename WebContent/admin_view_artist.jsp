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
    <title>Artist Management</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            padding: 20px;
        }

        /* Table styling */
        table {
            width: 90%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
            font-size: 1.1em;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e9ecef;
        }

        /* Button styling */
        .btn {
            padding: 8px 15px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
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
            margin: 15px 0;
            text-align: center;
        }

        /* Link styling for the video link */
        a.video-link {
            color: #007bff;
            text-decoration: none;
        }

        a.video-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th colspan="7">Artists</th>
            </tr>
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Artist Name</th>
                <th>Artist Type</th>
                <th>Clip</th>
                <th colspan="2">Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    int id = Data.getId();
                    Connection con = ConnectionDb.dbCon();
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM artist");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><a href="<%=rs.getString(6)%>" target="_blank" class="video-link">Open Video</a></td>
                <td>
                    <form action="DeleteArtist" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%=rs.getInt("aid")%>">
                        <input type="submit" value="Delete" class="btn btn-delete">
                    </form>
                </td>
                <td>
                    <form action="ApproveArtist" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%=rs.getInt("aid")%>">
                        <input type="submit" value="Approve" class="btn">
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
