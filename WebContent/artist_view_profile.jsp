<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.artist.connectiondb.Data"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.artist.connectiondb.ConnectionDb"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artist Profile</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 900px;
	margin: 0 auto;
	padding: 20px;
}

h1 {
	text-align: center;
	color: #333;
}

.profile-header {
	text-align: center;
	margin-bottom: 30px;
}

.profile-header img {
	width: 150px;
	height: 150px;
	border-radius: 50%;
}

.profile-header h2 {
	margin-top: 10px;
	font-size: 24px;
	color: #555;
}

.profile-header p {
	font-size: 18px;
	color: #777;
}

.section {
	margin-bottom: 30px;
}

.section h3 {
	font-size: 22px;
	color: #333;
	margin-bottom: 10px;
}

.section ul {
	list-style-type: none;
	padding-left: 0;
}

.section ul li {
	font-size: 18px;
	color: #555;
	margin-bottom: 5px;
}

.social-links a {
	text-decoration: none;
	color: #007bff;
	margin-right: 10px;
}

.youtube-links iframe {
	width: 100%;
	height: 315px;
	margin-bottom: 20px;
}

.home-button {
	margin: 20px;
	padding: 10px 20px;
	font-size: 16px;
	background-color: #007bff;
	color: white;
	text-decoration: none;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.home-button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	<%
		int aid=0;
		if(Data.getRole().equals("Artist")){
			aid = Data.getId();
		}
		else{
			try{
				aid = Integer.parseInt(request.getParameter("id"));
			}
			catch(NumberFormatException e){
				e.printStackTrace();
			}
		}
		
		Connection con = ConnectionDb.dbCon();
		PreparedStatement ps = con.prepareStatement("select * from artist where aid=?");
		ps.setInt(1, aid);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {}
	%>
	<div class="container">
		<div class="profile-header">
			<%-- <img src="<%=rs.getString("image") %>" alt="Artist Photo" width="30" height="20"> --%>
			<img src="images/image.jpeg" alt="Artist Photo" width="300" height="200">
			<h2><%= rs.getString("name") %></h2>
			<h2>Artist Type: <%= rs.getString("artisttype") %></h2>
		</div>

		<div class="section">
			<ul>
				<li>Specialty: NA</li>
			</ul>
		</div>

		<div class="section">
			<h3>Clip</h3>
			<div class="youtube-links">
				<iframe width="560" height="315" src="<%= rs.getString("youtube_link") %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			</div>
		</div>

		<div class="section">
			<h3>Achievements</h3>
			<ul>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>

		<div class="section">
			<h3>Social Media</h3>
			<div class="social-links">
				<a href="" target="_blank">Instagram</a>
				<a href="" target="_blank">Twitter</a>
				<a href="" target="_blank">Facebook</a>
			</div>
		</div>

		<div class="section">
			<h3>Contact Info</h3>
			<ul>
				<li>Email: <%=rs.getString("email") %></li>
				<%-- <li>Phone: <%=rs.getString("contact") %></li> --%>
			</ul>
		</div>

		<div class="section">
			<h3>Bio</h3>
			<p>NA</p>
		</div>
	</div>
	<% if(Data.getRole().equals("Artist")){%>
	<a href="artistdashboard.html" class="home-button">Home</a> <!-- Home Button -->
	<%
	}
	else{%>
		<a href="userdashboard.html" class="home-button">Home</a> <!-- Home Button -->
	<%}
	%>
	
</body>
</html>