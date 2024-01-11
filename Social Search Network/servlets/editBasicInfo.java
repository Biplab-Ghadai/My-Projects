/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import databasee.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class editBasicInfo extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession session=request.getSession();
        String email=(String)session.getAttribute("session_uemail");
        
        String uname=request.getParameter("uname1");
        String ugender=request.getParameter("ugender1");
        String ucity=request.getParameter("ucity1");
        String ubirthday=request.getParameter("ubirthday1");
        String uinterested=request.getParameter("uinterestedin1");
        String urelationship=request.getParameter("urelationship1");
        String uhobbies=request.getParameter("uhobbies1");
        
        try
        {
            Connection con=DbConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("update GT_REGISTER set NAME='"+uname+"', GENDER='"+ugender+"', CITY='"+ucity+"', BIRTHDAY='"+ubirthday+"' where EMAIL='"+email+"' ");
            ps.executeUpdate();
            session.setAttribute("session_uname", uname);
            session.setAttribute("session_ugender", ugender);
            session.setAttribute("session_ucity", ucity);
            session.setAttribute("session_ubirthday", ubirthday);
            
            Connection con1=DbConnection.getConnect();
            PreparedStatement ps1=con1.prepareStatement("update GT_USER_INFORMATION set INTERESTED_IN='"+uinterested+"', RELATIONSHIP='"+urelationship+"', HOBBIES='"+uhobbies+"' where EMAIL='"+email+"' ");
            ps1.executeUpdate();
            session.setAttribute("session_uinterested_in", uinterested);
            session.setAttribute("session_urelationship", urelationship);
            session.setAttribute("session_uhobbies", uhobbies);
            
            response.sendRedirect("editDetails.jsp");
        }
        catch(Exception e)
        {
            out.print(e);
        }
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
