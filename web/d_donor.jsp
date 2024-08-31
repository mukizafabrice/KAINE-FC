<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%
 
        String d_id = request.getParameter("d_id");


        try {
           
            pst = con.prepareStatement("DELETE FROM donors WHERE  d_id = ?");

            pst.setString(1, d_id);
         
            pst.executeUpdate();

            %>
            <script>
                alert("Donation deleted...");
                window.location.href="view_donor.jsp";
            </script>
            <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
 
%>


