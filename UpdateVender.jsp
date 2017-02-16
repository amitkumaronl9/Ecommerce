<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/stylesheet.css"/>
        <link type="text/css" rel="stylesheet" href="css/style-sheet.css"/>
        <link rel="stylesheet" href="css/menu.css" type="text/css"/>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/calander.js"></script>
        <title>Vender Page</title>
    </head>
    <body>
        <table  align="center" width="80%" class="formTable" height="700">
            <tr  height="40px">
                <td colspan="4">
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
            <tr>
                <td colspan="4" valign="top">
                    <form method="post" action="updateVender">
                        <table cellpadding="3" cellspacing="3" align="center" width="80%" class="formTable">
                            <%
                                        String vendId = request.getParameter("vend_Id");
                                        PreparedStatement pst = null;
                                        Connection con = null;
                                        ResultSet rst = null;

                                        String vendName = null;
                                        String address = null;
                                        String mobile = null;
                                        String emailId = null;
                                        String gender = null;
                                        String nature = null;
                                        String date = null;
                                        try {
                                            con = connection.connect.makeConnection();
                                            String query = "select VenderId,VenderName,Address,Mobile,EmailId,Gender,Nature,Date from Vender where VenderId='" + vendId + "'";
                                            pst = con.prepareStatement(query);
                                            rst = pst.executeQuery();
                                            if (rst.next()) {
                                                vendId = rst.getString(1);
                                                vendName = rst.getString(2);
                                                address = rst.getString(3);
                                                mobile = rst.getString(4);
                                                emailId = rst.getString(5);
                                                gender = rst.getString(6);
                                                nature = rst.getString(7);
                                                date = rst.getString(8);
                            %>
                            <tr>
                                <td class="candidate">
                                    Vendor ID :
                                </td>
                                <td>
                                    <input type="text" name="txtcid" id="txtcid" size="33" value="<%=vendId%>" readonly/>
                                </td>
                                <td class="candidate">
                                    Vendor Name :
                                </td>
                                <td>
                                    <input type="text" name="txtCName" id="txtCName" size="33" value="<%=vendName%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="candidate">
                                    Vendor Address :
                                </td>
                                <td>
                                    <textarea cols="25" rows="3" name="txtQuality" id="txtQuality" ><%=address%></textarea>
                                </td>
                                <td class="candidate">
                                    Mobile No :
                                </td>
                                <td>
                                    <input type="text" name="txtMobile" id="txtMobile" size="33" value="<%=mobile%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="candidate">
                                    Email ID :
                                </td>
                                <td>
                                    <input type="text" name="txtEmail" id="txtEmail" size="33" value="<%=emailId%>"/>
                                </td>
                                <td class="candidate">
                                    Gender :
                                </td>
                                <td>
                                    <input type="text" name="GenderRadio" id="GenderRadio"  size="33" value="<%=gender%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="candidate">
                                    Nature :
                                </td>
                                <td>
                                    <input type="text" name="txtNat" id="txtNat" size="33" value="<%=nature%>" />
                                </td>
                                <td class="candidate">
                                    Date :
                                </td>
                                <td>
                                    <input type="text" name="txtDate" id="txtDate" size="33" readonly onclick="scwShow(this,event);" value="<%=date%>"/>
                                </td>
                            </tr>
                            <%
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                            %>
                            <tr>
                                <td colspan="4" align="center">
                                    <input type="submit" name="btnSubmit" id="btnSubmit" value="Update" id="Button"/>
                                    <input type="reset" name="btnReset" id="btnReset" value="Reset" id="Button"/>
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

