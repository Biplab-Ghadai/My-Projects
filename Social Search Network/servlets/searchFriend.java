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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class searchFriend extends HttpServlet {

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
        
        String search_friend=request.getParameter("ID");
        
        String sname=null;
        String sprofile_pic=null;
        String scity=null;
        String sbirthday=null;
        String sgender=null;
        String stheme=null;
        String semail=null;
        
        try
        {
            Connection con=DbConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("select * from GT_REGISTER where EMAIL='"+search_friend+"' ");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                sname=rs.getString("NAME");
                sprofile_pic=rs.getString("PROFILE_PIC");
                scity=rs.getString("CITY");
                sbirthday=rs.getString("BIRTHDAY");
                sgender=rs.getString("GENDER");
                stheme=rs.getString("THEME");
                semail=rs.getString("EMAIL");
            }
            
            session.setAttribute("session_search_friend_name", sname);
            session.setAttribute("session_search_friend_profile_pic", sprofile_pic);
            session.setAttribute("session_search_friend_city", scity);
            session.setAttribute("session_search_friend_birthday", sbirthday);
            session.setAttribute("session_search_friend_gender", sgender);
            session.setAttribute("session_search_friend_email", semail);
            
        }
        catch(Exception e)
        {
            out.print(e);
        }
        
        
        
        String sinterested_in=null;
        String srelationship=null;
        String shobbies=null;
        String sphone_no=null;
        String saddress=null;
        String scollege=null;
        String strade=null;
        String scompany=null;
        String sposition=null;
        
        try
        {
            Connection con=DbConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("select * from GT_USER_INFORMATION where EMAIL='"+search_friend+"' ");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                sinterested_in=rs.getString("INTERESTED_IN");
                srelationship=rs.getString("RELATIONSHIP");
                shobbies=rs.getString("HOBBIES");
                sphone_no=rs.getString("PHONE_NO");
                saddress=rs.getString("ADDRESS");
                scollege=rs.getString("COLLEGE");
                strade=rs.getString("TRADE");
                scompany=rs.getString("COMPANY");
                sposition=rs.getString("POSITION");
            }
            
            session.setAttribute("session_search_friend_interested_in", sinterested_in);
            session.setAttribute("session_search_friend_relationship", srelationship);
            session.setAttribute("session_search_friend_hobbies", shobbies);
            session.setAttribute("session_search_friend_phone_no", sphone_no);
            session.setAttribute("session_search_friend_address", saddress);
            session.setAttribute("session_search_friend_college", scollege);
            session.setAttribute("session_search_friend_trade", strade);
            session.setAttribute("session_search_friend_company", scompany);
            session.setAttribute("session_search_friend_position", sposition);
            
            
        }
        catch(Exception e)
        {
            out.print(e);
        }
        
        
        response.sendRedirect("SearchFriendProfile.jsp");
        
        
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
