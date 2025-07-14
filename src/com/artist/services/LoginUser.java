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
 * Servlet implementation class LoginUser
 */
//@WebServlet("/LoginUser")
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginUser() {
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
			System.out.println(email+" "+password);
			//import connection(java.sql)
			Connection con = ConnectionDb.dbCon();
			PreparedStatement ps = con.prepareStatement("select * from user where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			//import resultset
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				Data.setId(rs.getInt("userid"));
				Data.setRole("User");
				response.sendRedirect("userdashboard.html");
			}
			else{
				response.sendRedirect("error.html");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
