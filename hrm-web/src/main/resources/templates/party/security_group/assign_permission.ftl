<!DOCTYPE html>
<html>
<head>
  <title>分配权限组权限</title>
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
       ${securityGroup.id!''}
       <small>${securityGroup.description!''}</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="#">团体</a></li>
        <li class="active">分配权限组权限</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">已分配权限</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
				<table id="dataTable1" class="table table-bordered table-hover">
	                <thead>
	                <tr>
	                  <th>ID</th>
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
        
        <div class="col-md-6">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">可分配权限</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
				<table id="dataTable2" class="table table-bordered table-hover">
	                <thead>
	                <tr>
	                  <th>ID</th>
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
            pageLength: 15,  //首次加载的数据条数
            ordering: false, //排序操作在服务端进行，所以可以关了。
            //pagingType: "full_numbers",
            autoWidth: false,
            //stateSave: true,//保持翻页状态，和comTable.fnDraw(false);结合使用
            searching: false,//禁用datatables搜索
            ajax: {   
                type: "post",
                url: "${springMacroRequestContext.contextPath}/party/security_permission/assigned_permissions",
                dataSrc: "data",
                   data: function (d) {
                       var param = {};
                       param.groupId = '${securityGroup.id!''}';
                       param.draw = d.draw;
                       param.start = d.start;
                       param.length = d.length;
                       //var formData = $("#queryForm").serializeArray();//把form里面的数据序列化成数组
                       //formData.forEach(function (e) {
                       //    param[e.name] = e.value;
                       //});
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
					var html = "<a href='${springMacroRequestContext.contextPath}/party/security_group/assign_permission?id="+id+"'  class='down btn btn-default btn-xs'  ><i class='fa fa-remove'></i> 移除</a>" 
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


        var tables2 = $("#dataTable2").dataTable({
            serverSide: true,//分页，取数据等等的都放到服务端去
            processing: true,//载入数据的时候是否显示“载入中”
            pageLength: 15,  //首次加载的数据条数
            ordering: false, //排序操作在服务端进行，所以可以关了。
            //pagingType: "full_numbers",
            autoWidth: false,
            //stateSave: true,//保持翻页状态，和comTable.fnDraw(false);结合使用
            searching: false,//禁用datatables搜索
            ajax: {   
                type: "post",
                url: "${springMacroRequestContext.contextPath}/party/security_permission/candidate_permissions",
                dataSrc: "data",
                   data: function (d) {
                       var param = {};
                       param.groupId = '${securityGroup.id!''}';
                       param.draw = d.draw;
                       param.start = d.start;
                       param.length = d.length;
                       //var formData = $("#queryForm").serializeArray();//把form里面的数据序列化成数组
                       //formData.forEach(function (e) {
                       //    param[e.name] = e.value;
                       //});
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
					var html = "<a href='${springMacroRequestContext.contextPath}/party/security_group/assign_permission?id="+id+"'  class='down btn btn-default btn-xs'  ><i class='fa fa-exchange'></i> 添加到组</a>" 
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