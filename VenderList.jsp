<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
            String msg = null;
            msg = (String) session.getAttribute("MSG");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/stylesheet.css"/>
        <link type="text/css" rel="stylesheet" href="css/style-sheet.css"/>
        <link rel="stylesheet" href="css/menu.css" type="text/css"/>
        <title>Vender List</title>
    </head>
    <body>
        <table  align="center" width="90%" class="formTable" height ="700">
            <tr height="40px">
                <td>
                    <table width="100%">
                        <tr>
                            <td>
                                <%@include file="Adminheader_menu.html" %>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" width="100%" style="height:15px;" class="toplinls"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <%
                        if (msg != null) {
            %>
            <tr>
                <td style="font-family: verdana;color: red;font-size: 10px" align="center" colspan="8"><%=msg%></td>
            </tr>
            <%
                            session.removeAttribute("MSG");
                        } else {
                            session.setAttribute("MSG", "");
                        }
            %>
            <tr>

            </tr>
            <tr>
                <td valign="top" bgcolor="white">
                    <form action="deleteVendor" method="post">
                        <table width="100%">
                            <tr class="white-font">
                                <td  align="center">Select</td>
                                <td  align="center">Vender&nbsp;ID</td>
                                <td  align="center">Vender&nbsp;Name</td>
                                <td align="center">Vender&nbsp;Address</td>
                                <td  align="center">Mobile&nbsp;No</td>
                                <td  align="center">Email&nbsp;ID</td>
                                <td  align="center">Gender</td>
                                <td  align="center">Nature</td>
                                <td  align="center">Date</td>
                                <td  align="center">Update</td>

                            </tr>
                            <%
                                        PreparedStatement pst = null;
                                        Connection con = null;
                                        ResultSet rst = null;
                                        String vendId = null;
                                        String vendName = null;
                                        String address = null;
                                        String mobile = null;
                                        String emailId = null;
                                        String gender = null;
                                        String nature = null;
                                        String date = null;
                                        int i = 0;
                                        try {
                                            con = connection.connect.makeConnection();
                                            String query = "select VenderId,VenderName,Address,Mobile,EmailId,Gender,Nature,Date from Vender";
                                            pst = con.prepareStatement(query);
                                            rst = pst.executeQuery();
                                            while (rst.next()) {
                                                vendId = rst.getString(1);
                                                vendName = rst.getString(2);
                                                address = rst.getString(3);
                                                mobile = rst.getString(4);
                                                emailId = rst.getString(5);
                                                gender = rst.getString(6);
                                                nature = rst.getString(7);
                                                date = rst.getString(8);
                                                i++;
                            %>
                            <tr style="background: #dfc07d" style="font-size: 12px">
                                <td align="center">
                                    <input type="checkbox" name="chkEMPID" id="chkEMPID" value="<%=vendId%>"/>
                                    <input type="hidden" name="hidecount" id="hidecount" value="<%=i%>"/>
                                </td>
                                <td align="center" ><%=vendId%></td>
                                <td  align="center"><%=vendName%></td>
                                <td  align="center"><%=address%></td>
                                <td  align="center"><%=mobile%></td>
                                <td  align="center"><%=emailId%></td>
                                <td  align="center"><%=gender%></td>
                                <td  align="center"><%=nature%></td>
                                <td  align="center"><%=date%></td>
                                <td align="center"><a href="UpdateVender.jsp?vend_Id=<%=vendId%>">Update</a></td>
                            </tr>
                            <%
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                            %>
                            <tr>
                                <td align="right" colspan="10">
                                    <input type="submit" name="btnsubmit" id="btnsubmit" value="Delete" />
                                </td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
            <tr>
                <td height="50" colspan="2" align="center" class="toplinls" width="100%">
                    <span class="whitefont">Online Mall Shopping</span>
                </td>
            </tr>
        </table>
    </body>
</html>

