<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
            String msg = null;
            msg = (String) session.getAttribute("MSG");
            String pid = null;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/stylesheet.css"/>
        <script type="text/javascript" src="js/calander.js"></script>
        <title>Product Page</title>
        <script type="text/javascript">
            function fetchLevel_Str()
            {

                var xmlHttpRequest=init();
                function init()
                {
                    if (window.XMLHttpRequest){
                        return new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject){
                        return new ActiveXObject("Microsoft.XMLHTTP");
                    }
                }

                var sess = document.getElementById("cmbPID").value;

                //alert(sess);
                var d=new Date();
                var t=d.getTime();
                xmlHttpRequest.open("post", "showProduct?sess="+escape(sess)+"&timestamp="+t, true);
                xmlHttpRequest.onreadystatechange=processRequest;
                xmlHttpRequest.send(null);
                function processRequest()
                {

                    if(xmlHttpRequest.readyState==4)
                    {

                        if(xmlHttpRequest.status==200)
                        {

                            processResponse();
                        }
                    }
                }

                function processResponse()
                {

                    var xmlMessage=xmlHttpRequest.responseXML;
                    var res=xmlMessage.getElementsByTagName("valid")[0].firstChild.nodeValue;
                    //alert('Result: '+res)
                    var temp = new Array();
                    temp = res.split(":~");
                    document.getElementById('txtPName').value = temp[0];
                    document.getElementById('txtQuality').value = temp[1];
                    document.getElementById('txtQuantity').value = temp[2];
                    document.getElementById('txtPPrice').value = temp[3];
                    document.getElementById('MfgDate').value = temp[4];
                    document.getElementById('ExpDate').value = temp[5];
                    

                }
            }

        </script>
    </head>
    <body>
        <table style="border-style: outset" align="center" width="80%" class="formTable">
            <tr>
                <td colspan="4"  align="center">
                    <img src="Image/mallHeader.png" alt="" height="150px" width="100%">
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
                <td>
                    <a href="Customer.jsp">Customer</a>
                </td>
                <td>
                    <a href="Product.jsp">Product</a>
                </td>
                <td>
                    <a href="Purchase.jsp">Purchase</a>
                </td>
                <td>
                    <a href="Stock.jsp">Stock</a>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <fieldset>
                        <legend><strong>Product</strong></legend>
                        <table cellpadding="3" cellspacing="3" align="center" width="80%" class="formTable">
                            <tr>
                                <td class="candidate">
                                    Product ID :
                                </td>
                                <td> <select name="cmbPID" id="cmbPID" onchange="fetchLevel_Str()">
                                        <%
                                                    PreparedStatement pst = null;
                                                    Connection con = null;
                                                    ResultSet rst = null;
                                                    try {
                                                        con = connection.connect.makeConnection();
                                                        String query = "select distinct ProductId from Purchase";
                                                        pst = con.prepareStatement(query);
                                                        rst = pst.executeQuery();
                                                        while (rst.next()) {
                                                            pid = rst.getString(1);
                                        %>


                                        <option value="<%=pid%>"><%=pid%></option>


                                        <%
                                                        }
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                        %>
                                    </select>
                                </td>

                                <td class="candidate">
                                    Product Name :
                                </td>
                                <td>
                                    <input type="text" name="txtPName" id="txtPName"  size="33"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="candidate">
                                    Product Quality :
                                </td>
                                <td>
                                    <input type="text" name="txtQuality" id="txtQuality" size="33"/>
                                </td>
                                <td class="candidate">
                                    Product Quantity :
                                </td>
                                <td>
                                    <input type="text" name="txtQuantity" id="txtQuantity"  size="33"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="candidate">
                                    Product Price :
                                </td>
                                <td>
                                    <input type="text" name="txtPPrice" id="txtPPrice" size="33"/>
                                </td>
                                <td class="candidate">
                                    Manufacturing Date :
                                </td>
                                <td>
                                    <input type="text" name="MfgDate" id="MfgDate" size="33" readonly onclick="scwShow(this,event);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="candidate">
                                    Expiry Date :
                                </td>
                                <td>
                                    <input type="text" name="ExpDate" id="ExpDate"  size="33" readonly onclick="scwShow(this,event);"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" align="center">
                                    <input type="submit" name="btnSubmit" id="btnSubmit" value="View" id="Button"/>
                                    <input type="reset" name="btnReset" id="btnReset" value="Reset" id="Button"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>
    </body>
</html>

