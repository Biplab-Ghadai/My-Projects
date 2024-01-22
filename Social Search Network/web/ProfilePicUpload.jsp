<%@page import="databasee.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>


<%
        String utheme=(String)session.getAttribute("session_utheme");
        String uname=(String)session.getAttribute("session_uname");
        String ugender=(String)session.getAttribute("session_ugender");
        String ucity=(String)session.getAttribute("session_ucity");
        String ubirthday=(String)session.getAttribute("session_ubirthday");
        String uemail=(String)session.getAttribute("session_uemail");
        String uprofile_pic=(String)session.getAttribute("session_uprofile_pic");
%>


<%!
String ft,ft1,ft2;
    
%>
<%
//
   File file;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");
   // Verify the content type
   String contentType =request.getContentType();
   System.out.println(contentType);
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      
                DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
                factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
                factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);
   
      // maximum file size to be uploaded.
                upload.setSizeMax( maxFileSize );
                try{ 
         // Parse the request to get file items.
                List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
                Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            //System.out.println(fileName.lastIndexOf("\\"));
            if( fileName.lastIndexOf("\\") >= 0 )
            {
                file = new File( filePath + 
                fileName.substring( fileName.lastIndexOf("\\"))) ;
            }
            else
            {
                //System.out.println(filePath+fileName.substring(fileName.lastIndexOf("\\")+1));
                file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
            //out.println("Uploaded Filename: " + filePath + fileName + "<br>");
            ft=fileName;
            ft1=filePath;
            }
         }
         out.println("</body></html>");
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }
   else{
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
     ft2=ft1+ft;
%>
 <%    

               String email=(String) session.getAttribute("session_uemail");
            try{
                Connection con=DbConnection.getConnect();
                Statement st= con.createStatement();
                
                st.executeUpdate("update GT_REGISTER set PROFILE_PIC='"+ft+"' where EMAIL='"+email+"'");
                st.executeUpdate("update GT_USER_INFORMATION set PROFILE_PIC='"+ft+"' where EMAIL='"+email+"'");
                st.executeUpdate("update GT_ADD_BOOKS set PROFILE_PIC='"+ft+"' where EMAIL='"+email+"'");
                st.executeUpdate("update GT_ADD_MOVIES set PROFILE_PIC='"+ft+"' where EMAIL='"+email+"'");
                st.executeUpdate("update GT_ADD_TV_SERIALS set PROFILE_PIC='"+ft+"' where EMAIL='"+email+"'");
                st.executeUpdate("update GT_ALL_PROFILE_PICS set PROFILE_PIC='"+ft+"' where EMAIL='"+email+"'");
                st.executeUpdate("update GT_FOLLOWING set PROFILE_PIC='"+ft+"' where KON_EMAIL='"+email+"'");
                st.executeUpdate("update GT_MESSAGES set PROFILE_PIC='"+ft+"' where KISNE_BHEJA_EMAIL='"+email+"'");
                st.executeUpdate("update GT_STATUS_UPDATE set PROFILE_PIC='"+ft+"' where EMAIL='"+email+"'");
                
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
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
               
               
               
        int unique_id=0;
        
        try
        {
            Connection con=DbConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("select * from GT_ALL_PROFILE_PICS");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                unique_id=rs.getInt("ID");
            }
            
            unique_id++;
            
        }
        catch(Exception e)
        {
            out.print(e);
        }
               
        
        
        
        
        
        
        Date d=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("dd:MM:yyyy");
        SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
        
        
        try
        {
            Connection con1=DbConnection.getConnect();
            PreparedStatement ps1=con1.prepareStatement("insert into GT_ALL_PROFILE_PICS values(?,?,?,?,?,?)");
            ps1.setInt(1, unique_id);
            ps1.setString(2, uemail );
            ps1.setString(3, uname );
            ps1.setString(4, ft );
            ps1.setString(5, sdf1.format(d) );
            ps1.setString(6, sdf2.format(d) );
            ps1.executeUpdate();
        }
        catch(Exception e)
        {
            out.print(e);
        }
        
        
               
               
          %>
         
<% 
//System.out.println("hiiiiiiiiiiiiiii");
    session.setAttribute("session_uprofile_pic",ft);
    response.sendRedirect("changeProfilePic.jsp");
    //out.println("<html><body>Uploding Complete!!!<a href='index.jsp'>next</a></body></html>");
%>