<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
        <link type="text/css" rel="stylesheet" href="css/menu.css"/>
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
                }
            }

        </script>
    </head>
    <body>
        <form method="post" action="updateVendorProduct">
            <table  align="center" width="80%" class="formTable" height="700">
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

                        <table cellpadding="3" cellspacing="3" align="center" width="80%" class="formTable">

                            <%
                                        String pid = request.getParameter("ProductId");

                                        PreparedStatement pst = null;
                                        Connection con = null;
                                        ResultSet rst = null;

                                        String prodName = null;
                                        String sizeWeight = null;
                                        String price = null;
                                        String mfgDate = null;
                                        String expDate = null;
                                        String qty = null;


                                        try {
                                            con = connection.connect.makeConnection();
                                            String query = "select ProductName,SizeWeight,Price,MFGDate,Productqty from Product where ProductID='" + pid + "'";
                                            pst = con.prepareStatement(query);
                                            rst = pst.executeQuery();
                                            if (rst.next()) {

                                                prodName = rst.getString(1);
                                                sizeWeight = rst.getString(2);
                                                price = rst.getString(3);
                                                mfgDate = rst.getString(4);

                                                qty = rst.getString(5);

                            %>

                            <tr>
                                <td class="candidate">
                                    Product ID :
                                </td>
                                <td>
                                    <input type="text" name="txtPID" id="txtPID" size="33"readonly value="<%=pid%>"/>
                                </td>
                                <td class="candidate">
                                    Product Name :
                                </td>
                                <td>
                                    <input type="text" name="txtPName" id="txtPName" size="33" value="<%=prodName%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="candidate">
                                    Size :
                                </td>
                                <td>
                                    <input type="text" name="txtSizeWeight" id="txtSizeWeight" size="33" value="<%=sizeWeight%>"/>
                                </td>
                                <td class="candidate">
                                    Product Quantity :
                                </td>
                                <td>
                                    <input type="text" name="txtQuantity" id="txtQuantity" size="33" value="<%=qty%>"/>
                                </td>
                            </tr>
                            <tr>

                                <td class="candidate">
                                    Product Price :
                                </td>
                                <td>
                                    <input type="text" name="txtPPrice" id="txtPPrice" size="33" value="<%=price%>"/>
                                </td>
                                <td class="candidate">
                                    Manufacturing Date :
                                </td>
                                <td>
                                    <input type="text" name="MfgDate" id="MfgDate" size="33" readonly onclick="scwShow(this,event);" value="<%=mfgDate%>"/>
                                </td>
                            </tr>

                            <%                                                  }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                            %>
                            <tr>
                                <td colspan="4" align="center">
                                    <input type="submit" name="btnSubmit" id="btnSubmit" value="Update Product" id="Button"/>
                                    <input type="reset" name="btnReset" id="btnReset" value="Reset" id="Button"/>

                                </td>
                            </tr>
                        </table>


                    </td>
                </tr>
                <tr>
                    <td height="50" colspan="2" align="center" class="toplinls" width="100%">
                        <span class="whitefont">Online Mall Shopping</span>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
