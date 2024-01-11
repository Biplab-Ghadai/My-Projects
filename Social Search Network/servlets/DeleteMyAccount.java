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

 class DeleteMyAccount extends HttpServlet {

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
        
        try
        {
            Connection con=DbConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("delete from GT_REGISTER where EMAIL='"+email+"' ");
            ps.executeUpdate();
            
            Connection con1=DbConnection.getConnect();
            PreparedStatement ps1=con1.prepareStatement("delete from GT_USER_INFORMATION where EMAIL='"+email+"' ");
            ps1.executeUpdate();
            
            Connection con2=DbConnection.getConnect();
            PreparedStatement ps2=con2.prepareStatement("delete from GT_ADD_BOOKS where EMAIL='"+email+"' ");
            ps2.executeUpdate();
            
            Connection con3=DbConnection.getConnect();
            PreparedStatement ps3=con3.prepareStatement("delete from GT_ADD_MOVIES where EMAIL='"+email+"' ");
            ps3.executeUpdate();
            
            Connection con4=DbConnection.getConnect();
            PreparedStatement ps4=con4.prepareStatement("delete from GT_ADD_TV_SERIALS where EMAIL='"+email+"' ");
            ps4.executeUpdate();
            
            Connection con5=DbConnection.getConnect();
            PreparedStatement ps5=con5.prepareStatement("delete from GT_ALL_PROFILE_PICS where EMAIL='"+email+"' ");
            ps5.executeUpdate();
            
            Connection con6=DbConnection.getConnect();
            PreparedStatement ps6=con6.prepareStatement("delete from GT_FOLLOWING where KON_EMAIL='"+email+"' ");
            ps6.executeUpdate();
            
            Connection con7=DbConnection.getConnect();
            PreparedStatement ps7=con7.prepareStatement("delete from GT_MESSAGES where KISNE_BHEJA_EMAIL='"+email+"' ");
            ps7.executeUpdate();
            
            Connection con8=DbConnection.getConnect();
            PreparedStatement ps8=con8.prepareStatement("delete from GT_STATUS_UPDATE where EMAIL='"+email+"' ");
            ps8.executeUpdate();
            
            response.sendRedirect("index.jsp");
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
