<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style-sheet.css" type="text/css"/>
        <link type="text/css" rel="stylesheet" href="css/stylesheet.css"/>
        <title>JSP Page</title>
        <script type="text/javascript">
            function validatesize() {
                if (document.getElementById("cmbSize").value == "-1") {
                    alert("Select Size !");
                    return false;
                }
            }

            function validateqty() {
                if (document.getElementById("txtQty").value == "") {
                    alert("Enter quantity of pruduct !");

                    return false;
                }
                var a = document.getElementById('txtQty1').value;
                var b = document.getElementById('txtQty').value;
                if (a > b) {

                    return true;
                }
                else
                    alert('Please Enter the same or less Quantity');
                return false;

            }
        </script>
    </head>
    <%
        String msg = null;
        msg = (String) session.getAttribute("MSG");
        String userid = (String) session.getAttribute("user");
        String selsId = connection.Auto_Gen_ID.globalGenId("SEL-", "sales");
    %>
    <body>
        <table width="80%" align="center" bgcolor="white">
            <tr>
                <td colspan="2" height="40px;">
                    <%@include file="header_menuUser.html" %>
                </td>
            </tr>
            <tr>
                <td colspan="2" width="100%" style="height:15px;" class="toplinls"></td>
            </tr>
            <tr>
                <td width="80%">
                    <form method="post" action="purchaseUser">
                        <table width="100%">
                            <%
                                String product = request.getParameter("ProductID");
                                //product = request.getParameter("ProductID");
                                PreparedStatement pst = null;
                                Connection con = null;
                                ResultSet rst = null;
                                String category = null;
                                String sizeWeight = null;
                                String price = null;
                                String mfgDate = null;
                                String image = null;
                                String qty = null;
                                int i = 0;
                                String proid = null;
                               String output;
                                try {
                                    con = connection.connect.makeConnection();
                                    String query = "select ProductID,Category,SizeWeight,Price,MFGDate,ProductImage,Productqty from Product where ProductName='" + product + "'";
                                    pst = con.prepareStatement(query);
                                    rst = pst.executeQuery();
                                    if (rst.next()) {
                                        i++;
                                        proid = rst.getString(1);
                                        category = rst.getString(2);
                                        sizeWeight = rst.getString(3);
                                        price = rst.getString(4);
                                        mfgDate = rst.getString(5);
                                        image = rst.getString(6);
                                        qty = rst.getString(7);
                                         
                            %>
                            <tr>
                                <td>
                                    <table height="250" width="500px">
                                        <tr>
                                            <td>
                                                <input type="button" name="CombinnationBtn" id="CombinnationBtn" value="Possible Combination" onclick="window.location.href = 'CombinationList.jsp?txtProductID=<%=proid%>'"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="hidden" name="txtSalesID" id="txtSalesID" value="<%=selsId%>"/>
                                                <input type="hidden" name="txtUserID" id="txtUserID" value="<%=userid%>"/>
                                                <input type="hidden" name="txtID" id="txtID" value="<%=proid%>"/>
                                                <input type="hidden" name="txtCategory" id="txtCategory" value="<%=category%>"/>
                                                <input type="hidden" name="txtPrice" id="txtPrice" value="<%=price%>"/>
                                                <input type="hidden" name="txtImage" id="txtImage" value="<%=image%>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center"  class="price">Rs  :<%=price%></td>
                                            <td>
                                                Size :<select name="cmbSize" id="cmbSize" onblur="validatesize()">
                                                    <option value="-1">--Select--</option>
                                                    <option value="<%=sizeWeight%>"><%=sizeWeight%></option>
                                                </select>
                                            </td>
                                        <tr>
                                            <td align="right">Available Qty :</td><td><input type="text" name="txtQty1" readonly id="txtQty1" value="<%=qty%>"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Purchase Quantity :</td><td><input type="text" name="txtQty" id="txtQty" onblur="validateqty()"/></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table width="300px">
                                                    <tr>
                                                        <td>
                                                            <img width="150px" height="100px" src="UploadedImage/<%=image%>" alt=""/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="200px">
                                                    <tr>
                                                        <td colspan="2" align="center">
                                                            <input type="submit" name="btnsubmit" id="btnsubmit" value="Purchase Now" onclick="window.location.href = 'ShoppingCart.jsp'" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="center">
                                                            <strong style="color: red;">Product Information</strong>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Category :</td><td><%=category%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Size :</td><td><%=sizeWeight%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Price :</td><td><%=price%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>MFG Date :</td><td><%=mfgDate%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Available Quantity:</td><td><%=qty%></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <%
                                                  output = DB.Connect.analyzeVideo(proid);

                                            int positive = DB.Connect.getPositive();
                                            int negative = DB.Connect.getNegative();
                                            int neutral = DB.Connect.getNeutral();
                                           
                                            if ((positive + negative + neutral) > 0) {
                                                out.print("<td>");
                                                out.println("<script type='text/javascript' src='css/jsapi.js'>"
                                                        + "</script> <script type='text/javascript'>"
                                                        + "google.load('visualization', '1.0', {'packages':['corechart']});"
                                                        + " google.setOnLoadCallback(drawChart); function drawChart() "
                                                        + "{ var data = new google.visualization.DataTable(); data.addColumn('string', 'Topping');"
                                                        + "  data.addColumn('number', 'Tweets');  data.addRows([ ['Positive'," + positive + "],['Negative', " + negative + "],['Neutral', " + neutral + "]  ]);"
                                                        + "  var options = {'title':'Graph', 'width':450,'height':300,'radius':20};"
                                                        + " var chart = new google.visualization.PieChart(document.getElementById('chart_div'));"
                                                        + "chart.draw(data, options);}</script><div id='chart_div'></div>");

                                                out.print("</td>");
                                            }
                                                %>
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
                                    </table>
                                </td>
                            </tr>
                            <tr>

                                <%                                                if (session.getAttribute("Message").equals(null)) {
                                        session.setAttribute("Message", "");
                                    } else {
                                        out.print("<p style='color:red'>" + session.getAttribute("Message") + "</p>");
                                        session.setAttribute("Message", "");
                                    }
                                    ;%> 


                           </tr>
                            <%              
                                  
                          
                                    
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                            <td width="20%">
                                <%
                                    String query1 = "select userlogin.fullname,comment,tblcomment.rdate,rating  from userlogin,tblcomment where tblcomment.cid='" + proid + "' and userlogin.UserName=tblcomment.UserName";
                                    System.out.print(query1);
                                    double rating = 0;
                                    PreparedStatement pst1;
                                    pst1 = con.prepareStatement(query1);

                                    ResultSet rs = pst1.executeQuery();
                                    int count1 = 0;
                                    while (rs.next()) {
                                        if (count1 == 0 && rs.getString("fullname") != null) {
                                            out.println("<table border='1' align='center'><th>Name</th><th>Comment</th><th>Commented on</th>");

                                        }
                                        if (rs.getString("fullname") != null) {
                                            out.println("<tr>");
                                            out.println("<td>" + rs.getString("fullname") + "</td></td>");
                                            out.println("<td>" + rs.getString("comment") + "</td>");
                                            out.println("<td>" + rs.getString("rdate") + "</td>");
                                            out.print("</tr>");
                                            rating = rating + rs.getDouble("rating");
                                        }

                                        count1++;
                                    }
                                    System.out.print("total rating " + rating);
                                    if (rating > 5.0) {
                                        rating = (rating / count1);
                                    }
                                    System.out.print("total rating " + rating);
                                    if (count1 > 0) {
                                        out.println("<table>");
                                    }
                                    rs.close();


                                %>
                            </td>
                             
                            <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
                            <link rel="stylesheet" href="ajax/stylesheet.css">

        <table class="">
                                <tr>
                                    <td>
                                        <p>Current rating: <%=rating%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <center>  <center><div class="stars">
                                                    <%
                                                        if (rating == 5) {
                                                            out.println("<input class='star star-5' id='star-5' type='radio' name='star' value='5' checked='true' /> <label class='star star-5' for='star-5'></label>");
                                                            out.println("<input class='star star-4' id='star-4' type='radio' name='star' value='4'  /> <label class='star star-4' for='star-4'></label>");
                                                            out.println("<input class='star star-3' id='star-3' type='radio' name='star' value='3'  /> <label class='star star-3' for='star-3'></label>");
                                                            out.println("<input class='star star-2' id='star-2' type='radio' name='star' value='2'  /> <label class='star star-2' for='star-2'></label>");
                                                            out.println("<input class='star star-1' id='star-1' type='radio' name='star' value='1' /> <label class='star star-1' for='star-1'></label>");

                                                        } else if (rating == 4) {
                                                            out.println("<input class='star star-5' id='star-5' type='radio' name='star' value='5' /> <label class='star star-5' for='star-5'></label>");
                                                            out.println("<input class='star star-4' id='star-4' type='radio' name='star' value='4' checked='true' /> <label class='star star-4' for='star-4'></label>");
                                                            out.println("<input class='star star-3' id='star-3' type='radio' name='star' value='3'  /> <label class='star star-3' for='star-3'></label>");
                                                            out.println("<input class='star star-2' id='star-2' type='radio' name='star' value='2'  /> <label class='star star-2' for='star-2'></label>");
                                                            out.println("<input class='star star-1' id='star-1' type='radio' name='star' value='1' /> <label class='star star-1' for='star-1'></label>");

                                                        } else if (rating == 3) {
                                                            out.println("<input class='star star-5' id='star-5' type='radio' name='star' value='5' /> <label class='star star-5' for='star-5'></label>");
                                                            out.println("<input class='star star-4' id='star-4' type='radio' name='star' value='4'  /> <label class='star star-4' for='star-4'></label>");
                                                            out.println("<input class='star star-3' id='star-3' type='radio' name='star' value='3' checked='true' /> <label class='star star-3' for='star-3'></label>");
                                                            out.println("<input class='star star-2' id='star-2' type='radio' name='star' value='2'  /> <label class='star star-2' for='star-2'></label>");
                                                            out.println("<input class='star star-1' id='star-1' type='radio' name='star' value='1' /> <label class='star star-1' for='star-1'></label>");

                                                        } else if (rating == 2) {
                                                            out.println("<input class='star star-5' id='star-5' type='radio' name='star' value='5'  /> <label class='star star-5' for='star-5'></label>");
                                                            out.println("<input class='star star-4' id='star-4' type='radio' name='star' value='4'  /> <label class='star star-4' for='star-4'></label>");
                                                            out.println("<input class='star star-3' id='star-3' type='radio' name='star' value='3'  /> <label class='star star-3' for='star-3'></label>");
                                                            out.println("<input class='star star-2' id='star-2' type='radio' name='star' value='2' checked='true' /> <label class='star star-2' for='star-2'></label>");
                                                            out.println("<input class='star star-1' id='star-1' type='radio' name='star' value='1' /> <label class='star star-1' for='star-1'></label>");

                                                        } else if (rating == 1) {
                                                            out.println("<input class='star star-5' id='star-5' type='radio' name='star' value='5'  /> <label class='star star-5' for='star-5'></label>");
                                                            out.println("<input class='star star-4' id='star-4' type='radio' name='star' value='4'  /> <label class='star star-4' for='star-4'></label>");
                                                            out.println("<input class='star star-3' id='star-3' type='radio' name='star' value='3'  /> <label class='star star-3' for='star-3'></label>");
                                                            out.println("<input class='star star-2' id='star-2' type='radio' name='star' value='2'  /> <label class='star star-2' for='star-2'></label>");
                                                            out.println("<input class='star star-1' id='star-1' type='radio' name='star' value='1' checked='true'/> <label class='star star-1' for='star-1'></label>");

                                                        } else {
                                                            out.println("<input class='star star-5' id='star-5' type='radio' name='star' value='5'  /> <label class='star star-5' for='star-5'></label>");
                                                            out.println("<input class='star star-4' id='star-4' type='radio' name='star' value='4'  /> <label class='star star-4' for='star-4'></label>");
                                                            out.println("<input class='star star-3' id='star-3' type='radio' name='star' value='3'  /> <label class='star star-3' for='star-3'></label>");
                                                            out.println("<input class='star star-2' id='star-2' type='radio' name='star' value='2'  /> <label class='star star-2' for='star-2'></label>");
                                                            out.println("<input class='star star-1' id='star-1' type='radio' name='star' value='1' /> <label class='star star-1' for='star-1'></label>");

                                                        }

                                                    %>



                                                </div>
                                                </td>
                                                </tr>
                                                </table> 




                                                </form>
                                                </td>
                                                </tr>
                                                <tr>
                                                    <td height="50" colspan="2" align="center" class="toplinls" width="100%">
                                                        <span class="whitefont">Online Shopping</span>
                                                    </td>
                                                </tr>
                                                </table>
                                                </body>
                                                </html>





















