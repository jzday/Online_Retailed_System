<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>REG</title>
<style type="text/css">
.right {text-align: right;
}
</style>
</head>

<body>
 <%@ page language="java" %>
        <table width="993" height="102" border="0">
          <tr>
            <td width="251" height="96"><img src="head.png" width="251" height="88" alt="Logo" /></td>
            <td width="726" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> | <a href="index.jsp">Home</a> |
            
          </tr>
        </table>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
       
<%
 
		String product = request.getParameter ("Prod_name");
		String quantity = request.getParameter ("quantity");
		String cart = (String) session.getAttribute("userid"); 
        PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl", "jdai11","dai2995062");
      if (conn != null) {
             out.println("");
            }
			else{
				out.println("Error in connection");
			}
      
         Statement st=conn.createStatement();
            ps= conn.prepareStatement("insert into cart values (?,?,?)");
            ps.setString(1,cart);
            ps.setString(2,product);
            ps.setString(3,quantity);
               int insertResult = ps.executeUpdate();
             if (insertResult!=0)
            {
                 out.println("Successfully Added");
            } 
			else
		    {
				out.println("Can't be added");
			}
           ps.close (); 
		   conn.close ();
			
        %>
        <br><hr>
		      Hello <%= product %> is added to <%= cart %>
               To View Products <a href="buy.jsp">Click Here</a>
                <hr>
</body>
</html>