package com.model;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/webapi1")
public class Fund_ManagementAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	Fund_Management fund_obj = new Fund_Management();
    
    public Fund_ManagementAPI() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String output = fund_obj.insertFund(request.getParameter("ID"), 
				 request.getParameter("Title"), 
				request.getParameter("Relesed_Date"), 
				request.getParameter("Expire_Date"),
				request.getParameter("Type_of_Reserch"),
				request.getParameter("Anoucement_type"),
				request.getParameter("Purpose_of_funding"),
				request.getParameter("Applicant_Instruction")); 
				response.getWriter().write(output); 
	}
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map paras = getParasMap(request); 
		 String output = fund_obj.updateFunds(paras.get("hidItemIDSave").toString(), 
		 paras.get("Title").toString(), 
		 paras.get("Relesed_Date").toString(), 
		paras.get("Expire_Date").toString(), 
		paras.get("Type_of_Reserch").toString(), 
		 paras.get("Anoucement_type").toString(), 
		paras.get("Purpose_of_funding").toString(),
		paras.get("Applicant_Instruction").toString()); 
		response.getWriter().write(output); 
	}

	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map paras = getParasMap(request); 
		 String output = fund_obj.deleteFunds(paras.get("id").toString()); 
		response.getWriter().write(output);
	}
	
	
	private static Map getParasMap(HttpServletRequest request) 
	{ 
	 Map<String, String> map = new HashMap<String, String>(); 
	try
	 { 
	 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8"); 
	 String queryString = scanner.hasNext() ? 
	 scanner.useDelimiter("\\A").next() : ""; 
	 scanner.close(); 
	 String[] params = queryString.split("&"); 
	 for (String param : params) 
	 { 
	String[] p = param.split("=");
	 map.put(p[0], p[1]); 
	 } 
	 } 
	catch (Exception e) 
	 { 
	 } 
	return map; 
	}

}
