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
        <link type="text/css" rel="stylesheet" href="css/menu.css"/>
        <link rel="stylesheet" href="css/style-sheet.css" type="text/css"/>
        <script type="text/javascript" src="js/calander.js"></script>
        <script type="text/javascript" src="js/AdminNewProduct.js"></script>
        <title>Product Page</title>
    </head>
    <%
                String msg = null;
                msg = (String) session.getAttribute("MSG");
                String productId = connection.Auto_Gen_ID.globalGenId("P-", "product");
    %>
    <body>
        <table width="80%" align="center"  bgcolor="white">
            <tr>
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
                    <form method="post" action="newProduct" enctype="multipart/form-data">

                        <table cellpadding="3" cellspacing="3" align="center" width="83%" class="formTable" height="250px">
                            <tr>
                                <td class="candidate">
                                    Product&nbsp;ID&nbsp;:
                                </td>
                                <td>
                                    <input type="text" name="txtPID" id="txtPID" size="33"readonly value="<%=productId%>" />
                                </td>
                                <td class="candidate">
                                    Product&nbsp;Name&nbsp;:
                                </td>
                                <td>
                                    <input type="text" name="txtPName" id="txtPName" size="33"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="candidate">
                                    Product&nbsp;:
                                </td>
                                <td>
                                    <input type="file" name="FileImage" id="FileImage" size="33" />
                                </td>
                                <td class="candidate">
                                    Category&nbsp;:
                                </td>
                                <td>
                                    <select name="cmbCategory" id="cmbCategory" class="comboCate">
                                        <option value="-1"> - - - - Select - - - -</option>
                                        <option value="Cloths">Cloths</option>
                                        <option value="Bags">Bags</option>
                                        <option value="Electronics">Electronics</option>
                                         <option value="Mobile">Mobile</option>
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
                                <td class="candidate" width="19%">Color:</td>
                                <td>
                                    <input type="text" id="txtcolor" name="txtcolor" size="33"/>
                                </td>
                                <td class="candidate" width="19%">Model No.</td>
                                <td>
                                    <input type="text" id="txtmodel" name="txtmodel" size="33"/>
                                </td>
                            </tr>
                                                        <tr>
                                <td class="candidate" width="19%">Discription</td>
                                <td>
                                    <input type="text" id="txtdis" name="txtdis" size="33"/>
                                </td>
                                <td class="candidate" width="19%">Warrenty</td>
                                <td>
                                    <input type="text" id="txtwaight" name="txtwaight" size="33"/>
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
                                <td class="candidate" width="19%">Video</td>
                             <td>
                                    <input type="file" name="FileImage1" id="FileImage1" size="33" />
                                </td>

                            </tr>


                            <tr>
                                <td colspan="4" align="center" >
                                    <input type="submit" name="btnSubmit" id="btnSubmit" value="Upload" id="Button" onclick="return validateAdminNewProduct()"/>
                                    <input type="reset" name="btnReset" id="btnReset" value="Reset" id="Button"/>
                                </td>
                            </tr>
                          
                        </table>
                    </form>
                </td>
            </tr>
            
          
        </table>
    </body>
</html>
