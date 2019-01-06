<%@ page import="javax.servlet.http.*,com.student.stuman.model.*" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Home page</title>
        <link rel="shortcut icon" href="/images/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link href="/stylesheet/home.css" rel="stylesheet">
    </head>

    <body>
        <% User owner = (User)request.getAttribute("owner"); %>
            <%
        	String str = owner.getDateOfBirth();
        	String year = str.substring(0, 4);
        	String month = str.substring(5, 7);
        	String date = str.substring(8, 10);
        %>
                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                              <span class="icon-bar"></span>
                              <span class="icon-bar"></span>
                              <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="">STUMAN</a>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav">
                                <li class="active">
                                    <a href="${pageContext.request.contextPath}/student/home">
                                        <span class="glyphicon glyphicon-home"></span>
                                         Home
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/student/showStudentFormToAdd">
                                        <span class="fa fa-user-plus"></span>
                                         Add Student
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/student/showStudentFilterView">
                                    <span class="glyphicon glyphicon-filter"></span>
                                    Filter Student
                                	</a>
                                </li>
                                <li>
                                <a href="${pageContext.request.contextPath}/student/export">
                                    <span class="glyphicon glyphicon-share"></span>
                                    Report
                                </a>
                            </li>
                               <li>
                                <a href="${pageContext.request.contextPath}/student/showStudentTableView">
                                    <span class="glyphicon glyphicon-list-alt"></span>
                                    View Student
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/student/exportWord">
                                    <span class="fa fa-file-word-o"></span>
                                    Word Report
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/student/exportExcel">
                                    <span class="fa fa-file-excel-o"></span>
                                    Excel Report
                                </a>
                            </li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="${pageContext.request.contextPath}/student/home">
                                        <span class="glyphicon glyphicon-user"></span>
                                        Hello, <%=owner.getUsername() %>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 userDetails">
                            <table class="col-lg-12 col-md-12 col-sm-12 col-xs-12 table">
                                <tr>
                                    <td colspan="2">
                                        <p align="center">
                                            <img id="userImg" class="img-responsive" src="/images/userPic.png" />
                                            <p align="center">
                                                Hello , <b><%=owner.getUsername() %></b>
                                            </p>
                                        </p>
                                        <p align="center" style="color:blue;">
                                            <% if(request.getAttribute("addinfo")!=null){out.println(request.getAttribute("addinfo"));}%>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left">First Name : </td>
                                    <td class="right">
                                        <%=owner.getFirstName() %>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left">Last Name : </td>
                                    <td class="right">
                                        <%=owner.getLastName() %>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left">Date Of Birth : </td>
                                    <td class="right">
                                        <%=date+"-"+month+"-"+year %>
                                    </td>
                                </tr>
                                <tr>
                                	<td colspan="2">
                                		<p align="center">
                                            <a href="${pageContext.request.contextPath}/resetPassword">
                                                <button style="width:40%" class="btn btn-sm btn-default"><i class="glyphicon glyphicon-refresh"></i> Reset Password</button>
                                            </a>
                                        </p>
                                	</td>
                                </tr>
                                <tr>
                                	<td class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <p align="center">
                                            <a href="${pageContext.request.contextPath}/showDeleteUserAccountForm">
                                                <button style="width:80%" class="btn btn-sm btn-danger"><i class="fa fa-user-times"></i> Delete Account</button>
                                            </a>
                                        </p>
                                    </td>
                                    <td class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <p align="center">
                                            <a href="${pageContext.request.contextPath}/logout">
                                                <button style="width:80%" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-log-out"></i> Logout</button>
                                            </a>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 studentPanel">
                            <table class="col-lg-12 col-md-12 col-sm-12 col-xs-12 table">
                                <tr>
                                    <td>
                                        <p align="center">
                                            <img id="addStudent" class="img-responsive" src="/images/addStudent.png" />
                                            <p align="center">
                                                <a href="${pageContext.request.contextPath}/student/showStudentFormToAdd">
                                                            <button class="btn btn-primary">
                                                            <i class="fa fa-user-plus"></i>
                                                                 Add Student
                                                            </button>
                                                        </a>
                                            </p>
                                        </p>
                                    </td>
                                    <td>
                                        <p align="center">
                                            <img id="filterStudent" class="img-responsive" src="/images/filterStudent.png"
                                            />
                                            <p align="center">
                                                <a href="${pageContext.request.contextPath}/student/showStudentFilterView">
                                                                <button class="btn btn-primary">
                                                                <i class="fa fa-filter"></i>
                                                                     Filter Student
                                                                </button>
                                                            </a>
                                            </p>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p align="center">
                                            <img id="viewPanel" class="img-responsive" src="/images/viewPanel.png" />
                                            <p align="center">
                                                <a href="${pageContext.request.contextPath}/student/export">
                                                            <button class="btn btn-primary">
                                                             <i class="fa fa-television"></i>
                                                               Report
                                                            </button>
                                                        </a>
                                            </p>
                                        </p>
                                    </td>
                                    <td>
                                        <p align="center">
                                            <img id="viewTable" class="img-responsive" src="/images/viewTable.png" />
                                            <p align="center">
                                                <a href="${pageContext.request.contextPath}/student/showStudentTableView">
                                                            <button class="btn btn-primary">
                                                             <i class="fa fa-table"></i>
                                                                View Student
                                                            </button>
                                                        </a>
                                            </p>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <form>
                        </form>
                    </div>
                </div>
    </body>

    </html>