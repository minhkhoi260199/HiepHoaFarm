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
                                            <th>Hủy đơn</th>
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
                                    <tbody>
                                    <c:forEach var="pendingOrder" items="${pendings}">
                                        <tr>
                                            <td>
                                                <button id="statusButton${pendingOrder.idOrder}" class="btn btn-outline-danger btn-sm" onclick="setStatus(${pendingOrder.idOrder},'setCanceled')" title="Hủy đơn">
                                                    <i class="fa fa-window-close"></i>
                                                </button>
                                            </td>
                                            <td>${pendingOrder.customerPhone}</td>
                                            <td>${pendingOrder.customerName}</td>
                                            <td>${pendingOrder.address}</td>
                                            <td style="text-align: end">
                                                <script>
                                                    document.write(numberWithCommas(${pendingOrder.orderAmount}))
                                                </script>
                                            </td>
                                            <td>${pendingOrder.createdTime}</td>
                                            <td class="pending">${pendingOrder.statusByStatusId.statusNameVie}</td>
                                            <td style="text-align: center" >
                                                <button class="btn btn-outline-secondary btn-sm" onClick="orderDetail('${pendingOrder.idOrder}','${pendingOrder.orderAmount}')" title="Chi tiết">
                                                    <i class="fa fa-caret-square-o-down"></i>
                                                </button>
                                            </td>
                                            <td>
                                                <button class="btn btn-success btn-sm" onclick="setStatus(${pendingOrder.idOrder},'setProcessing')" title="Nhận đơn">
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
<%--                                <div class="table-data__tool-right">--%>
<%--                                    <button type="button" class="au-btn au-btn-icon au-btn--green au-btn--small"--%>
<%--                                            data-toggle="modal" data-target="#scrollmodal">--%>
<%--                                        <i class="fa fa-plus"></i>Thêm đơn mới--%>
<%--                                    </button>--%>
<%--                                </div>--%>
                            </div>
                            <div style="overflow-y: scroll; max-height: 300px" class="table-responsive m-b-10">
                                <table class="table table-borderless table-data3">
                                    <thead>
                                    <tr>
                                        <th>Hủy đơn</th>
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
                                    <tbody style="overflow-y: scroll; max-height: 300px">
                                    <c:forEach var="order" items="${processing}">
                                        <tr>
                                            <td>
                                                <button id="statusButton${order.idOrder}" class="btn btn-outline-danger btn-sm" onclick="setStatus(${order.idOrder},'setCanceled')" title="Hủy đơn">
                                                    <i class="fa fa-window-close"></i>
                                                </button>
                                            </td>
                                            <td>${order.customerPhone}</td>
                                            <td>${order.customerName}</td>
                                            <td>${order.address}</td>
                                            <td style="text-align: end">
                                                <script>
                                                    document.write(numberWithCommas(${order.orderAmount}))
                                                </script>
                                            </td>
                                            <td>${order.createdTime}</td>
                                            <td class="process">${order.statusByStatusId.statusNameVie}</td>
                                            <td style="text-align: center" >
                                                <button class="btn btn-outline-secondary btn-sm" onClick="orderDetail('${order.idOrder}','${order.orderAmount}')" title="Chi tiết">
                                                    <i class="fa fa-caret-square-o-down"></i>
                                                </button>
                                            </td>
<%--                                            <c:if test="${order.statusByStatusId.idStatus == 4 }">--%>
<%--                                            <td>--%>
<%--                                                <button class="btn btn-warning btn-sm" onclick="setStatus(${order.idOrder},'setShipping')" title="Chuyển tiếp">--%>
<%--                                                        &lt;%&ndash;                                                    <i class="fa fa-rocket"></i>&ndash;%&gt;--%>
<%--                                                    Vận chuyển--%>
<%--                                                </button>--%>
<%--                                            </td>--%>
<%--                                            </c:if>--%>
<%--                                            <c:if test="${order.statusByStatusId.idStatus == 5 }">--%>
                                            <td>
                                                <button class="btn btn-warning btn-sm" onclick="setStatus(${order.idOrder},'setCompleted')" title="Hoàn thành">
                                                        <%--                                                    <i class="fa fa-rocket"></i>--%>
                                                    Hoàn thành
                                                </button>
                                            </td>
