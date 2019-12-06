import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/AddProductServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();	
	try{
	        String appPath = request.getServletContext().getRealPath("/");

		Class.forName("org.postgresql.Driver");
		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/water","postgres","");

		String proddesc = request.getParameter("proddesc");
		float rate = Float.parseFloat(request.getParameter("rate"));
		int qty = Integer.parseInt(request.getParameter("qty"));

		PreparedStatement ps = con.prepareStatement(
			"insert into product(pname,price,qty_in_hand) values(?,?,?)");

		ps.setString(1,proddesc);
		ps.setFloat(2,rate);
		ps.setInt(3,qty);
		ps.executeUpdate();

		Statement s = con.createStatement();
		ResultSet rs = s.executeQuery("select currval('product_pid_seq')");
		rs.next();
		int pid = rs.getInt(1);

	        for (Part part : request.getParts()) {
	            String fileName = extractFileName(part);

		    if(!fileName.equals(""))
		    {
                    	part.write(appPath + "images/"+pid+".jpg");
		    }
	        }

		
		response.sendRedirect("add_products.jsp");
	}
	catch(Exception e){
		out.println("<h4>"+e+"</h4>");
	}	
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}
