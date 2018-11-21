<!DOCTYPE html>
<html>
<head>
  <title>团体类型管理</title>
  <#include "/include/header_js_and_css.ftl">

</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

<#include "/include/header-aside.ftl">
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        团体类型列表
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="#">团体</a></li>
        <li class="active">权限列表</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="row-fluid"> 
			<div class="pull-right"> 
				<div class="btn-group"> 
					<button type="button" class="btn btn-primary btn-sm" id="btn-add"> <i class="fa fa-plus"></i> 新增 </button> 
					<button type="button" class="btn btn-primary btn-sm" id="btn-delAll"> <i class="fa fa-remove"></i> 删除 </button> 
					<button type="button" class="btn btn-primary btn-sm" id="btn-export"> <i class="fa fa-sign-in"></i> 导出 </button> 
					<button type="button" class="btn btn-primary btn-sm" id="btn-re"> <i class="fa fa-refresh"></i> 刷新 </button> 
				</div> 
			</div> 
			<div class="row"> 
				<form id="queryForm" action="${springMacroRequestContext.contextPath}/party/security_permission/list" method="post"> 
					<div class="col-xs-2"> 
						<input type="text" id="keyword" name="criteria" class="form-control input-sm" placeholder="ID模糊查询"/> 
					</div> 
					<button type="button" class="btn btn-primary btn-sm" id="btn-query"> <i class="fa fa-search"></i> 查询 </button> 
				</form> 
			</div> 
		</div>
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
              <table id="dataTable1" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>ID</th>
                  <th>描述</th>
                  <th>上级ID</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
<#include "/include/footer.ftl">
</div>
<!-- ./wrapper -->

<#include "/include/footer_js.ftl">
<!-- DataTables -->
<script src="../../bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="../../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- page script -->
<script>
    $(function () {
        //添加、修改异步提交地址
        var url = "";

        var tables = $("#dataTable1").dataTable({
            serverSide: true,//分页，取数据等等的都放到服务端去
            processing: true,//载入数据的时候是否显示“载入中”
            pageLength: 20,  //首次加载的数据条数
            ordering: false, //排序操作在服务端进行，所以可以关了。
            //pagingType: "full_numbers",
            autoWidth: false,
            //stateSave: true,//保持翻页状态，和comTable.fnDraw(false);结合使用
            searching: false,//禁用datatables搜索
            ajax: {   
                type: "post",
                url: "${springMacroRequestContext.contextPath}/party/party_type/list",
                dataSrc: "data",
                   data: function (d) {
                       var param = {};
                       param.draw = d.draw;
                       param.start = d.start;
                       param.length = d.length;
                       var formData = $("#queryForm").serializeArray();//把form里面的数据序列化成数组
                       formData.forEach(function (e) {
                           param[e.name] = e.value;
                       });
                        return param;//自定义需要传递的参数。
                },
            },
            columns: [//对应上面thead里面的序列
                {"data": "id"},
                {"data": "description"},
                {"data": "parentId"}
            ],
            language: {
                lengthMenu: "",
                processing: "加载中",
                paginate: {
                    previous: "上一页",
                    next: "下一页",
                    first: "首页",
                    last: "最后一页"
                },
                zeroRecords: "找不到数据",
                "sInfo" : "从_START_ 到 _END_ 条记录——总记录数为 _TOTAL_ 条",
                infoEmpty: "",
                infoFiltered: "",
                sSearch: "查询",
            }
           });

        //查询按钮
        $("#btn-query").on("click", function () {
            tables.fnDraw();//查询后不需要保持分页状态，回首页
        });

        //添加
        $("#btn-add").on("click", function () {
            url = "${springMacroRequestContext.contextPath}";
            $("input[name=typeId]").val(0);
            $("input[name=typeNameCn]").val("");
            $("input[name=typeNameEn]").val("");
            $("#editModal").modal("show");
        });

        //批量删除
        $("#btn-delAll").on("click", function () {

        });

        //导出
        $("#btn-export").on("click", function () {
        });

        //刷新
        $("#btn-re").on("click", function () {
            tables.fnDraw(false);//刷新保持分页状态
        });

        //checkbox全选
        $("#checkAll").on("click", function () {
            if ($(this).prop("checked") === true) {
                $("input[name='checkList']").prop("checked", $(this).prop("checked"));
                //$("#dataTable tbody tr").addClass('selected');
                $(this).hasClass('selected')
            } else {
                $("input[name='checkList']").prop("checked", false);
                $("#dataTable tbody tr").removeClass('selected');
            }
        });

        //修改
        $("#dataTable tbody").on("click", "#editRow", function () {
            var data = tables.api().row($(this).parents("tr")).data();
            $("input[name=typeId]").val(data.typeIdStr);
            $("input[name=typeNameCn]").val(data.typeNameCn);
            $("input[name=typeNameEn]").val(data.typeNameEn);

            url = "${springMacroRequestContext.contextPath}/update";

            $("#editModal").modal("show");
        });

        $("#btn-submit").on("click", function(){
            $.ajax({
              cache: false,
              type: "POST",
              url: url,
              data:$("#editForm").serialize(),
              async: false,
              error: function(request) {
                  showFail("Server Connection Error...");
              },
              success: function(data) {
                if(data.status == 1){
                    $("#editModal").modal("hide");
                    showSuccess("操作成功");
                    tables.fnDraw();
                }else{
                    showFail("操作失败");
                }
              }
          });
        });

        //删除
        $("#dataTable tbody").on("click", "#delRow", function () {
            var data = tables.api().row($(this).parents("tr")).data();
            if(confirm("是否确认删除这条信息?")){
                $.ajax({
                    url:'${springMacroRequestContext.contextPath}/'+data.typeIdStr,
                    type:'delete',
                    dataType: "json",
                    cache: "false",
                    success:function(data){
                        if(data.status == 1){
                            showSuccess("操作成功");
                            tables.api().row().remove().draw(false);
                        }else{
                            showFail("操作失败");
                        }
                    },
                    error:function(err){
                        showFail("Server Connection Error...");
                    }
                });
            }
        });
    });
</script>
</body>
</html>