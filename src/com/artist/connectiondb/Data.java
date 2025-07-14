package com.artist.connectiondb;

public class Data {
	private static int id;
	private static String role;
	
	
	public static String getRole() {
		return role;
	}

	public static void setRole(String role) {
		Data.role = role;
	}

	public static int getId() {
		return id;
	}

	public static void setId(int id) {
		Data.id = id;
	}
	
}
