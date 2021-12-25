<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tmp" tagdir="/WEB-INF/tags" %>
<tmp:adminTemplate title="Hiệp Hoà Farm">
	<jsp:attribute name="content">

        <div class="row">
            <div class="col-md-12">
                <!-- NEW ORDER -->
                <div class="table-data__tool">
                    <div class="table-data__tool-left">
                        <h3 class="title-5 m-b-10">ĐƠN MỚI</h3>
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
                        <h3 class="title-5 m-b-10">ĐƠN HÀNG BẠN ĐANG XỬ LÝ</h3>
                    </div>
                    <div class="table-data__tool-right">
                        <button class="au-btn au-btn-icon au-btn--green au-btn--small">
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

	</jsp:attribute>
</tmp:adminTemplate>