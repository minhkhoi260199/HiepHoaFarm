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
                                    <h3 class="title-5 m-t-10">QUẢN LÝ SẢN PHẨM</h3>
                                    <input type="hidden" id="countProduct" value="${countProduct}">
                                </div>
                                <div class="table-data__tool-right">
                                    <button id="addNew" type="button" class="au-btn au-btn-icon au-btn--green au-btn--small"
                                            data-toggle="modal" data-target="#scrollmodal">
                                        <i class="fa fa-plus"></i>Thêm sản phẩm mới
                                    </button>
                                </div>
                            </div>
                            <div class="table-responsive m-b-40">
                                <table class="table table-borderless table-data3">
                                    <thead>
                                    <tr>
                                        <th>Sửa</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Ảnh</th>
                                        <th>Số lượng</th>
                                        <th>Giá</th>
                                        <th>Đơn vị</th>
                                        <th>Danh mục</th>
                                        <th>Ngày tạo</th>
                                        <th>Trạng thái</th>
                                        <th>Đổi</th>
                                        <th>Xoá</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tableBody">
                                    <c:forEach var="product" items="${products}">
                                        <script>
                                            let prData${product.idProduct} = {
                                                "idProduct" : "${product.idProduct}",
                                                "productName" : "${product.productName}",
                                                "categoryId" : "${product.categoryByCategoryId.idCategory}",
                                                "productPrice" : "${product.productPrice}",
                                                "saleUnit" : "${product.saleUnit}",
                                                "description" : "${product.description}",
                                                "statusId" : "${product.statusByStatusId.idStatus}",
                                                "createdTime" : "${product.createdTime}",
                                                "quantity" : "${product.quantity}"
                                            }
                                        </script>
                                    <tr>
                                        <td>
                                            <div class="table-data-feature justify-content-center">
                                                <button class="item" onClick="edit(prData${product.idProduct})" title="Edit">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </div>
                                        </td>
                                        <td>${product.productName}</td>
                                        <td>
                                            <c:forEach begin="0" end="4" var="photo" items="${product.galleriesByIdProduct}">
                                                <img src="${pageContext.request.contextPath }/static/uploads/images/${photo.photo}"
                                                     alt="${photo.photo}"
                                                     style="width: 50px; height: 50px; padding: 2px"
                                                >
                                            </c:forEach>
                                                <button class="btn btn-outline-secondary btn-sm" onClick="editGal(prData${product.idProduct})" title="Edit">
                                                    <i class="fa fa-gear"></i>
                                                </button>
                                        </td>
                                        <td>
                                            <p style="color: #bd2130; font-weight: bold; min-width: 50px">
                                            <button class="btn btn-outline-secondary btn-sm" onClick="editQuantity(prData${product.idProduct})" title="Edit">
                                                <i class="fa fa-pencil"></i>
                                            </button>
                                                &emsp;&emsp;&emsp;${product.quantity}
                                            </p>
                                        </td>
                                        <td>${product.productPrice}</td>
                                        <td>${product.saleUnit}</td>
                                        <td>${product.categoryByCategoryId.categoryName}</td>
                                        <td>${product.createdTime}</td>
                                        <c:if test="${product.statusByStatusId.idStatus == 1 }">
                                        <td class="process" id="statusName${product.idProduct}">${product.statusByStatusId.statusNameVie}</td>
                                        <td>
                                            <button id="statusButton${product.idProduct}" class="btn btn-outline-danger btn-sm" onclick="setStatus(prData${product.idProduct},'disable')" title="Vô hiệu">
                                                <i class="fa fa-window-close"></i>
                                            </button>
                                        </td>
                                        </c:if>
                                        <c:if test="${product.statusByStatusId.idStatus == 2 }">
                                        <td class="denied" id="statusName${product.idProduct}">${product.statusByStatusId.statusNameVie}</td>
                                        <td>
                                            <button id="statusButton${product.idProduct}" class="btn btn-outline-success btn-sm" onclick="setStatus(prData${product.idProduct},'enable')" title="Kích hoạt">
                                                <i class="fa fa-rocket"></i>
                                            </button>
                                        </td>
                                        </c:if>
                                        <td>
                                            <div class="table-data-feature justify-content-center">
                                                <button class="item" onClick="remove(${product.idProduct})"  title="Delete">
                                                    <i class="fa fa-trash"></i>
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
                            <c:if test="${fn:length(products) == 0}">
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

        <!-- modal create product -->
        <div class="modal fade" id="scrollmodal" tabindex="-1" role="dialog" aria-labelledby="scrollmodalLabel"
             aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="scrollmodalLabel">THÊM SẢN PHẨM MỚI</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <input type="hidden" id="productId" value="">
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="productName" class=" form-control-label">Tên sản phẩm:</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="productName" name="productName" placeholder="Nhập tên sản phẩm" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="category" class="form-control-label">Danh mục:</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <select name="category" id="category" class="form-control">
                                    </select>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="quantity" class="form-control-label">Số lượng:</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="number" id="quantity" name="quantity" placeholder="Số lượng sản phẩm" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="productPrice" class=" form-control-label">Giá sản phẩm:</label>
                                </div>
                                <div class="col-12 col-md-4">
                                    <input type="text" id="productPrice" name="productPrice" placeholder="*Chỉ nhập số* Ví dụ '100000'" class="form-control">
                                </div>
                                <div class="col col-md-2">
                                    <label for="unit" class=" form-control-label">Đơn vị bán:</label>
                                </div>
                                <div class="col-12 col-md-3">
                                    <input type="text" id="unit" name="unit" placeholder="Kg/G/Hộp/..." class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="description" class=" form-control-label">Mô tả sản phẩm:</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <textarea name="description" id="description" rows="7" placeholder="Content..." class="form-control"></textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer" id="productActionButton">
                    </div>
                </div>
            </div>
        </div>
        <!-- end modal create product  -->
        <!-- modal static addGallery -->
        <div class="modal fade" id="staticModal" tabindex="-1" role="dialog" aria-labelledby="staticModalLabel" aria-hidden="true"
             data-backdrop="static">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticModalLabel">HÌNH ẢNH SẢN PHẨM</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="" id="galleryForm" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <input type="hidden" id="productIdGal" name="productIdGal" value="">
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="gallery" class=" form-control-label">Ảnh mô tả hiện tại:</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <div id="preview" style="border: 1px solid gray; margin-bottom: 5px;"></div>
                                    <input type="file" id="gallery" name="gallery" multiple="" class="form-control-file">
                                    <small class="form-text text-muted">* jpeg | jpg | png | gif *</small>
                                    <small class="form-text text-muted">- Chọn ảnh vuông (Ví dụ 50x50px hay 150x150px)</small>
                                    <small class="form-text text-muted">- Dung lượng ảnh không quá 10MB</small>
                                    <small class="form-text text-muted">- Ảnh đầu tiên sẽ được chọn làm ảnh đại diện</small>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" onclick="saveGal()" class="btn btn-primary">Lưu ảnh</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- end modal static addGallery-->
        <!-- modal static edit quantity -->
        <div class="modal fade" id="staticModalQuantity" tabindex="-1" role="dialog" aria-labelledby="staticModalQuantityLabel" aria-hidden="true"
             data-backdrop="static">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticModalQuantityLabel">SỬA SỐ LƯỢNG SẢN PHẨM</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="" id="quantityForm" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <input type="hidden" id="productIdQuantity" name="productIdQuantity" value="">
                            <input style="border: 1px solid gray; width: 100%; padding: 10px" type="number" id="editQuantity" name="quantity" value="">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" onclick="saveQuantity()" class="btn btn-primary">Lưu số lượng mới</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- end modal static edit quantity-->
        <script type="text/javascript">
            // Pagination
            let total = $('#countProduct').val();
            const pagination = new tui.Pagination('pagination', {
                totalItems: parseInt(total),
                itemsPerPage: 5,
                visiblePages: 5
            });
            // Load table
            pagination.movePageTo(${setCurrentPage});
            pagination.on('afterMove', (event) => {
                const currentPage = event.page;
                console.log(currentPage);
                let datas = {
                    "page" : currentPage,
                    "size" : 5,
                    "sort" : "DESC",
                }
                $(location).attr('href','infos?page='+datas.page+'&size='+datas.size);
                <%--$.ajax({--%>
                <%--    url: "${pageContext.request.contextPath }/api/product/load",--%>
                <%--    method: "GET",--%>
                <%--    data: datas,--%>
                <%--    success: function(res) {--%>
                <%--        res.forEach(cat => {--%>

                <%--        })--%>
                <%--    }--%>
                <%--});--%>
            });

            // addNew button clicked
            $('#addNew').on("click", function(){
                $('#scrollmodalLabel').html("THÊM SẢN PHẨM MỚI");
                $('#productId').val("");
                $('#productName').val("");
                $('#productPrice').val("");
                $('#unit').val("");
                $('#description').val("");
                $('#productActionButton').html("");
                $('#productActionButton').append('<button type="button" class="btn btn-secondary" data-dismiss="modal">Huỷ</button>'
                                                +'<button type="button" onclick="save()" class="btn btn-primary">Lưu thông tin</button>');
            })
            //Load catagoryList
            $('#scrollmodal').on("show.bs.modal", function() {
                $('#category').html('<option disabled selected>Chọn danh mục...</option>');
                $.ajax({
                    url: "${pageContext.request.contextPath }/api/category/getAll",
                    method: "GET",
                    success: function(res) {
                        res.forEach(cat => {
                            $('#category').append( new Option(cat.categoryName, cat.idCategory));
                        })
                    }
                });
            });
            //Load gallery dal
            $('#staticModal').on("show.bs.modal", function() {
                $('#preview').html("");
                $('#gallery').val("");
                if($('#productId').val() != ""){
                    let datas = {
                        "id" : $('#productIdGal').val()
                    }
                    $.ajax({
                        url: "${pageContext.request.contextPath }/api/product/gallery",
                        method: "POST",
                        data: datas,
                        success: function(res) {
                            res.forEach(item => {
                                let image = new Image();
                                image.style = "padding: 5px; margin: 1px; border: 1px solid gray; width:111px; height:111px";
                                image.title  = item.photo;
                                image.src    = "${pageContext.request.contextPath }/static/uploads/images/"+item.photo;
                                $('#preview').append(image);
                            })
                        }
                    });
                }
            });
            //Review gallery before upload
            $('#gallery').on("change",function() {
                $('#preview').html("");
                if (this.files) {
                    [].forEach.call(this.files, readAndPreview);
                }
                function readAndPreview(file) {
                    // Make sure `file.name` matches our extensions criteria
                    if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
                        swal({
                            title: "File không được hỗ trợ",
                            text: file.name + " không phải là hình ảnh",
                            icon: "warning",
                            buttons: "OK",
                        }).then(() => {
                            $('#preview').html("");
                            $('#gallery').val("");
                        });
                    } else {
                        let reader = new FileReader();
                        reader.addEventListener("load", function() {
                            let image = new Image();
                            image.style = "padding: 5px; margin: 1px; border: 1px solid gray; width:111px; height:111px";
                            image.title  = file.name;
                            image.src    = this.result;
                            $('#preview').append(image);
                        });
                        reader.readAsDataURL(file);
                    }
                }
            });
            function edit(product){
                console.log(product);
                $('#scrollmodal').modal('show');
                $('#scrollmodalLabel').html("CHỈNH SỬA THÔNG TIN SẢN PHẨM '"+product.productName+"'");
                $('#productActionButton').html("");
                $('#productActionButton').append('<button type="button" class="btn btn-secondary" data-dismiss="modal">Huỷ</button>'
                    +'<button type="button" onclick="save('
                    +'prData'+product.idProduct
                    +')" class="btn btn-primary">Lưu thông tin</button>');

                $('#productId').val(product.idProduct);
                $('#productName').val(product.productName);
                $('#quantity').val(product.quantity);
                $('#productPrice').val(product.productPrice);
                $('#unit').val(product.saleUnit);
                $('#description').val(product.description);
                setTimeout(() => {$('#category').val(product.categoryId)}, 350); //Wait for category list to load
            }
            function save(clone){
                console.log("Clone: " + JSON.stringify(clone));
                let productId = $('#productId').val();
                let productName = $('#productName').val();
                let category = $('#category').val();
                let quantity = $('#quantity').val();
                let price = $('#productPrice').val();
                let unit = $('#unit').val();
                let description = $('#description').val();
                if(productName != "" && price != "" && description != "" && unit != "" && quantity != ""){
                    if(category != null) {
                        if(!isNaN(price)){
                            let data = {
                                "idProduct" : productId,
                                "productName" : productName,
                                "categoryId" : category,
                                "productPrice" : price,
                                "saleUnit" : unit,
                                "statusId" : 1,
                                "description" : description,
                                "quantity" : quantity
                            }
                            console.log("Data: " + JSON.stringify(data));
                            if(JSON.stringify(data) !== JSON.stringify(clone)){
                                $.ajax({
                                    url: "${pageContext.request.contextPath }/api/product/save",
                                    method: "POST",
                                    data: JSON.stringify(data),
                                    contentType: "application/json",
                                    dataType: 'json',
                                    success: function(product) {
                                        if($('#productId').val() == ""){
                                            swal({
                                                title: "Lưu '"+product.productName+"' thành công",
                                                text: "Tiếp tục thêm hình ảnh cho '"+product.productName+"' chứ ?",
                                                icon: "success",
                                                buttons: "OK",
                                            }).then(() => {
                                                $('#productIdGal').val(product.idProduct);
                                                $('#staticModalLabel').html("THÊM HÌNH ẢNH CHO '"+product.productName+"'");
                                                $('#scrollmodal').modal('hide');
                                                $('#staticModal').modal('show');
                                            });
                                        } else {
                                            swal({
                                                title: "Cập nhật '"+product.productName+"' thành công",
                                                icon: "success",
                                                buttons: "OK",
                                            }).then(() => {
                                                location.reload();
                                            });
                                        }
                                    },
                                    error: function() {
                                        swal({
                                            title: "Fail",
                                            text: "Đã có lỗi xảy ra !!",
                                            icon: "error",
                                            buttons: "OK",
                                        }).then(() => {
                                            $('#scrollmodal').modal('hide');
                                        });
                                    }
                                })
                            } else {
                                swal({
                                    title: "Thông tin không đổi",
                                    icon: "info",
                                });
                            }
                        } else {
                            swal({
                                title: "Cảnh báo nhập sai giá",
                                text: "Giá sản phẩm phải nhập số !!",
                                icon: "warning",
                                buttons: "OK",
                            })
                        }
                    } else {
                        swal({
                            title: "Cảnh báo thiếu danh mục",
                            text: "Hãy chọn danh mục !!",
                            icon: "warning",
                            buttons: "OK",
                        })
                    }
                } else {
                    swal({
                        title: "Cảnh báo thiếu thông tin",
                        text: "Hãy điền đủ tất cả thông tin !!",
                        icon: "warning",
                        buttons: "OK",
                    })
                }
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
                                    url: "${pageContext.request.contextPath }/api/product/delete?id="+id,
                                    method: "POST",
                                    success: function(res) {
                                    }
                                })
                                swal("Đã xoá sản phẩm thành công!", {
                                    icon: "success",
                                }).then(() => {
                                    location.reload();
                                });
                            }
                        } else {
                            swal({title:"Canceled !"});
                        }
                    });
            }
            function editGal(product){
                $('#staticModalLabel').html("TUỲ CHỈNH ẢNH CHO '"+product.productName+"'");
                $('#productIdGal').val(product.idProduct);
                $('#productId').val(product.idProduct);
                $('#staticModal').modal('show');
            }
            function saveGal() {
                if($('#gallery').val() == ""){
                    $('#staticModal').modal('hide');
                    swal({
                        title: "Hình ảnh không đổi",
                        icon: "info",
                    });
                } else {
                    swal({
                        title: "Xác nhận lưu hình ảnh ?",
                        text: "Những ảnh cũ (nếu có) sẽ được thay thế bằng ảnh mới",
                        icon: "warning",
                        buttons: ["Huỷ !", "Xác nhận"],
                        dangerMode: true,
                    })
                        .then((confirmSubmit) => {
                            if (confirmSubmit) {
                                let form = $('#galleryForm')[0]; //get the form containing the files
                                let datas = new FormData(form);
                                $.ajax({
                                    url: "${pageContext.request.contextPath }/api/product/saveGal",
                                    type: "POST",
                                    enctype: 'multipart/form-data',
                                    data: datas, //pass the form data
                                    processData: false,
                                    contentType: false,
                                    success: function () {
                                        swal({
                                            title: "Thành công",
                                            text: "Lưu ảnh thành công !!",
                                            icon: "success",
                                            buttons: "OK",
                                        }).then(() => {
                                            location.reload();
                                        });
                                    },
                                    error: function () {
                                        swal({
                                            title: "Fail",
                                            text: "Đã có lỗi xảy ra !!",
                                            icon: "error",
                                            buttons: "OK",
                                        }).then(() => {
                                            $('#staticModal').modal('hide');
                                        });
                                    }
                                });
                            } else {
                                swal({title: "Đã huỷ !",icon: "success"});
                            }
                        });
                }
            }
            function editQuantity(product){
                $('#staticModalQuantityLabel').html("SỐ LƯỢNG SẢN PHẨM CỦA '"+product.productName+"'");
                $('#productIdQuantity').val(product.idProduct);
                $('#editQuantity').val(product.quantity);
                $('#staticModalQuantity').modal('show');
            }
            function saveQuantity() {
                if($('#editQuantity').val() == ""){
                    $('#staticModalQuantity').modal('hide');
                    swal({
                        title: "Số lượng không đổi",
                        icon: "info",
                    });
                } else {
                    swal({
                        title: "Xác nhận lưu số lượng mới ?",
                        icon: "warning",
                        buttons: ["Huỷ !", "Xác nhận"],
                        dangerMode: true,
                    })
                        .then((confirmSubmit) => {
                            if (confirmSubmit) {
                                let productId = $('#productIdQuantity').val();
                                let quantity =$('#editQuantity').val();
                                $.ajax({
                                    url: "${pageContext.request.contextPath }/api/product/setQuantity?id="+productId+"&quantity="+quantity,
                                    type: "GET",
                                    success: function () {
                                        swal({
                                            title: "Thành công",
                                            text: "Lưu ảnh thành công !!",
                                            icon: "success",
                                            buttons: "OK",
                                        }).then(() => {
                                            location.reload();
                                        });
                                    },
                                    error: function () {
                                        swal({
                                            title: "Fail",
                                            text: "Đã có lỗi xảy ra !!",
                                            icon: "error",
                                            buttons: "OK",
                                        }).then(() => {
                                            $('#staticModalQuantity').modal('hide');
                                        });
                                    }
                                });
                            } else {
                                swal({title: "Đã huỷ !",icon: "success"});
                            }
                        });
                }
            }
            function setStatus(product, action){
                let comp;
                let confirm = new Promise((resolve, reject) => {
                    if(action == "enable"){
                        swal({
                            title: "Kích hoạt sản phẩm ?",
                            text: "Thông tin về sản phẩm sẽ xuất hiện lại trên gian hàng !",
                            icon: "info",
                            buttons: ["Huỷ !", "Xác nhận"],
                        }).then((confirmSubmit) => {
                            if (confirmSubmit) {
                                comp = {
                                    "onclick" : "setStatus(prData"+product.idProduct+",'disable')",
                                    "title" : "Vô hiệu",
                                    "button" : "<i class='fa fa-window-close'></i>",
                                    "buttonRemoveClass" : "btn-outline-success",
                                    "buttonAddClass" : "btn-outline-danger",
                                    "label" : "kích Hoạt",
                                    "labelRemoveClass" : "denied",
                                    "labelAddClass" : "process"
                                };
                                product.statusId = 1;
                                return resolve(true);
                            }
                        });
                    } else if (action == "disable") {
                        swal({
                            title: "Xác nhận khoá sản phẩm ?",
                            text: "Thông tin về sản phẩm sẽ không còn trên gian hàng !",
                            icon: "warning",
                            buttons: ["Huỷ !", "Xác nhận"],
                            dangerMode: true,
                        }).then((confirmSubmit) => {
                            if (confirmSubmit) {
                                comp = {
                                    "onclick" : "setStatus(prData"+product.idProduct+",'enable')",
                                    "title" : "Kích hoạt",
                                    "button" : "<i class='fa fa-rocket'></i>",
                                    "buttonRemoveClass" : "btn-outline-danger",
                                    "buttonAddClass" : "btn-outline-success",
                                    "label" : "vô hiệu",
                                    "labelRemoveClass" : "process",
                                    "labelAddClass" : "denied"
                                }
                                product.statusId = 2;
                                return resolve(true);
                            }
                        });
                    } else {
                        return reject("Lỗi");
                    }
                });
                confirm.then((flag) => {
                    if(flag){
                        let button = '#statusButton'+product.idProduct;
                        let label = '#statusName'+product.idProduct;
                        $.ajax({
                            url: "${pageContext.request.contextPath }/api/product/setStatus?id="+product.idProduct+"&status="+product.statusId,
                            method: "POST",
                            data: JSON.stringify(product),
                            contentType: "application/json",
                            dataType: 'json',
                            success: function(res) {
                                swal({
                                    title: "Đã "+comp.label+" '"+res.productName+"' thành công !",
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
            $("#searchBy").html("<option>name</option>");
            $("#submitSearch").on('click',()=>{
                let searchBy = $("#searchBy").find(":selected").text();
                let keyword = $("#searchKeyword").val();

                $(location).attr('href','searchProducts?searchBy='+searchBy+'&keyword='+keyword);

                console.log("search ERROR");
                console.log("searchBy: "+searchBy);
                console.log("keyword: "+keyword);
            });
        </script>
	</jsp:attribute>
</tmp:adminTemplate>