<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style-sheet.css" type="text/css"/>
        <link type="text/css" rel="stylesheet" href="css/stylesheet.css"/>
        <title>Online Shopping</title>
    </head>
    <body>
        <table width="80%" bgcolor="White" align="center">
            <tr>
                <td colspan="2" height="40px;">
                    <%@include file="header_menu.html" %>
                </td>
            </tr>
            <tr>
                <td colspan="2" width="100%" style="height:15px;" class="toplinls"></td>
            </tr>
            <tr>
                <td width="65%" valign="top">
                    <table>
                        <tr><td>&nbsp;</td></tr>
                        <tr>
                            <td align="justify" class="text">
                                Customer care 24*7
                                18007258659
                                
                                Email us:-Support@Onlineshopping
                                
                                Address:-E-115,Beta1,Gautam Budh nagar,
                                         Greater Noida,UP,201310.
                                         
                            </td>
                        </tr>
                      
                    </table>
                </td>
                <td width="35%" align="right" valign="top">
                    <table>
                        <tr>
                            <td bgcolor="white" valign="top">
                                <form method="post" action="userLogin">
                                    <table cellpadding="3" cellspacing="3" align="center" width="100%" >
                                        <tr>
                                            <td colspan="2" class="white-font" align="center">
                                                Login
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="bottom"  id="label">
                                                Login Name :
                                            </td>
                                            <td valign="bottom" height="40px">
                                                <input type="text" name="txtname" id="txtname" size="25"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  valign="bottom"  id="label">
                                                Password :
                                            </td>
                                            <td valign="bottom">
                                                <input type="password" name="txtpwd" id="txtpwd" size="25"/>
                                            </td>
                                        </tr>                                       
                                        <tr>
                                            <td colspan="2" align="right"  valign="bottom">
                                                <input type="submit" value="Login" onclick="return validate()"/>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">
                                                <img src="Image/head.jpg" width="270px" height="100px" alt=""/>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </td>
                        </tr>
                    </table>
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
