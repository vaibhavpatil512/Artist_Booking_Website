package com.artist.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.artist.connectiondb.ConnectionDb;

/**
 * Servlet implementation class RegisterArtist
 */
//@WebServlet("/RegisterArtist")
public class RegisterArtist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterArtist() {
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
		
		int id=0;
		try{
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String confirm_password=request.getParameter("confirm_password");
			String youtube_link=request.getParameter("youtube_link");
			String artist_type=request.getParameter("artist_type");
			if(password.equals(confirm_password)){
				Connection con=ConnectionDb.dbCon();
				PreparedStatement ps=con.prepareStatement("insert into artist values(?,?,?,?,?,?,?)");
				ps.setInt(1, id);
				ps.setString(2, email);
				ps.setString(3, password);
				ps.setString(4, name);
				ps.setString(5, artist_type);
				ps.setString(6, youtube_link);
				ps.setString(7, "pending");
				int i=ps.executeUpdate();
				if(i>0){
					response.sendRedirect("ArtistLogin.html");
				}
				else{
					response.sendRedirect("error1.html");
				}
			}
			else{
				response.sendRedirect("error2.html");
			}
		}
		catch(Exception e){
			response.sendRedirect("error.html");
		}
	}

}
