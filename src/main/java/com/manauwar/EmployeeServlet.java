package com.manauwar;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class EmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public EmployeeServlet() {
            super();
    }
   
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	System.out.println("Inside Employee servlet");
    	
    	int currentStartPageNo = 1;
    	int currentEndPageNo = 1;
    	
        int page = 1;
        int recordsPerPage = 5;
        if(request.getParameter("page") != null){
            page = Integer.parseInt(request.getParameter("page"));
        }
        EmployeeDAO dao = new EmployeeDAO();
        List<Employee> list = dao.viewAllEmployees((page-1)*recordsPerPage,recordsPerPage);
        int noOfRecords = dao.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        
/*******************************************************************************/
        
        
      
		
		for (int i = 1; i <= noOfRecords; i = i + 1) {
			// System.out.println(i);

			if ((i % recordsPerPage) == 0) {

				currentStartPageNo = i - (recordsPerPage -1);
				currentEndPageNo = i;
				for (int j = currentStartPageNo; j <= currentEndPageNo; j++)
				{
					if(currentStartPageNo <= page && page <=currentEndPageNo)
					{
						request.setAttribute("currentStartPageNo", currentStartPageNo);
				        request.setAttribute("currentEndPageNo", currentEndPageNo);
				        System.out.println("page : "+page+"  currentStartPageNo : "+ currentStartPageNo + "    currentEndPageNo : "+currentEndPageNo);
					}
				}
			}
		}
		
		if (page > currentEndPageNo) {
			currentStartPageNo = currentEndPageNo + 1;
			currentEndPageNo = noOfRecords;
			
				
					request.setAttribute("currentStartPageNo", currentStartPageNo);
			        request.setAttribute("currentEndPageNo", currentEndPageNo);
			        System.out.println("page : "+page+"  currentStartPageNo : "+ currentStartPageNo + "    currentEndPageNo : "+currentEndPageNo);
				
		}
        
        
        
/*******************************************************************************/   
        
      
        
        
        
        request.setAttribute("employeeList", list);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        
        
        request.setAttribute("noOfRecords", noOfRecords);
        request.setAttribute("recordsPerPage", recordsPerPage);
        
        
        RequestDispatcher view = request.getRequestDispatcher("display.jsp");
        view.forward(request, response);
    }
}