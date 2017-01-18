<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Gold</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />


<link rel='shortcut icon' href='resources/images/gold.png' />

<!-- Bootstrap Core CSS -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />

<!-- MetisMenu CSS -->
<link href="./resources/SBAdmin/vendor/metisMenu/metisMenu.min.css" />

<!-- Custom CSS -->
<link href="./resources/SBAdmin/dist/css/sb-admin-2.css"
	rel="stylesheet" />

<!-- Custom Fonts -->
<link
	href="./resources/SBAdmin/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
	


    <!-- CSS overrides for Gold -->
    <link href="resources/css/gold.css" rel="stylesheet" />
    

</head>
<body id="signInBody">

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0" >
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="./"><img src="resources/images/gold.png"/> Gold</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
			
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">

					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<div id="signInForm">
			<div class="row">
				<div class="col-lg-8">
					<h1 class="page-header"><i class="fa fa-user fa-fw"></i> Sign In</h1>
				</div>
				<!-- /.col-lg-8 -->
			</div>
			<!-- /.row -->

			<div class="row">

				<div class="col-lg-8">

					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-user fa-fw"></i>Please Sign In
						</div>
						<div class="panel-body">
							<c:if test="${not empty error}">
								<div class="alert alert-danger alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<strong>${error}</strong>
								</div>
							</c:if>
							<c:if test="${not empty msg}">
								<div class="alert alert-success alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<strong>${msg}</strong>
								</div>
							</c:if>
							<form class="form-narrow form-horizontal" action="authenticate" method='POST'>
								<fieldset>
									<div class="form-group">
										<label for="inputPin" class="col-lg-2 control-label">PIN</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="inputPin"
												placeholder="PIN" name="username" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-2 control-label">Password</label>
										<div class="col-lg-10">
											<input type="password" class="form-control"
												id="inputPassword" placeholder="Password" name="password" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-lg-offset-2 col-lg-10">
											<button type="submit" class="btn btn-default">Sign
												in</button>
										</div>
									</div>
									<div class="form-group">
										<div class="col-lg-offset-2 col-lg-10">
											<p>
												New here? <a href="signup">Sign Up</a>
											</p>
										</div>
									</div>
								</fieldset>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</form>

						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->

				</div>
				<!-- /.col-lg-8 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="./resources/js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="./resources/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="./resources/SBAdmin/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="./resources/SBAdmin/dist/js/sb-admin-2.js"></script>

</body>
</html>