<%-- 
    Document   : index
    Created on : May 4, 2018, 12:31:37 AM
    Author     : VIERY
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="con">
            <h3 align="center">Aplikasi Crud JSP dan MySQL</h3>
            <a href="tambah.jsp">Tambah</a>
            <p></p>
            <%
            try {
                String Host = "jdbc:mysql://localhost/basisdata";
                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(Host, "root", "");
                statement = connection.createStatement();
                String Data = "select * from biodata";
                rs = statement.executeQuery(Data);
            %>
            <table border="1" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <th>Kode</th>
                    <th>Nama</th>
                    <th>Kelamin</th>
                    <th>Alamat</th>
                    <th>Ortu</th>
                    <th>Aksi</th>
                </tr>
                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("kode")%></td>
                    <td><%=rs.getString("nama")%></td>
                    <td><%=rs.getString("kelamin")%></td>
                    <td><%=rs.getString("alamat")%></td>
                    <td><%=rs.getString("ortu")%></td>
                    <td><a href="update.jsp?u=<%=rs.getString("kode")%>" >edit</a> / <a href="delete.jsp?d=<%=rs.getString("kode")%>" > hapus</a></td>
                </tr>
                <%   }    %>
            </table>
            <%
                rs.close();
                statement.close();
                connection.close();
            } catch (Exception ex) {
                out.println("Can't connect to database.");
            }
            %>
        </div>
    </body>
</html>

