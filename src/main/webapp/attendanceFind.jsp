<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>员工管理系统-考勤查询</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Font Awesome -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/fontawesome-free/css/all.min.css">
		<!-- Ionicons -->
		<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<!-- Tempusdominus Bbootstrap 4 -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
		<!-- iCheck -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
		<!-- JQVMap -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jqvmap/jqvmap.min.css">
		<!-- Theme style -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/adminlte.min.css">
		<!-- overlayScrollbars -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
		<!-- Daterange picker -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
		<!-- summernote -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/summernote/summernote-bs4.css">
		<!-- Google Font: Source Sans Pro -->
		<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	</head>

	<body class="hold-transition sidebar-mini layout-fixed">
		<div class="wrapper">

			<!-- Navbar -->
			<nav class="main-header navbar navbar-expand navbar-white navbar-light">

				<!-- Right navbar links -->
				<ul class="navbar-nav ml-auto">
					<!-- Messages Dropdown Menu -->

					<!-- Notifications Dropdown Menu -->

					<li class="nav-item">
						<a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#">

						</a>
					</li>
				</ul>
			</nav>
			<!-- /.navbar -->

			<!-- Main Sidebar Container -->
			<aside class="main-sidebar sidebar-dark-primary elevation-4">
				<!-- Brand Logo -->
				<a href="index3.html" class="brand-link">
					<img src="${pageContext.request.contextPath}/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
					<span class="brand-text font-weight-light">员工管理系统</span>
				</a>

				<!-- Sidebar -->
				<div class="sidebar">
					<!-- Sidebar user panel (optional) -->
					<!--  <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Alexander Pierce</a>
        </div>
      </div> -->

					<!-- Sidebar Menu -->
					<nav class="mt-2">
						<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
							<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
							<li   class="nav-item" >
								<a href="${pageContext.request.contextPath}/StaffManageController/getStaffInfo" class="nav-link">
									<i class="nav-icon fas fa-book"></i>
									<p>
										员工档案管理

									</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/StaffManageController/getDepartmentInfo" class="nav-link">
									<i class="nav-icon fas fa-th"></i>
									<p>
										部门信息管理

									</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/attendanceController/routeAttendance" class="nav-link">
									<i class="nav-icon fas fa-th"></i>
									<p>
										考勤查询

									</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/attendanceController/routeAttendanceRate" class="nav-link">
									<i class="nav-icon fas fa-th"></i>
									<p>
										考勤率及评优

									</p>
								</a>
							</li>
						</ul>
					</nav>
					<!-- /.sidebar-menu -->
				</div>
				<!-- /.sidebar -->
			</aside>

			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->

				<!-- /.content-header -->

				<!-- Main content -->
				<section class="content">
					<div class="container-fluid">
						<div class="row">
							<!-- left column -->
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">考勤查询</h3>
									</div>
									<!-- /.card-header -->
									<div class="card-body">
										<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
											<div class="row">
												<div class="col-sm-12 col-md-6"></div>
												<div class="col-sm-12 col-md-6"></div>
											</div>
											<div class="row">
												<div class="col-sm-12">
												
													<form action="${pageContext.request.contextPath}/attendanceController/getAttendance" method="post">
														<div class="form-group">
															<label>选择时间</label>

															<div class="input-group">
																<div class="input-group-prepend">
																<span class="input-group-text">
													                        <i class="far fa-calendar-alt"></i>
													                      </span>
																</div>
																<input type="text" name="time" class="form-control float-right" id="reservation">
															</div>
															<!-- /.input group -->
														</div>
														<div class="form-group">
															<label>选择部门</label>
															<select class="form-control" name="department">
																<option value="---">---</option>
																<c:forEach items="${departenmentList}" var="li">
																	<option value="${li.departmentName}" >${li.departmentName}</option>
																</c:forEach>
															</select>
														</div>
														<div class="form-group">
															<label for="exampleInputEmail1">输入员工名字</label>
															<input type="text" class="form-control" name="name" id="exampleInputEmail1" placeholder="输入员工名字">
														</div>
														<div class="card-footer">
															<button type="submit" class="btn btn-primary">查询</button>
														</div>
													</form>
													<table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
														<thead>
															<tr role="row">
																<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">员工姓名</th>
																<%--<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">所属部门</th>--%>
																<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">时间</th>
																<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">状态</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${list}" var="li">
																<tr role="row" class="odd">
																	<td class="sorting_1">${li.name}</td>
																	<%--<td>${li.department}</td>--%>
																	<td>${li.time}</td>
																	<td>${li.state}</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>

										</div>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->
							</div>
							</form>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card-body -->
			</div>
			<!-- /.card -->
		</div>
		<!--/.col (right) -->
		</div>
		<!-- /.row -->
		</div>
		</section>
		<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
		</div>
		<!-- ./wrapper -->

		<!-- jQuery -->
		<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.min.js"></script>
		<!-- jQuery UI 1.11.4 -->
		<script src="${pageContext.request.contextPath}/plugins/jquery-ui/jquery-ui.min.js"></script>
		<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
		<script>
			$.widget.bridge('uibutton', $.ui.button)
		</script>
		<!-- Bootstrap 4 -->
		<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- ChartJS -->
		<script src="${pageContext.request.contextPath}/plugins/chart.js/Chart.min.js"></script>
		<!-- Sparkline -->
		<script src="${pageContext.request.contextPath}/plugins/sparklines/sparkline.js"></script>
		<!-- JQVMap -->
		<script src="${pageContext.request.contextPath}/plugins/jqvmap/jquery.vmap.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
		<!-- jQuery Knob Chart -->
		<script src="${pageContext.request.contextPath}/plugins/jquery-knob/jquery.knob.min.js"></script>
		<!-- daterangepicker -->
		<script src="${pageContext.request.contextPath}/plugins/moment/moment.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
		<!-- Tempusdominus Bootstrap 4 -->
		<script src="${pageContext.request.contextPath}/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
		<!-- Summernote -->
		<script src="${pageContext.request.contextPath}/plugins/summernote/summernote-bs4.min.js"></script>
		<!-- overlayScrollbars -->
		<script src="${pageContext.request.contextPath}/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
		<!-- AdminLTE App -->
		<script src="${pageContext.request.contextPath}/dist/js/adminlte.js"></script>
		<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
		<script src="${pageContext.request.contextPath}/dist/js/pages/dashboard.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>
		<!-- jQuery -->
		<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.min.js"></script>
		<!-- Bootstrap 4 -->
		<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Select2 -->
		<script src="${pageContext.request.contextPath}/plugins/select2/js/select2.full.min.js"></script>
		<!-- Bootstrap4 Duallistbox -->
		<script src="${pageContext.request.contextPath}/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
		<!-- InputMask -->
		<script src="${pageContext.request.contextPath}/plugins/moment/moment.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
		<!-- date-range-picker -->
		<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
		<!-- bootstrap color picker -->
		<script src="${pageContext.request.contextPath}/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
		<!-- Tempusdominus Bootstrap 4 -->
		<script src="${pageContext.request.contextPath}/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
		<!-- Bootstrap Switch -->
		<script src="${pageContext.request.contextPath}/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
		<!-- AdminLTE App -->
		<script src="${pageContext.request.contextPath}/dist/js/adminlte.min.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>
		<!-- Page script -->
		<script>
			$(function() {
				//Initialize Select2 Elements
				$('.select2').select2()
		
				//Initialize Select2 Elements
				$('.select2bs4').select2({
					theme: 'bootstrap4'
				})
		
				//Datemask dd/mm/yyyy
				$('#datemask').inputmask('dd/mm/yyyy', {
					'placeholder': 'dd/mm/yyyy'
				})
				//Datemask2 mm/dd/yyyy
				$('#datemask2').inputmask('mm/dd/yyyy', {
					'placeholder': 'mm/dd/yyyy'
				})
				//Money Euro
				$('[data-mask]').inputmask()
		
				//Date range picker
				$('#reservation').daterangepicker()
				//Date range picker with time picker
				$('#reservationtime').daterangepicker({
					timePicker: true,
					timePickerIncrement: 30,
					locale: {
						format: 'MM/DD/YYYY hh:mm A'
					}
				})
				//Date range as a button
				$('#daterange-btn').daterangepicker({
						ranges: {
							'Today': [moment(), moment()],
							'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
							'Last 7 Days': [moment().subtract(6, 'days'), moment()],
							'Last 30 Days': [moment().subtract(29, 'days'), moment()],
							'This Month': [moment().startOf('month'), moment().endOf('month')],
							'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
						},
						startDate: moment().subtract(29, 'days'),
						endDate: moment()
					},
					function(start, end) {
						$('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
					}
				)
		
				//Timepicker
				$('#timepicker').datetimepicker({
					format: 'LT'
				})
		
				//Bootstrap Duallistbox
				$('.duallistbox').bootstrapDualListbox()
		
				//Colorpicker
				$('.my-colorpicker1').colorpicker()
				//color picker with addon
				$('.my-colorpicker2').colorpicker()
		
				$('.my-colorpicker2').on('colorpickerChange', function(event) {
					$('.my-colorpicker2 .fa-square').css('color', event.color.toString());
				});
		
				$("input[data-bootstrap-switch]").each(function() {
					$(this).bootstrapSwitch('state', $(this).prop('checked'));
				});
		
			})
		</script>
	</body>
</html>