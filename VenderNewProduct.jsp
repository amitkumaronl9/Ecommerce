<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/stylesheet.css"/>
        <link type="text/css" rel="stylesheet" href="css/style-sheet.css"/>
        <link type="text/css" rel="stylesheet" href="css/menu.css"/>
        <script type="text/javascript" src="js/calander.js"></script>
        <script type="text/javascript" src="js/VenderNawProduct.js"></script>
        <title>Vender Product Page</title>
    </head>   

    <%
                String msg = null;
                msg = (String) session.getAttribute("MSG");
                String productId = connection.Auto_Gen_ID.globalGenId("P-", "product");
    %>
    <body>
        <table  width="80%" align="center"  bgcolor="white">
            <tr  height="40px">
                <td>
                    <table width="100%">                       
                        <tr>
                            <td>
                                <%@include file="Venderheader_menu.html" %>
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
                <td style="font-family: verdana;color: red;font-size: 10px" align="center"><%=msg%></td>
            </tr>
            <%
                            session.removeAttribute("MSG");
                        } else {
                            session.setAttribute("MSG", "");
                        }
            %>

            <tr>
                <td valign="top">
                    <form method="post" action="venderNewProduct" enctype="multipart/form-data">

                        <table cellpadding="3" cellspacing="3" align="center" width="80%" class="formTable" >
                            <tr>
                                <td class="candidate">
                                    Product ID :
                                </td>
                                <td>
                                    <input type="text" name="txtPID" id="txtPID" size="33"readonly value="<%=productId%>" />
                                </td>
                                <td class="candidate">
                                    Product Name :
                                </td>
                                <td>
                                    <input type="text" name="txtPName" id="txtPName" size="33"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="candidate">
                                    Product :
                                </td>
                                <td>
                                    <input type="file" name="FileImage" id="FileImage" size="33" />
                                </td>
                                <td class="candidate">
                                    Category :
                                </td>
                                <td>
                                    <select name="cmbCategory" id="cmbCategory" class="comboCate">
                                        <option value="-1"> - -  - - Select - - - -</option>
                                        <option value="Cloths">Computer</option>
                                        <option value="Shoes">Mobile</option>
                                        <option value="Bags">Bike</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td class="candidate" width="19%">Size</td>
                                <td>
                                    <input type="text" id="textSizeWeight" name="textSizeWeight" size="33"/>
                                </td>
                                <td class="candidate" width="19%">Manufacturing&nbsp;Date</td>
                                <td>
                                    <input type="text" id="textMFGDate" name="textMFGDate"  readonly onclick="scwShow(this,event);" size="33"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="candidate" width="19%">Price</td>
                                <td>
                                    <input type="text" id="textPrice" name="textPrice" size="33"/>
                                </td>
                                <td class="candidate" width="19%">Quantity</td>
                                <td>
                                    <input type="text" id="textQuantity" name="textQuantity" size="33"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" align="center" >
                                    <input type="submit" name="btnSubmit" id="btnSubmit" value="Upload" id="Button" onclick="return validateVenderNewProduct()"/>
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
