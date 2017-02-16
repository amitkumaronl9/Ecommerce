<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/menu.css" type="text/css"/>
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css"/>
        <link rel="stylesheet" href="css/style-sheet.css" type="text/css"/>
        <title>Product</title>
    </head>

    <body>
        <table  align="center" width="80%" class="formTable">
            <tr  height="40px">
                <td>
                    <table width="100%">
                        <tr>
                            <td>
                                <%@include file="Adminheader_menu.html" %>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" width="83%" style="height:15px;" class="toplinls"></td>
            </tr>
            <tr>
                <td colspan="4" valign="top">
                    <form method="post" action="deletePurchase">
                        <table cellpadding="3" cellspacing="3" align="center" width="83%" class="formTable">
                            <%
                                        String msg = null;
                                        msg = (String) session.getAttribute("MSG");
                                        if (msg != null) {
                            %>
                            <tr>
                                <td style="font-family: verdana;color: #9999ff;font-size: 14px" align="center" colspan="2"><%=msg%></td>
                            </tr>
                            <%
                                            session.removeAttribute("MSG");
                                        } else {
                                            session.setAttribute("MSG", "");
                                        }
                            %>
                            <tr>
                                <td colspan="4">
                                    <table width="83%">
                                        <tr class="white-font">
                                            <td align="center"  width="14%">Product ID</td>
                                            <td align="center"  width="14%"> User ID</td>
                                            <td align="center" width="14%">Category</td>
                                            <td align="center"  width="14%">Price</td>
                                            <td align="center"  width="14%">Quantity</td>
                                            <td align="center"  width="14%">Total Amount</td>
                                            <td align="center"  width="14%">Delete</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div style="height: 350px;width: 83%;overflow: auto;border-style: none" class="grid">
                                        <table width="100%">
                                            <%
                                                        PreparedStatement pst = null;
                                                        Connection con = null;
                                                        ResultSet rst = null;
                                                        String ProductId = null;
                                                        String UserId = null;
                                                        String Category = null;
                                                        String Price = null;
                                                        String Quantity = null;
                                                        String TotalAmount = null;
                                                        int i = 0;
                                                        try {
                                                            con = connection.connect.makeConnection();
                                                            String query = "select ProductId,UserId,Category,Price,Quantity,TotalAmount from userpurchase";
                                                            pst = con.prepareStatement(query);
                                                            rst = pst.executeQuery();
                                                            while (rst.next()) {
                                                                ProductId = rst.getString(1);
                                                                UserId = rst.getString(2);
                                                                Category = rst.getString(3);
                                                                Price = rst.getString(4);
                                                                Quantity = rst.getString(5);
                                                                TotalAmount = rst.getString(6);
                                                                i++;
                                            %>
                                            <tr bgcolor="wheat">
                                                <td align="center" width="14%"><%=ProductId%></td>
                                                <td align="center" width="14%"><%=UserId%></td>
                                                <td align="center" width="14%"><%=Category%></td>
                                                <td align="center" width="14%"><%=Price%></td>
                                                <td align="center" width="14%"><%=Quantity%></td>
                                                <td align="center" width="14%"><%=TotalAmount%></td>
                                                <td align="center" width="14%">
                                                    <input type="checkbox" name="chkEMPID" id="chkEMPID" value="<%=ProductId%>"/>
                                                    <input type="hidden" name="hidecount" id="hidecount" value="<%=i%>"/>
                                                </td>

                                            </tr>
                                            <%
                                                            }
                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        }
                                            %>
                                            <tr>
                                                <td align="right" colspan="7" >
                                                    <input type="submit" name="btnsubmit" id="btnsubmit" value="Delete" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
            <tr>
                <td height="50" colspan="2" align="center" class="toplinls" width="83%">
                    <span class="whitefont">Online Shopping</span>
                </td>
            </tr>
        </table>
    </body>
</html>
