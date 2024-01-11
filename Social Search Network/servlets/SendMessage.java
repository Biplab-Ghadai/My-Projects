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
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SendMessage extends HttpServlet {

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
        
        
        
        int unique_id=0;
        
        try
        {
            Connection con=DbConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("select * from GT_MESSAGES");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                unique_id=rs.getInt("UNIQUE_ID");
            }
            
            unique_id++;
            
        }
        catch(Exception e)
        {
            out.print(e);
        }
        
        
        HttpSession session=request.getSession();
        String who_send_email=(String)session.getAttribute("session_uemail");
        String who_send_name=(String)session.getAttribute("session_uname");
        String who_send_profile_pic=(String)session.getAttribute("session_uprofile_pic");
        
        
        String whome_email=request.getParameter("search_email");
        String whome_name=request.getParameter("search_name");
        String whome_profile_pic=request.getParameter("search_profile_pic");
        
        String message=request.getParameter("send_message");
        
        Date d=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("dd:MM:yyyy");
        SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
        
        String status="not_seen";
        
        try
        {
            Connection con=DbConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("insert into GT_MESSAGES values(?,?,?,?,?,?,?,?,?,?,?)");
            ps.setInt(1, unique_id);
            ps.setString(2, who_send_email );
            ps.setString(3, who_send_name );
            ps.setString(4, who_send_profile_pic );
            ps.setString(5, whome_email );
            ps.setString(6, whome_name );
            ps.setString(7, whome_profile_pic );
            ps.setString(8, message );
            ps.setString(9, sdf1.format(d) );
            ps.setString(10, sdf2.format(d) );
            ps.setString(11, status);
            ps.executeUpdate();
            
            response.sendRedirect("SearchFriendProfile.jsp");
            
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
