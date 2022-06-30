<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tmp" tagdir="/WEB-INF/tags" %>
<tmp:adminTemplate title="Hiệp Hoà Farm">
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
                                    <h3 class="title-5 m-t-10">QUẢN LÝ THƯ LIÊN HỆ</h3>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-8">
                        <div class="table-responsive m-b-40">
                                <table class="table table-borderless table-data3">
                                    <thead>
                                    <tr>
                                        <th>Tên người gửi</th>
                                        <th>Số điện thoại</th>
                                        <th>Email</th>
                                        <th>Tiêu đề</th>
                                        <th>Nội dung</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="contact" items="${contacts}">
                                    <tr>
                                        <td>${contact.fullname}</td>
                                        <td>${contact.phone}</td>
                                        <td>${contact.email}</td>
                                        <td>${contact.title}</td>
                                        <td>
                                            <button class="btn btn-secondary btn-sm" onclick="orderDetail('${contact.idContact}')" title="Chi tiết">
                                                Nội dung
                                            </button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- END ORDER TABLE-->
                            <hr/>
                        </div>
                    </div>
                    <!-- END DYNAMIC CONTENT-->
<%--                    <div class="row">--%>
<%--                        <div class="col-md-12">--%>
<%--                            <div class="copyright">--%>
<%--                                <p>HIỆP HOÀ FARM MANAGER</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>

        <!-- modal static -->
        <c:forEach var="contact" items="${contacts}">
			<div class="modal fade" id="staticModal${contact.idContact}" tabindex="-1" role="dialog" aria-labelledby="staticModalLabel" aria-hidden="true"
                 data-backdrop="static">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticModalLabel">NỘI DUNG</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>
                                ${contact.content}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!-- end modal static -->
        <script type="text/javascript">
            $("#searchBy").html("<option>name</option>");
            $("#submitSearch").on('click',()=>{
                let searchBy = $("#searchBy").find(":selected").text();
                let keyword = $("#searchKeyword").val();

                $(location).attr('href','searchContact?searchBy='+searchBy+'&keyword='+keyword);

                console.log("search ERROR");
                console.log("searchBy: "+searchBy);
                console.log("keyword: "+keyword);
            });
            function orderDetail(idOrder){
                $('#staticModal'+idOrder).modal('show');
            }
        </script>
	</jsp:attribute>
</tmp:adminTemplate>