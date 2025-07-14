package com.artist.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.time.LocalDateTime;
//import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.artist.connectiondb.ConnectionDb;
import com.artist.connectiondb.Data;

/**
 * Servlet implementation class BookArtist
 */
//@WebServlet("/BookArtist")
public class BookArtist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookArtist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int bookingid = 0;
		try{
			int aid = Integer.parseInt(request.getParameter("id"));
			int uid = Data.getId();
//			LocalDateTime currentDateTime = LocalDateTime.now();
//			DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//			DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
//			String bookingDate = currentDateTime.format(dateFormatter);
//			String bookingTime = currentDateTime.format(timeFormatter);
			Connection con = ConnectionDb.dbCon();
			PreparedStatement ps = con.prepareStatement("select * from user where userid=?");
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){			
				PreparedStatement ps1 = con.prepareStatement("insert into bookings values(?,?,?,?)");
				ps1.setInt(1,bookingid);
				ps1.setInt(2,aid);
				ps1.setInt(3,uid);
				ps1.setString(4,"pending");
				
				int i = ps1.executeUpdate();
				if(i>0){
					response.sendRedirect("users_view_bookings.jsp");
				}
				else{
					response.sendRedirect("error.html");
				}
			}
			else{
				
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
