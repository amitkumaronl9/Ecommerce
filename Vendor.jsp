<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
            String msg = null;
            msg = (String) session.getAttribute("MSG");
            String custId = connection.Auto_Gen_ID.globalGenId("VNDR-", "vender");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/style-sheet.css"/>
        <link type="text/css" rel="stylesheet" href="css/stylesheet.css"/>
        <link rel="stylesheet" href="css/menu.css" type="text/css"/>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/calander.js"></script>
        <script type="text/javascript" src="js/Vender.js"></script>
        <title>Vender Page</title>
    </head>
    <body>
        <table  width="80%" align="center"  bgcolor="white">
            <tr  height="40px">
                <td colspan="4">
                    <table width="100%">
                        <tr>
                            <td colspan="4">
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
                <td colspan="4" valign="top">
                    <form method="post" action="vendor">
                        <table cellpadding="3" cellspacing="3" align="center" width="80%" class="formTable">
                            <tr>
                                <td class="candidate">
                                    Vendor ID :
                                </td>
                                <td>
                                    <input type="text" name="txtcid" id="txtcid" size="33" value="<%=custId%>" readonly/>
                                </td>
                                <td class="candidate">
                                    Vendor Name :
                                </td>
                                <td>
                                    <input type="text" name="txtCName" id="txtCName" size="33"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="candidate">
                                    Vendor Address :
                                </td>
                                <td>
                                    <textarea cols="25" rows="3" name="txtQuality" id="txtQuality" ></textarea>
                                </td>
                                <td class="candidate">
                                    Password :<br>
                                    &nbsp;&nbsp;&nbsp;<br>
                                    Mobile No :                                                              
                                </td>
                                <td>
                                    <input type="password" name="txtPWD" id="txtPWD" size="33"/><br>
                                    &nbsp;&nbsp;&nbsp;<br>
                                    <input type="text" name="txtMobile" id="txtMobile" size="33"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="candidate">
                                    Email ID :
                                </td>
                                <td>
                                    <input type="text" name="txtEmail" id="txtEmail" size="33"/>
                                </td>
                                <td class="candidate">
                                    Gender :
                                </td>
                                <td id="label">
                                    <input type="radio" name="GenderRadio" id="GenderRadio"  value="Male"/>Male
                                    <input type="radio" name="GenderRadio" id="GenderRadio" value="Female"/>Female
                                </td>
                            </tr>
                            <tr>
                                <td class="candidate">
                                    Nature :
                                </td>
                                <td>
                                    <input type="text" name="txtNat" id="txtNat" size="33" />
                                </td>
                                <td class="candidate">
                                    Date :
                                </td>
                                <td>
                                    <input type="text" name="txtDate" id="txtDate" size="33" readonly onclick="scwShow(this,event);"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" align="center">
                                    <input type="submit" name="btnSubmit" id="btnSubmit" value="Submit" id="Button" onclick="return validateVender()"/>
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

