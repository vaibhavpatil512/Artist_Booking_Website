package com.artist.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.artist.connectiondb.ConnectionDb;
import com.artist.connectiondb.Data;

/**
 * Servlet implementation class LoginArtist
 */
//@WebServlet("/LoginArtist")
public class LoginArtist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginArtist() {
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
		try{
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			Connection con = ConnectionDb.dbCon();
			PreparedStatement ps = con.prepareStatement("select * from artist where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				if((rs.getString("status")).equals("approved")){
					Data.setId(rs.getInt("aid"));
					Data.setRole("Artist");
					response.sendRedirect("artistdashboard.html");
				}
				else{
					response.sendRedirect("artistNotApproved.html");
				}
			}
			else{
				response.sendRedirect("error1.html");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
