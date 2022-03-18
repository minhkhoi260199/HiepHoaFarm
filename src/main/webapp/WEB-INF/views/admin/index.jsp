<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tmp" tagdir="/WEB-INF/tags" %>
<tmp:adminTemplate title="Hiệp Hoà Farm">
	<jsp:attribute name="content">
        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <!-- DYNAMIC CONTENT-->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- NEW ORDER -->
                            <div class="table-data__tool">
                                <div class="table-data__tool-left" style="display: inline-flex">
                                    <h3 class="title-5 m-t-5">ĐƠN MỚI </h3> &nbsp;&nbsp;
                                    <p style="color: red" >(Đang chờ: " ${fn:length(pendings)} ")</p>
                                </div>
                            </div>
                            <div style="overflow-y: scroll; max-height: 300px" class="table-responsive m-b-10">
                                <table class="table table-borderless table-data3">
                                    <thead>
                                        <tr>
                                            <th>Số điện thoại</th>
                                            <th>Tên khách hàng</th>
                                            <th>Địa chỉ</th>
                                            <th>Tổng đơn</th>
                                            <th>Thời gian</th>
                                            <th>Trạng thái</th>
                                            <th>Chi tiết</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <script>
                                        function numberWithCommas(x) {
                                            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" đ";
                                        }
                                    </script>
                                    <tbody >
                                    <c:forEach var="pendingOrder" items="${pendings}">
                                        <tr>
                                            <td>${pendingOrder.customerPhone}</td>
                                            <td>${pendingOrder.customerName}</td>
                                            <td>${pendingOrder.address}</td>
                                            <td style="text-align: end">
                                                <script>
                                                    document.write(numberWithCommas(${pendingOrder.orderAmount}))
                                                </script>
                                            </td>
                                            <td>${pendingOrder.createdTime}</td>
                                            <td class="pending">${pendingOrder.statusByStatusId.statusNamevie}</td>
                                            <td style="text-align: center" >
                                                <button class="btn btn-outline-secondary btn-sm" onClick="" title="Chi tiết">
                                                    <i class="fa fa-caret-square-o-down"></i>
                                                </button>
                                            </td>
                                            <td>
                                                <button class="btn btn-success btn-sm" onclick="" title="Nhận đơn">
<%--                                                    <i class="fa fa-rocket"></i>--%>
                                                    Nhận đơn
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- END NEW ORDER-->
                            <hr/>
                            <!-- ORDER TABLE -->
                            <div class="table-data__tool">
                                <div class="table-data__tool-left" style="display: inline-flex">
                                    <h3 class="title-5 m-t-10">ĐƠN HÀNG BẠN ĐANG XỬ LÝ</h3> &nbsp;&nbsp;
                                    <p style="color: green" >(Đang xử lý: " ${fn:length(processing)} ")</p>
                                </div>
                                <div class="table-data__tool-right">
                                    <button type="button" class="au-btn au-btn-icon au-btn--green au-btn--small"
                                            data-toggle="modal" data-target="#scrollmodal">
                                        <i class="fa fa-plus"></i>Thêm đơn mới
                                    </button>
                                </div>
                            </div>
                            <div class="table-responsive m-b-10">
                                <table class="table table-borderless table-data3">
                                    <thead>
                                    <tr>
                                        <th>Số điện thoại</th>
                                        <th>Tên khách hàng</th>
                                        <th>Địa chỉ</th>
                                        <th>Tổng đơn</th>
                                        <th>Thời gian</th>
                                        <th>Trạng thái</th>
                                        <th>Chi tiết</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="order" items="${processing}">
                                        <tr>
                                            <td>${order.customerPhone}</td>
                                            <td>${order.customerName}</td>
                                            <td>${order.address}</td>
                                            <td style="text-align: end">
                                                <script>
                                                    document.write(numberWithCommas(${order.orderAmount}))
                                                </script>
                                            </td>
                                            <td>${order.createdTime}</td>
                                            <td class="process">${order.statusByStatusId.statusNamevie}</td>
                                            <td style="text-align: center" >
                                                <button class="btn btn-outline-secondary btn-sm" onClick="" title="Chi tiết">
                                                    <i class="fa fa-caret-square-o-down"></i>
                                                </button>
                                            </td>
                                            <td>
                                                <button class="btn btn-warning btn-sm" onclick="" title="Chuyển tiếp">
                                                        <%--                                                    <i class="fa fa-rocket"></i>--%>
                                                    Vận chuyển
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

        <!-- modal scroll -->
        <div class="modal fade" id="scrollmodal" tabindex="-1" role="dialog" aria-labelledby="scrollmodalLabel"
             aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="scrollmodalLabel">Scrolling Long Content Modal</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>
                            <br> Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                            scelerisque nisl consectetur et.
                            Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary">Confirm</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- end modal scroll -->
	</jsp:attribute>
</tmp:adminTemplate>