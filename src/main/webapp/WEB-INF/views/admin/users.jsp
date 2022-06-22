<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tmp" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<tmp:adminTemplate title="Admin - Hiệp Hoà Farm">
	<jsp:attribute name="content">
        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <!-- DYNAMIC CONTENT-->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- ORDER TABLE -->
                            <div class="table-data__tool">
                                <div class="table-data__tool-left">
                                    <h3 class="title-5 m-t-10">QUẢN LÝ KHÁCH HÀNG</h3>
                                </div>
                                <div class="table-data__tool-right">
                                </div>
                            </div>
                            <div class="table-responsive m-b-40">
                                <table class="table table-borderless table-data3">
                                    <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Họ và tên</th>
                                        <th>Địa chỉ</th>
                                        <th>Trạng thái</th>
                                        <th>Đổi</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tableBody">
                                    <c:forEach var="user" items="${users}">
                                        <script>
                                            let prData${user.idUser} = {
                                                "idUser" : "${user.idUser}",
                                                "username" : "${user.username}",
                                                "fullname" : "${user.fullname}",
                                                "address" : "${user.address}",
                                                "statusId" : "${user.statusByStatusId.idStatus}"
                                            }
                                        </script>
                                    <tr>
                                        <td>${user.username}</td>
                                        <td>${user.fullname}</td>
                                        <td>${user.address}</td>
                                        <c:if test="${user.statusByStatusId.idStatus == 1 }">
                                        <td class="process" id="statusName${user.idUser}">${user.statusByStatusId.statusNameVie}</td>
                                        <td>
                                            <button id="statusButton${user.idUser}" class="btn btn-outline-danger btn-sm" onclick="setStatus(prData${user.idUser},'disable')" title="Vô hiệu">
                                                <i class="fa fa-window-close"></i>
                                            </button>
                                        </td>
                                        </c:if>
                                        <c:if test="${user.statusByStatusId.idStatus == 2 }">
                                        <td class="denied" id="statusName${user.idUser}">${user.statusByStatusId.statusNameVie}</td>
                                        <td>
                                            <button id="statusButton${user.idUser}" class="btn btn-outline-success btn-sm" onclick="setStatus(prData${user.idUser},'enable')" title="Kích hoạt">
                                                <i class="fa fa-rocket"></i>
                                            </button>
                                        </td>
                                        </c:if>
<%--                                        <td>--%>
<%--                                            <div class="table-data-feature justify-content-center">--%>
<%--                                                <button class="item" onClick="remove(${user.idUser})"  title="Delete">--%>
<%--                                                    <i class="fa fa-trash"></i>--%>
<%--                                                </button>--%>
<%--                                            </div>--%>
<%--                                        </td>--%>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- END ORDER TABLE-->
                            <hr/>
                            <c:if test="${fn:length(users) == 0}">
                                <div class="col-md-12 text-center">
                                    <h4 class="title-5 m-b-10">KHÔNG CÓ KẾT QUẢ TÌM KIẾM !</h4>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <!-- Pagination-->
                    <div id="pagination" class="tui-pagination"></div>
                    <!-- End Pagination-->
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function setStatus(user, action){
                let comp;
                let confirm = new Promise((resolve, reject) => {
                    if(action == "enable"){
                        swal({
                            title: "Kích hoạt user ?",
                            text: "Tài khoản sẽ tiếp tục được sử dụng!",
                            icon: "info",
                            buttons: ["Huỷ !", "Xác nhận"],
                        }).then((confirmSubmit) => {
                            if (confirmSubmit) {
                                comp = {
                                    "onclick" : "setStatus(prData"+user.idUser+",'disable')",
                                    "title" : "Vô hiệu",
                                    "button" : "<i class='fa fa-window-close'></i>",
                                    "buttonRemoveClass" : "btn-outline-success",
                                    "buttonAddClass" : "btn-outline-danger",
                                    "label" : "kích Hoạt",
                                    "labelRemoveClass" : "denied",
                                    "labelAddClass" : "process"
                                };
                                user.statusId = 1;
                                return resolve(true);
                            }
                        });
                    } else if (action == "disable") {
                        swal({
                            title: "Xác nhận khoá user?",
                            text: "Tài khoản sẽ bị khóa và không đăng nhập được !",
                            icon: "warning",
                            buttons: ["Huỷ !", "Xác nhận"],
                            dangerMode: true,
                        }).then((confirmSubmit) => {
                            if (confirmSubmit) {
                                comp = {
                                    "onclick" : "setStatus(prData"+user.idUser+",'enable')",
                                    "title" : "Kích hoạt",
                                    "button" : "<i class='fa fa-rocket'></i>",
                                    "buttonRemoveClass" : "btn-outline-danger",
                                    "buttonAddClass" : "btn-outline-success",
                                    "label" : "vô hiệu",
                                    "labelRemoveClass" : "process",
                                    "labelAddClass" : "denied"
                                }
                                user.statusId = 2;
                                return resolve(true);
                            }
                        });
                    } else {
                        return reject("Lỗi");
                    }
                });
                confirm.then((flag) => {
                    if(flag){
                        let button = '#statusButton'+user.idUser;
                        let label = '#statusName'+user.idUser;
                        $.ajax({
                            url: "${pageContext.request.contextPath }/api/auth/saveStatus",
                            method: "POST",
                            data: JSON.stringify(user),
                            contentType: "application/json",
                            dataType: 'json',
                            success: function(res) {
                                swal({
                                    title: "Đã "+comp.label+" '"+res.username+"' thành công !",
                                    icon: "success",
                                    buttons: "OK",
                                }).then(() => {
                                    $(button).attr('title', comp.title);
                                    $(button).attr('onClick', comp.onclick);
                                    $(button).removeClass(comp.buttonRemoveClass);
                                    $(button).addClass(comp.buttonAddClass);
                                    $(button).html(comp.button);
                                    $(label).html(comp.label);
                                    $(label).removeClass(comp.labelRemoveClass);
                                    $(label).addClass(comp.labelAddClass);
                                });
                            },
                            error: function() {
                                swal({
                                    title: "Fail",
                                    text: "Đã có lỗi xảy ra !!",
                                    icon: "error",
                                    buttons: "OK",
                                });
                            }
                        });
                    }
                }).catch( err => {
                    console.log(err);
                });
            }
            $("#searchBy").html("<option>phone</option>");
            $("#submitSearch").on('click',()=>{
                let searchBy = $("#searchBy").find(":selected").text();
                let keyword = $("#searchKeyword").val();

                $(location).attr('href','searchUsers?searchBy='+searchBy+'&keyword='+keyword);

                console.log("search ERROR");
                console.log("searchBy: "+searchBy);
                console.log("keyword: "+keyword);
            });
        </script>
	</jsp:attribute>
</tmp:adminTemplate>