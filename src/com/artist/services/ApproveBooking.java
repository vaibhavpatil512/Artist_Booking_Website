package com.artist.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.artist.connectiondb.ConnectionDb;

/**
 * Servlet implementation class ApproveBooking
 */
public class ApproveBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApproveBooking() {
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
			int bookingid=Integer.parseInt(request.getParameter("id"));
			Connection con=ConnectionDb.dbCon();
			PreparedStatement ps=con.prepareStatement("update bookings set status=? where bookingid=?");
			ps.setString(1, "approved");
			ps.setInt(2, bookingid);
			int i=ps.executeUpdate();
			if(i>0){
				response.sendRedirect("artist_view_bookings.jsp");
			}
			else{
				response.sendRedirect("error");
			}
		}
		catch(Exception e){
			response.sendRedirect("error");
		}
	}

}
