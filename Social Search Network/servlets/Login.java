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


public class Login extends HttpServlet {

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
        
        String email=request.getParameter("uemail");
        String password=request.getParameter("upassword");
        String name=null;
        String gender=null;
        String city=null;
        String profile_pic=null;
        String birthday=null;
        String password1=null;
        String theme=null;
        
        String interested_in=null;
        String relationship=null;
        String hobbies=null;
        String phone_no=null;
        String address=null;
        String college=null;
        String trade=null;
        String company=null;
        String position=null;
        
        try
        {
            Connection con=DbConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("select * from GT_REGISTER where EMAIL='"+email+"'");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                name=rs.getString("NAME");
                gender=rs.getString("GENDER");
                city=rs.getString("CITY");
                profile_pic=rs.getString("PROFILE_PIC");
                birthday=rs.getString("BIRTHDAY");
                password1=rs.getString("PASSWORD");
                theme=rs.getString("THEME");
            }
            
            Connection con1=DbConnection.getConnect();
            PreparedStatement ps1=con1.prepareStatement("select * from GT_USER_INFORMATION where EMAIL='"+email+"'");
            ResultSet rs1=ps1.executeQuery();
            while(rs1.next())
            {
                interested_in=rs1.getString("INTERESTED_IN");
                relationship=rs1.getString("RELATIONSHIP");
                hobbies=rs1.getString("HOBBIES");
                phone_no=rs1.getString("PHONE_NO");
                address=rs1.getString("ADDRESS");
                college=rs1.getString("COLLEGE");
                trade=rs1.getString("TRADE");
                company=rs1.getString("COMPANY");
                position=rs1.getString("POSITION");
            }
            
        }
        catch(Exception e)
        {
            out.print(e);
        }
        
        
        if(password.equals(password1))
        {
            session.setAttribute("session_uname",name);
            session.setAttribute("session_uemail",email);
            session.setAttribute("session_uprofile_pic",profile_pic);
            session.setAttribute("session_ubirthday",birthday);
            session.setAttribute("session_ugender",gender);
            session.setAttribute("session_ucity",city);
            session.setAttribute("session_upassword", password);
            session.setAttribute("session_utheme", theme);

            session.setAttribute("session_uinterested_in", interested_in);
            session.setAttribute("session_urelationship", relationship);
            session.setAttribute("session_uhobbies", hobbies);
            session.setAttribute("session_uphone_no", phone_no);
            session.setAttribute("session_uaddress", address);
            session.setAttribute("session_ucollege", college);
            session.setAttribute("session_utrade", trade);
            session.setAttribute("session_ucompany", company);
            session.setAttribute("session_uposition", position);
            
            response.sendRedirect("profile.jsp");
        }
        else
        {
            response.sendRedirect("index.jsp");
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
