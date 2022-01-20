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
                            <!-- NEW ORDER -->
                            <div class="table-data__tool">
                                <div class="table-data__tool-left">
                                    <h3 class="title-5 m-t-10">ĐƠN MỚI</h3>
                                </div>
                            </div>
                            <div class="table-responsive m-b-40">
                                <table class="table table-borderless table-data3">
                                    <thead>
                                    <tr>
                                        <th>ThoiGianNhanDon</th>
                                        <th>type</th>
                                        <th>description</th>
                                        <th>status</th>
                                        <th>mmmmmmmmmmmmmmmmm</th>
                                        <th>price</th>
                                        <th>price</th>
                                        <th>price</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>2018</td>
                                        <td>Mobile</td>
                                        <td>iPhone X 64Gb Grey</td>
                                        <td class="process">Processed</td>
                                        <td>$999.00</td>
                                        <td>$999.00</td>
                                        <td>$999.00</td>
                                        <td>$999.00</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- END NEW ORDER-->
                            <hr/>
                            <!-- ORDER TABLE -->
                            <div class="table-data__tool">
                                <div class="table-data__tool-left">
                                    <h3 class="title-5 m-t-10">ĐƠN HÀNG BẠN ĐANG XỬ LÝ</h3>
                                </div>
                                <div class="table-data__tool-right">
                                    <button type="button" class="au-btn au-btn-icon au-btn--green au-btn--small"
                                            data-toggle="modal" data-target="#scrollmodal">
                                        <i class="zmdi zmdi-plus"></i>Thêm đơn mới
                                    </button>
                                </div>
                            </div>
                            <div class="table-responsive m-b-40">
                                <table class="table table-borderless table-data3">
                                    <thead>
                                    <tr>
                                        <th>ThoiGianNhanDon</th>
                                        <th>type</th>
                                        <th>description</th>
                                        <th>status</th>
                                        <th>mmmmmmmmmmmmmmmmm</th>
                                        <th>price</th>
                                        <th>price</th>
                                        <th>price</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>2018</td>
                                        <td>Mobile</td>
                                        <td>iPhone X 64Gb Grey</td>
                                        <td class="process">Processed</td>
                                        <td>$999.00</td>
                                        <td>$999.00</td>
                                        <td>$999.00</td>
                                        <td>$999.00</td>
                                    </tr>
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