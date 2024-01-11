/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import databasee.DbConnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import paths.ServerPaths;


public class UpdateStatus extends HttpServlet {

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
        String name=(String)session.getAttribute("session_uname");
        String profile_pic=(String)session.getAttribute("session_uprofile_pic");
        
        String UPLOAD_DIRECTORY=ServerPaths.MAIN_DIRECTORY+"uploads\\";
        
        String status1=null;
        String attachment1=null;
        
        if(ServletFileUpload.isMultipartContent(request))
        {
            try
            {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts)
                {
                    if(!item.isFormField())
                    {
                        if(item.getFieldName().equals("browse1"))
                        {
                             attachment1=new File(item.getName()).getName();
                             item.write( new File(UPLOAD_DIRECTORY+attachment1));
                        }
                    }
                    else
                    {
                        if(item.getFieldName().equals("status1"))
                        {
                             status1=item.getString();
                        }
                   }
                }
            }
            catch (Exception ex)
            {
                out.print("File Upload Failed due to " + ex);
               
            }          
         
        }
        else
        {
            out.print("Sorry this Servlet only handles file upload request");
            
        }
        
        if(attachment1.equals("") || attachment1==null)
        {
            attachment1="null";
        }
        else if(status1.equals("") || status1==null)
        {
            status1="null";
        }
        
        int unique_id=0;
        
        try
        {
            Connection con=DbConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("select * from GT_STATUS_UPDATE");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                unique_id=rs.getInt("UNIQUE_ID");
            }
            
            unique_id++;
            
        }
        catch(Exception e)
        {
            out.print("exception 1 :- "+e);
        }
        
        
        Date d=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("dd:MM:yyyy");
        SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
        
        try
        {
            Connection con=DbConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("insert into GT_STATUS_UPDATE values (?,?,?,?,?,?,?,?)");
            ps.setInt(1, unique_id);
            ps.setString(2, email);
            ps.setString(3, name);
            ps.setString(4, profile_pic);
            ps.setString(5, status1);
            ps.setString(6, attachment1);
            ps.setString(7, sdf1.format(d));
            ps.setString(8, sdf2.format(d));
            ps.executeUpdate();
            
            response.sendRedirect("profile.jsp");
            
        }
        catch(Exception e)
        {
            out.print("exception 2 :- "+e);
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
