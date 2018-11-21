<!DOCTYPE html>
<html>
<head>
  <title>权限组管理</title>
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
        权限组列表
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="#">团体</a></li>
        <li class="active">权限组列表</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="row-fluid"> 
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
                  <th>描述</th>
                  <th>操作</th>
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
                url: "${springMacroRequestContext.contextPath}/party/security_group/list",
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
                {"data": "description"}
            ],
			"columnDefs" : [ { 
				// 定义操作列,######以下是重点######## 
				"targets" : 2,//操作按钮目标列 
				"data" : null, 
				"render" : function(data, type,row) { 
					var id = row.id; 
					var html = "<a href='${springMacroRequestContext.contextPath}/party/security_group/assign_permission?id="+id+"'  class='down btn btn-default btn-xs'  ><i class='fa fa-link'></i> 分配权限</a>" 
					html += "<a href='javascript:void(0);' class='up btn btn-default btn-xs'><i class='fa fa-edit'></i> 编辑</a>" 
					html += "<a href='javascript:void(0);'   onclick='deleteThisRowPapser("+ id + ")'  class='delete btn btn-default btn-xs'><i class='fa fa-times'></i> 删除</a>" 
					return html; 
				} 
			} ],
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

    });
</script>
</body>
</html>