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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Registeration extends HttpServlet {

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
        
        int unique_id=0;
        
        try
        {
            Connection con=DbConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("select * from GT_REGISTER");
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
        
        
        String name=request.getParameter("name1");
        String email=request.getParameter("email1");
        String password=request.getParameter("password1");
        String cpassword=request.getParameter("cpassword1");
        String city=request.getParameter("city1");
        String birthday=request.getParameter("birthday1");
        String gender=request.getParameter("ugender1");
        
        if(gender==null)
        {
            gender="";
        }
        String profile_pic=null;
        if(gender.equals("Male"))
        {
            profile_pic="male.png";
        }
        else
        {
            profile_pic="female.jpg";
        }
        
        Date d=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("dd:MM:yyyy");
        SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
        
        String theme="white";
        
        String interested_in="--not updated--";
        String relationship="--not updated--";
        String hobbies="--not updated--";
        String phone_no="--not updated--";
        String address="--not updated--";
        String college="--not updated--";
        String trade="--not updated--";
        String company="--not updated--";
        String position="--not updated--";
        
        
        if(password.equals(cpassword))
        {
            try
            {
                Connection conn=DbConnection.getConnect();
                
                PreparedStatement pss=conn.prepareStatement("select * from GT_REGISTER where email=?");
                pss.setString(1, email);
                ResultSet rss=pss.executeQuery();
                if(rss.next())
                {
                    request.setAttribute("error_message", "Email id already exist in our database...!!");
                    RequestDispatcher rd1=request.getRequestDispatcher("index.jsp");
                    rd1.include(request, response);
                }
                else
                {
                    System.out.println("2222222222222222");
                    try
                    {
                        Connection con=DbConnection.getConnect();
                        PreparedStatement ps=con.prepareStatement("insert into GT_REGISTER values(?,?,?,?,?,?,?,?,?,?,?)");
                        ps.setInt(1, unique_id);
                        ps.setString(2, name );
                        ps.setString(3, email );
                        ps.setString(4, password );
                        ps.setString(5, city );
                        ps.setString(6, birthday );
                        ps.setString(7, gender );
                        ps.setString(8, profile_pic );
                        ps.setString(9, sdf1.format(d) );
                        ps.setString(10, sdf2.format(d) );
                        ps.setString(11, theme);
                        ps.executeUpdate();


                        Connection con1=DbConnection.getConnect();
                        PreparedStatement ps1=con1.prepareStatement("insert into GT_USER_INFORMATION values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                        ps1.setInt(1, unique_id);
                        ps1.setString(2, name );
                        ps1.setString(3, email );
                        ps1.setString(4, profile_pic );
                        ps1.setString(5, sdf1.format(d) );
                        ps1.setString(6, sdf2.format(d) );
                        ps1.setString(7, interested_in );
                        ps1.setString(8, relationship );
                        ps1.setString(9, hobbies );
                        ps1.setString(10, phone_no );
                        ps1.setString(11, address);
                        ps1.setString(12, college );
                        ps1.setString(13, trade );
                        ps1.setString(14, company );
                        ps1.setString(15, position );
                        int i=ps1.executeUpdate();

                        if(i>0)
                        {
                            session.setAttribute("session_uuid", unique_id);
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


                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
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
