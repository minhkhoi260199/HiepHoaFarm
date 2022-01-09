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
                                    <h3 class="title-5 m-t-10">QUẢN LÝ SẢN PHẨM</h3>
                                </div>
                                <div class="table-data__tool-right">
                                    <button id="addNew" type="button" class="au-btn au-btn-icon au-btn--green au-btn--small"
                                            data-toggle="modal" data-target="#scrollmodal">
                                        <i class="zmdi zmdi-plus"></i>Thêm sản phẩm mới
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
                                        <option value="1" disabled selected>Chọn danh mục...</option>
                                    </select>
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
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Huỷ</button>
                        <button type="button" onclick="save()" class="btn btn-primary">Thêm sản phẩm</button>
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
                                        <label for="gallery" class=" form-control-label">Ảnh sản phẩm:</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="file" id="gallery" name="gallery" multiple="" class="form-control-file">
                                        <div id="preview" style="border: 1px solid gray; margin-top: 5px;"></div>
                                        <small class="form-text text-muted">*Có thể chọn nhiều file*</small>
                                        <small class="form-text text-muted">- Kích thước ảnh vuông (Ví dụ 50x50px hoặc 150x150px)</small>
                                        <small class="form-text text-muted">- Hình đầu tiên sẽ được chọn làm đại diện</small>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" onclick="saveGal()" class="btn btn-primary">Thêm ảnh</button>
                        </div>
                    </div>
                </div>
            </div>
        <!-- end modal static addGallery-->
        <script type="text/javascript">
            //Load catagoryList
            $('#addNew').on("click", function() {
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
            //Review gallery
            $('#gallery').on("change",function() {
                $('#preview').html("");
                var preview = document.querySelector('#preview');
                if (this.files) {
                    [].forEach.call(this.files, readAndPreview);
                }
                function readAndPreview(file) {
                    // Make sure `file.name` matches our extensions criteria
                    if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
                        return alert(file.name + " is not an image");
                    } // else...
                    var reader = new FileReader();
                    reader.addEventListener("load", function() {
                        var image = new Image();
                        image.style = "padding: 5px; border: 1px solid gray; width:100px; height:100px";
                        image.title  = file.name;
                        image.src    = this.result;
                        preview.appendChild(image);
                    });
                    reader.readAsDataURL(file);
                }
            });
            function save(){
                let productId = $('#productId').val();
                let productName = $('#productName').val();
                let category = $('#category').val();
                let price = $('#productPrice').val();
                let unit = $('#unit').val();
                let description = $('#description').val();
                if(productName != "" && category != "" && price != "" && description != "" && unit != ""){
                    let data = {
                        "idProduct" : productId,
                        "productName" : productName,
                        "categoryByCategoryId" : {
                            "idCategory" : category,
                        },
                        "productPrice" : price,
                        "saleUnit" : unit,
                        "description" : description,
                    }
                    console.log(data)
                    $.ajax({
                        url: "${pageContext.request.contextPath }/api/product/save",
                        method: "POST",
                        data: JSON.stringify(data),
                        contentType: "application/json",
                        dataType: 'json',
                        success: function(product) {
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
                        title: "Cảnh báo",
                        text: "Hãy điền đủ tất cả thông tin !!",
                        icon: "warning",
                        buttons: "OK",
                    })
                }
            }
            function saveGal() {
                var form = $('#galleryForm')[0]; //get the form containing the files
                var datas = new FormData(form);
                $.ajax({
                    url: "${pageContext.request.contextPath }/api/product/saveGal",
                    type: "POST",
                    enctype: 'multipart/form-data',
                    data: datas, //pass the form data
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        swal({
                            title: "Thành công",
                            text: "Lưu ảnh thành công !!",
                            icon: "success",
                            buttons: "OK",
                        }).then(() => {
                            location.reload();
                        });
                    },
                    error: function (data) {
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
            }
        </script>
	</jsp:attribute>
</tmp:adminTemplate>