<%--                                            </c:if>--%>

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
        <c:forEach var="order" items="${pendings}">
            <!-- modal scroll -->
            <div class="modal fade" id="scrollmodal${order.idOrder}" tabindex="-1" role="dialog" aria-labelledby="scrollmodalLabel"
                 aria-hidden="true" data-backdrop="static">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="">Chi tiết đơn hàng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h5>Thông tin khách hàng:</h5>
                            <div>Tên: <span style="color: red">${order.customerName}</span></div>
                            <div>Điện thoại: <span style="color: blue">${order.customerPhone}</span></div>
                            <div>Địa chỉ: <span style="color: royalblue">${order.address}</span></div>
                            <hr/>
                            <h5>Thông tin đơn hàng:</h5>
                            <div>Tổng đơn: <span style="color: red" id="amount${order.idOrder}"></span></div>
                            <div>Ngày tạo: ${order.createdTime}</div>
                            <div style="color: darkred">Giỏ hàng: </div>
                            <fieldset style="border: #e0a800 3px double; border-radius: 10px; padding-left: 20px;">
                            <c:forEach var="item" items="${order.orderDetailsByIdOrder}">
                                <div>-${item.productByProductId.productName} (${item.productByProductId.productPrice}) : ${item.quantity}${item.productByProductId.saleUnit}</div>
                            </c:forEach>
                            </fieldset>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <%--                            <button type="button" class="btn btn-primary">Confirm</button>--%>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end modal scroll -->
        </c:forEach>

        <c:forEach var="order" items="${processing}">
            <!-- modal scroll -->
            <div class="modal fade" id="scrollmodal${order.idOrder}" tabindex="-1" role="dialog" aria-labelledby="scrollmodalLabel"
                 aria-hidden="true" data-backdrop="static">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" >Chi tiết đơn hàng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h5>Thông tin khách hàng:</h5>
                            <div>Tên: <span style="color: red">${order.customerName}</span></div>
                            <div>Điện thoại: <span style="color: blue">${order.customerPhone}</span></div>
                            <div>Địa chỉ: <span style="color: royalblue">${order.address}</span></div>
                            <hr/>
                            <h5>Thông tin đơn hàng:</h5>
                            <div>Tổng đơn: <span style="color: red" id="amount${order.idOrder}"></span></div>
                            <div>Ngày tạo: ${order.createdTime}</div>
                            <div style="color: darkred">Giỏ hàng: </div>
                            <fieldset style="border: #e0a800 3px double; border-radius: 10px; padding-left: 20px;">
                            <c:forEach var="item" items="${order.orderDetailsByIdOrder}">
                                <div>-${item.productByProductId.productName} (${item.productByProductId.productPrice}) : ${item.quantity}${item.productByProductId.saleUnit}</div>
                            </c:forEach>
                            </fieldset>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <%--                            <button type="button" class="btn btn-primary">Confirm</button>--%>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end modal scroll -->
        </c:forEach>


        <!-- end modal scroll -->
        <!-- Logic -->
        <script type="text/javascript">
            function setStatus(id, typeSet){
                let mess = 'Xác nhận thay đổi trạng thái đơn ?'
                switch (typeSet){
                    case 'setProcessing': { mess = 'Bạn nhận đơn này ?'} break;
                    case 'setCompleted' : { mess = 'Đơn hàng đã hoàn thành ?'} break;
                    case 'setCanceled' : { mess = 'Hủy đơn này ?'} break;
                }
                swal({
                    title: "Xác nhận! "+mess,
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            if ( id != "") {
                                $.ajax({
                                    url: "${pageContext.request.contextPath }/api/order/"+typeSet+"?id="+id,
                                    method: "GET",
                                    success: function(res) {
                                        swal("Thành công!", {
                                            icon: "success",
                                        }).then(() => {
                                            location.reload();
                                        });
                                    }
                                })
                            }
                        } else {
                            swal({title:"Canceled !"});
                        }
                    });
            }
            function orderDetail(idOrder, amount){
                $('#scrollmodal'+idOrder).modal('show');
                $('#amount'+idOrder).text(numberWithCommas(amount).toString())
            }
            $("#searchBy").html("<option>name</option><option>phone</option>");
            $("#submitSearch").on('click',()=>{
                let searchBy = $("#searchBy").find(":selected").text();
                let keyword = $("#searchKeyword").val();

                $(location).attr('href','searchOrsers?searchBy='+searchBy+'&keyword='+keyword);

                console.log("search ERROR");
                console.log("searchBy: "+searchBy);
                console.log("keyword: "+keyword);
            });
        </script>
	</jsp:attribute>
</tmp:adminTemplate>