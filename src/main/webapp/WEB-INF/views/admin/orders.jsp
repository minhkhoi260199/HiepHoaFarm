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
                            <!-- ORDER TABLE -->
                            <div class="table-data__tool">
                                <div class="table-data__tool-left" style="display: inline-flex">
                                    <h3 class="title-5 m-t-10">Danh sách đơn hàng</h3> &nbsp;&nbsp;
<%--                                    <p style="color: green" >(Đang xử lý: " ${fn:length(processing)} ")</p>--%>
                                </div>
                            </div>
                            <script>
                                function numberWithCommas(x) {
                                    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" đ";
                                }
                            </script>
                            <div class="table-responsive m-b-10">
                                <table class="table table-borderless table-data3">
                                    <thead>
                                    <tr>
                                        <th>Trạng thái</th>
                                        <th>Số điện thoại</th>
                                        <th>Tên khách hàng</th>
                                        <th>Địa chỉ</th>
                                        <th>Tổng đơn</th>
                                        <th>Thời gian</th>
                                        <th>Chi tiết</th>
                                    </tr>
                                    </thead>
                                    <tbody style="overflow-y: scroll; max-height: 300px">
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <c:if test="${order.statusByStatusId.idStatus == 3 }">
                                            <td style="font-weight: bold ;color: #e0a800">${order.statusByStatusId.statusNamevie}</td>
                                            </c:if>
                                            <c:if test="${order.statusByStatusId.idStatus == 4 }">
                                            <td style="font-weight: bold ;color: forestgreen">${order.statusByStatusId.statusNamevie}</td>
                                            </c:if>
                                            <c:if test="${order.statusByStatusId.idStatus == 6 }">
                                            <td style="font-weight: bold ;color: #00a2e3">${order.statusByStatusId.statusNamevie}</td>
                                            </c:if>
                                            <c:if test="${order.statusByStatusId.idStatus == 7 }">
                                            <td style="font-weight: bold ;color: red">${order.statusByStatusId.statusNamevie}</td>
                                            </c:if>
                                            <td>${order.customerPhone}</td>
                                            <td>${order.customerName}</td>
                                            <td>${order.address}</td>
                                            <td style="text-align: end">
                                                <script>
                                                    document.write(numberWithCommas(${order.orderAmount}))
                                                </script>
                                            </td>
                                            <td>${order.createdTime}</td>
                                            <td>
                                                <button class="btn btn-secondary btn-sm" onclick="orderDetail('${order.idOrder}')" title="Chi tiết">
                                                    Chi tiết đơn
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
                </div>
            </div>
        </div>

        <!-- modal scroll -->
        <div class="modal fade" id="scrollmodal" tabindex="-1" role="dialog" aria-labelledby="scrollmodalLabel"
             aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="scrollmodalLabel">Chi tiết đơn hàng</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                            <%--                        <h5>Thông tin khách hàng:</h5>--%>
                            <%--                        <span>Tên: <div id="customerName"></div></span>--%>
                            <%--                        <span>Điện thoại: </span><div id="customerPhone"></div>--%>
                            <%--                        <span>Địa chỉ: </span><div id="customerAddress"></div>--%>
                            <%--                        <hr/>--%>
                            <%--                        <h5>Thông tin đơn hàng:</h5>--%>
                            <%--                        <span>Tổng đơn: </span><div id="orderAmout"></div>--%>
                            <%--                        <span>Ngày tạo: </span><div id="orderCreated"></div>--%>
                            <%--                        <span>Giỏ hàng: </span>--%>
                        <div id="orderDetail"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary">Confirm</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- end modal scroll -->
        <!-- Logic -->
        <script type="text/javascript">
            function orderDetail(idOrder){
                $('#scrollmodal').modal('show');
                $('#scrollmodal').css("cursor","wait");
                $.ajax({
                    url: "${pageContext.request.contextPath }/api/order/getOrderById?id="+idOrder,
                    method: "GET",
                    success: function(res) {
                        console.log(res);
                        $('#scrollmodal').css("cursor","default");
                        $('#orderDetail').html("<h5>Thông tin khách hàng:</h5>"
                            +"<p>Tên: "+res.customerName+"</p>"
                            +"<p>Điện thoại: "+res.customerPhone+"</p>"
                            +"<p>Địa chỉ: "+res.address+"</p>"
                            +"<hr/>"
                            +"<h5>Thông tin đơn hàng:</h5>"
                            +"<p>Tổng đơn: "+numberWithCommas(res.orderAmount)+"</p>"
                            +"<p>Ngày tạo: "+res.createdTime+"</p>"
                            +"<p>Giỏ hàng: </p>");
                    }
                });
            }
        </script>
	</jsp:attribute>
</tmp:adminTemplate>