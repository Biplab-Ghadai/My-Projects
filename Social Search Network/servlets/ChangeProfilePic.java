/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import databasee.DbConnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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


public class ChangeProfilePic extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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

        HttpSession session = request.getSession();
        String uemail = (String) session.getAttribute("session_uemail");
        String uname=(String)session.getAttribute("session_uname");

        String UPLOAD_DIRECTORY = ServerPaths.MAIN_DIRECTORY + "uploads\\";

        String attachment1 = null;

        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        if (item.getFieldName().equals("browse1")) {
                            attachment1 = new File(item.getName()).getName();
                            item.write(new File(UPLOAD_DIRECTORY + attachment1));
                        }
                    }
                }
            } catch (Exception ex) {
                out.print("File Upload Failed due to " + ex);

            }

        } else {
            out.print("Sorry this Servlet only handles file upload request");

        }

        if (attachment1 == null) {
            out.println("hiiiiiiiiiiiiiiiiiiiiiiii");
            out.println(attachment1);
            //response.sendRedirect("changeProfilePic.jsp");
        }

        try {
            Connection con;
            con = DbConnection.getConnect();
            Statement st = con.createStatement();

            out.println("1a");
            st.executeUpdate("update GT_REGISTER set PROFILE_PIC='" + attachment1 + "' where EMAIL='" + uemail + "'");
            out.println("2a");
            st.executeUpdate("update GT_USER_INFORMATION set PROFILE_PIC='" + attachment1 + "' where EMAIL='" + uemail + "'");
            out.println("3a");
            st.executeUpdate("update GT_ADD_BOOKS set PROFILE_PIC='" + attachment1 + "' where EMAIL='" + uemail + "'");
            out.println("4a");
            st.executeUpdate("update GT_ADD_MOVIES set PROFILE_PIC='" + attachment1 + "' where EMAIL='" + uemail + "'");
            out.println("5a");
            st.executeUpdate("update GT_ADD_TV_SERIALS set PROFILE_PIC='" + attachment1 + "' where EMAIL='" + uemail + "'");
            out.println("6a");
            st.executeUpdate("update GT_ALL_PROFILE_PICS set PROFILE_PIC='" + attachment1 + "' where EMAIL='" + uemail + "'");
            out.println("7a");
            st.executeUpdate("update GT_FOLLOWING set KON_PROFILE_PIC='" + attachment1 + "' where KON_EMAIL='" + uemail + "'");
            out.println("8a");
            st.executeUpdate("update GT_MESSAGES set kisne_bheja_profile_pic='" + attachment1 + "' where KISNE_BHEJA_EMAIL='" + uemail + "'");
            out.println("9a");
            st.executeUpdate("update GT_STATUS_UPDATE set PROFILE_PIC='" + attachment1 + "' where EMAIL='" + uemail + "'");

                ///System.out.println(ft2);
            //File f=new File(ft2);
            ///File f=new File("C:/Users/Admin/Documents/NetBeansProjects/WebApplication3/build/web/abc.txt");
            //FileInputStream is=new FileInputStream(f);
            ///FileReader is=new FileReader(f);
            //ps.setBinaryStream(1, is, (int)f.length());
            ///ps.setCharacterStream(1,is,(int)f.length());
            //ps.setString(2,new Integer(10).toString());
            //ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            out.println("11 : "+e);
        }

        int unique_id = 0;

        try {
            Connection con = DbConnection.getConnect();
            PreparedStatement ps = con.prepareStatement("select * from GT_ALL_PROFILE_PICS");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                unique_id = rs.getInt("ID");
            }

            unique_id++;

        } catch (Exception e) {
            out.print("2 : "+e);
        }

        Date d = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd:MM:yyyy");
        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");

        try {
            Connection con1 = DbConnection.getConnect();
            PreparedStatement ps1 = con1.prepareStatement("insert into GT_ALL_PROFILE_PICS values(?,?,?,?,?,?)");
            ps1.setInt(1, unique_id);
            ps1.setString(2, uemail);
            ps1.setString(3, uname);
            ps1.setString(4, attachment1);
            ps1.setString(5, sdf1.format(d));
            ps1.setString(6, sdf2.format(d));
            ps1.executeUpdate();
        } catch (Exception e) {
            out.print(e);
        }
        
        session.setAttribute("session_uprofile_pic",attachment1);
        response.sendRedirect("changeProfilePic.jsp");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
