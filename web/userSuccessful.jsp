<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>USER</title>
        <link rel="stylesheet" href="css/style.css" />
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap");
        </style>
        <link rel="stylesheet" href="fonts/themify-icons/themify-icons.css" />
        <link rel="icon" href="./img/word-image-1047.jpg" type="image/x-icon" />
        <link
            rel="stylesheet"
            href="node_modules/bootstrap/dist/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
            integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
            crossorigin="anonymous"
            />
        <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    </head>

    <body>
        <!-- nabar -->
        <!-- <div class="container"> -->
        <div class="row navbar">
            <!-- logo -->
            <div class="col-sm-4 navbar-user-left d-flex align-items-center">
                <div class="col-sm-5 logo">
                    <a href="#"><img src="./img/logo.png" height="80" alt="" /></a>
                </div>
                <!-- product-list -->
                <div class="">
                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center justify-content-center user-info" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown">
                            <p class="product-list">Product</p>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <c:forEach var="category" items="${categoryList}">
                                <li>
                                    <a class="dropdown-item" value="${category.key}" href="MainController?search=${category.key}&action=HomeSearchDevice&value=${category.value}">${category.value}</a>
                                </li>
                            </c:forEach>
                            <li>
                                <a class="dropdown-item" href="MainController?search=&action=HomeSearchDevice&value=${category.value}">All Product</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 text-center navbar-user-fill"></div>
            <!-- card-icon -->
            <div class="col-sm-4 text-center navbar-user-right d-flex">
                <div class="col-sm-6 card-shopping">
                    <a href="card.html" class="" role="button">
                        <i class="fas fa-shopping-cart text-dark ml-5"></i>
                    </a>
                </div>
                <!-- welcome -->
                <div class="col-sm-6">
                    <div class="nav-item dropdown align-items-center">
                        <a class="nav-link dropdown-toggle d-flex align-items-center justify-content-center user-info" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown">
                            <img src="https://scontent.fsgn5-11.fna.fbcdn.net/v/t1.6435-9/148200636_528659258096027_8966625421411191162_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=dzMdGh7CUt4AX978A2p&_nc_ht=scontent.fsgn5-11.fna&oh=00_AT_T8cl7XJeQ7xnVIt7NSbBeFkMmZy_8FtaihBZKvwhxjw&oe=62BB3767" class="rounded-circle" height="25"/>
                            <p class="user-name">Thienpnse150137</p>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li>
                                <a class="dropdown-item" href="myprofile.html">My profile</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="login.html">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- search-button -->
        <div class="row navbar-option col-sm-12 d-flex">
            <div class="col-sm-11">
                <div class="table table-user">
                    <table class="col-sm-12" id="myTable">
                        <thead>
                        <th class="text-center">Request ID</th>
                        <th class="text-center">Substance</th>
                        <th class="text-center">Request Date</th>
                        <th class="text-center">Action</th>
                        </thead>
                        <tbody>
                            <c:forEach var="request" varStatus="counter" items="${requestScope.LIST_SUCCESSFUL_REQUEST_USER}">
                                <c:set var="detail" value="${request.requestDetail}"/>
                            <form action="MainController" method="POST">
                                <tr id="info">
                                    <td class="text-center">${request.id}</td>
                                    <td class="text-center">${request.requestSubstance}</td>
                                    <td class="text-center">${request.requestDate}</td>
                                    <td class="text-center ">
                                        <a  id="fa-info-circle">
                                            <button class="btn" type="button" data-toggle="modal" data-target="#${detail}"><i class="fas fa-info-circle"></i></button></a>
                                        <div id="${detail}" class="modal fade" role="dialog">
                                            <div class="modal-dialog modal-lg" role="content">
                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Details</h4>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <div class="form-row">
                                                            <div class="form-group col-sm-12 d-flex">    
                                                                <label for="" class="col-sm-6 text-center">
                                                                    <h5>Device name</h5>
                                                                </label>
                                                                <label class="col-sm-4 pt-1 pb-1"id="list-chose">
                                                                    ${detail.device.deviceName}
                                                                </label>
                                                            </div>
                                                            </br>
                                                            <div class="form-group col-sm-12 d-flex">   
                                                                <label for="" class="col-sm-6 text-center">
                                                                    <h5>Quantity</h5>
                                                                </label>
                                                                <label class="col-sm-4 pt-1 pb-1"id="list-chose">
                                                                    ${detail.quantity}
                                                                </label>
                                                            </div>
                                                            </br>
                                                            <div class="form-group col-sm-12 d-flex">   
                                                                <label for="" class="col-sm-6 text-center">
                                                                    <h5>Borrowed date</h5>
                                                                </label>
                                                                <label class="col-sm-4 pt-1 pb-1"id="list-chose">

                                                                    <c:if test = "${detail.borrowDate != null}">
                                                                        <c:out value = "${detail.borrowDate}"/>
                                                                    </c:if>
                                                                    <c:if test = "${detail.borrowDate == null}">
                                                                        <c:out value = "Not approved"/>
                                                                    </c:if>
                                                                </label></div></br>
                                                            <div class="form-group col-sm-12 d-flex">   
                                                                <label for="" class="col-sm-6 text-center">
                                                                    <h5>Expired date</h5>
                                                                </label>
                                                                <label class="col-sm-4 pt-1 pb-1">
                                                                    <c:if test = "${detail.expiredDate != null}">
                                                                        <c:out value = "${detail.expiredDate}"/>
                                                                    </c:if>
                                                                    <c:if test = "${detail.expiredDate == null}">
                                                                        <c:out value = "Not approved"/>
                                                                    </c:if>
                                                                </label></div></br>
                                                            <div class="form-group col-sm-12 d-flex">   
                                                                <label for="" class="col-sm-6 text-center">
                                                                    <h5>Detail status</h5>
                                                                </label>
                                                                <label class="col-sm-4 pt-1 pb-1">
                                                                    ${detail.detailStatus}
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <a  id="fa-info-circle">
                                            <button class="btn" type="button" data-toggle="modal" data-target="#extendModal${detail}"><i class="fas fa-info-circle"></i>Extend</button></a>
                                        <div id="extendModal${detail}" class="modal fade" role="dialog">
                                            <div class="modal-dialog modal-lg" role="content">
                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Extend modal</h4>
                                                        <button type="button" class="close" data-dismiss="modal">
                                                            &times;
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="Maicontroller" method="POST">
                                                        
                                                            <div class="form-row">
                                                                <div class="form-group col-sm-12 d-flex">
                                                                    <h5 class="col-sm-4">Devices Name</h5>
                                                                    <label for="" class="col-sm-8 text-center"
                                                                           >${detail.device.deviceName}</label
                                                                    >
                                                                </div>
                                                                <div class="form-group col-sm-12 d-flex">
                                                                    <h5 class="col-sm-4">ExpiredDate</h5>
                                                                    <label for="" class="col-sm-8">${detail.expiredDate}</label>
                                                                </div>
                                                                <div class="form-group col-sm-12 d-flex">
                                                                    <h5 class="col-sm-4">Extension Date</h5>
                                                                    <label for="" class="col-sm-8"><select name="extendDate">
                                                                            <option value="15">15 days</option>
                                                                            <option value="30">30 days</option>
                                                                            <option value="90">90 days</option>
                                                                        </select></label>
                                                                </div>
                                                                <div class="form-group col-sm-12 d-flex">
                                                                    <h5 class="col-sm-4">Reason For Extension</h5>
                                                                    <label for="" class="col-sm-8"><textarea type='textarea' placeholder="Write Your Reason Here" class="input-extend1" name="message"> </textarea >
                                                                    </label>
                                                                    <input type="hidden" name="requestID" value="${request.id}"/>
                                                                </div>
                                                                <div class="form-group col-sm-12 d-flex">
                                                                    <button class="col-sm-4 ml-5 mr-5 btn-danger" type="reset">Reset</button>
                                                                    <button class="col-sm-4 ml-5 mr-5 btn-color" type="submit" name="action" value="ExtendRequest">Send</button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="navbar-col col-sm-1 order-first">
                <ul class="float-left">
                    <li>
                    </li>

                    <li>
                        <a href="MainController?action=LoadProcessRequest"><span class="indicator"></span><i class="fas-option active fas fa-sync-alt"><span
                                    class="navbaroption-tittle">Processing</span></i></a>
                    </li>
                    <li>
                        <a href="MainController?action=LoadApproveRequest"><i class="fas-option fas fa-check-circle"><span
                                    class="navbaroption-tittle">Approved</span></i></a>
                    </li>
                    <li>
                        <a href="MainController?action=LoadSuccessfulRequest"><i class="fas-option fas fa-undo-alt"><span
                                    class="navbaroption-tittle">Successful</span></i></a>
                    </li>
                    <li>
                        <a href="MainController?action=LoadReturnRequest"><i class="fas-option fas fa-sync-alt"><span
                                    class="navbaroption-tittle">Returned</span></i></a>
                    </li>
                    <li class="option-user-3">
                        <a href="MainController?action=LoadCancelUserRequest"><i class="fas-option fas fa-ban"><span
                                    class="navbaroption-tittle">Cancel</span></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </body>
    <script>
        function Delete() {
            $("#info").remove();
        }
    </script>
</html>
