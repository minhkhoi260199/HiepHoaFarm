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
                                    <h3 class="title-5 m-t-10">QUẢN LÝ DANH MỤC SẢN PHẨM</h3>
                                </div>
                                <div class="table-data__tool-right">
                                    <button type="button" class="au-btn au-btn-icon au-btn--green au-btn--small"
                                            data-toggle="modal" data-target="#staticModal">
                                        <i class="fa fa-plus"></i>Thêm danh mục mới
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                        <div class="table-responsive m-b-40">
                                <table class="table table-borderless table-data3">
                                    <thead>
                                    <tr>
                                        <th>Tên danh mục</th>
                                        <th>Sửa danh mục</th>
                                        <th>Xoá danh mục</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="category" items="${categories}">
                                    <tr>
                                        <td id="categoryName_${category.idCategory}">${category.categoryName}</td>
                                        <td>
                                            <div class="table-data-feature justify-content-center">
                                                <button class="item" onClick="edit(${category.idCategory},'${category.categoryName }')" title="Edit">
                                                    <i class="fa fa-edit"></i>
                                                </button>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="table-data-feature justify-content-center">
                                                <button class="item" onClick="remove(${category.idCategory})"  title="Delete">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
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
			<div class="modal fade" id="staticModal" tabindex="-1" role="dialog" aria-labelledby="staticModalLabel" aria-hidden="true"
                 data-backdrop="static">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticModalLabel">THÊM DANH MỤC</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>
                                <input id="inputNewCate" type="text" placeholder="Nhập tên danh mục" />
                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" onclick="create()" class="btn btn-primary">Tạo mới</button>
                        </div>
                    </div>
                </div>
            </div>
        <!-- end modal static -->
        <script type="text/javascript">
            function create(){
                let newValue = $(`#inputNewCate`).val();
                let data = {
                    "categoryName": newValue,
                };
                $.ajax({
                    url: "${pageContext.request.contextPath }/api/category/save",
                    method: "POST",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: 'json',
                    success: function(res) {
                        swal({
                            title: "Thành công",
                            text: "Danh mục '"+res.categoryName+"' đã được tạo !",
                            icon: "success",
                            buttons: "OK",
                        }).then(() => {
                            location.reload();
                        });
                    }
                })
            }
            function remove(id){
                swal({
                    title: "Chắc chưa ?",
                    text: "Xoá là mất luôn đó! Khuyến nghị dùng chỉnh sửa nhé.",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            if ( id != "") {
                                $.ajax({
                                    url: "${pageContext.request.contextPath }/api/category/delete?id="+id,
                                    method: "POST",
                                    success: function(res) {
                                    }
                                })
                                swal("Category has been deleted!", {
                                    icon: "success",
                                }).then(() => {
                                    location.reload();
                                });
                            }
                        } else {
                            swal("Canceled !");
                        }
                    });
            }
            function edit(id, name){
                let contentId = `#categoryName_`+ id;
                $(contentId).html(`<div style="float: left; padding: 2px; border: 1px solid grey; width: 100%"><input style="width: 82%" id="edit_`+ id +`" type="text" value="`+ name +`"/>`
                    + `<button type="button" title="Submit" onClick="submit(`+id+`)" class="btn btn-success btn-sm"><i class="fa fa-check"></i></button>`
                    + `<button type="button" title="Cancel" onClick="cancel(`+id+`,'`+name+`')" class="btn btn-danger btn-sm"><i class="fa fa-close"></i></button></div>`
                );
            }
            function cancel(id, content){
                let contentId = `#categoryName_`+ id;
                $(contentId).html(content);
            }

            function submit(id){
                let editId = `#edit_`+ id;
                let newValue = $(editId).val();

                if ( id != "" && newValue != "") {
                    let data = {
                        "idCategory": id,
                        "categoryName": newValue,
                    };
                    $.ajax({
                        url: "${pageContext.request.contextPath }/api/category/save",
                        method: "POST",
                        data: JSON.stringify(data),
                        contentType: "application/json",
                        dataType: 'json',
                        success: function(res) {
                            swal({
                                title: "Hoàn thành",
                                text: "Thông tin đã được cập nhật thành công !",
                                icon: "success",
                                buttons: "OK",
                            }).then(() => {
                                cancel(id, newValue);
                            });
                        },
                        error: function() {
                            swal({
                                title: "Fail",
                                text: "Đã có lỗi xảy ra !!",
                                icon: "error",
                                buttons: "OK",
                            })
                        }
                    })
                } else {
                    swal({
                        title: "Fail",
                        text: "Không thể để trống thông tin !!",
                        icon: "error",
                        buttons: "OK",
                    }).then(() => {
                        location.reload();
                    });
                }
            }
        </script>
	</jsp:attribute>
</tmp:adminTemplate>