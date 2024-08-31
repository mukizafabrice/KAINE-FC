<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%
 
        String ot_id = request.getParameter("ot_id");


        try {
           
            pst = con.prepareStatement("DELETE FROM donations WHERE  ot_id = ?");

            pst.setString(1, ot_id);
         
            pst.executeUpdate();

            %>
            <script>
                alert("deleted success");
                 window.location.href="manger_view_donations.jsp";
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

