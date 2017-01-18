<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="./"><img src="resources/images/gold.png" /> Gold</a>
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
					<h1 class="page-header"><i class="fa fa-user fa-fw"></i>Sign Up</h1>
				</div>
				<!-- /.col-lg-8 -->
			</div>
			<!-- /.row -->

			<div class="row">

				<div class="col-lg-8">

					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-user fa-fw"></i> Sign Up
						</div>
						<div class="panel-body">
							<!-- bind the form to the controller object via modelAttribute -->
							<spring:url value="signup" var="userActionUrl" />
							<form:form class="form-horizontal" method="post" modelAttribute="userForm" action="${userActionUrl}">
								<!--  bind to signupForm.pin -->
								<spring:bind path="pin">
									<div class="form-group ${status.error ? 'has-error' : ''}">
										<label class="col-lg-2 control-label">PIN</label>
										<div class="col-lg-10">
											<form:input path="pin" type="text" class="form-control" id="pin"
												placeholder="6 digit PIN" />
											<form:errors path="pin" class="control-label" />
										</div>
									</div>
								</spring:bind>
								<!-- bind to signupForm.password -->
								<spring:bind path="password">
									<div class="form-group ${status.error ? 'has-error' : ''}">
										<label class="col-lg-2 control-label">Password</label>
										<div class="col-lg-10">
											<form:password path="password" class="form-control" id="password"
												placeholder="Password" />
											<form:errors path="password" class="control-label" />
										</div>
									</div>
								</spring:bind>
								<!-- bind to signupForm.confirmPassword -->
								<spring:bind path="confirmPassword">
									<div class="form-group ${status.error ? 'has-error' : ''}">
										<label class="col-lg-2 control-label">Confirm Password</label>
										<div class="col-lg-10">
											<form:password path="confirmPassword" class="form-control" id="password"
												placeholder="Re-enter Password" />
											<form:errors path="confirmPassword" class="control-label" />
										</div>
									</div>
								</spring:bind>
								<!-- bind to signupForm.name -->
								<spring:bind path="name">
									<div class="form-group ${status.error ? 'has-error' : ''}">
										<label class="col-lg-2 control-label">Name</label>
										<div class="col-lg-10">
											<form:input path="name" type="text" class="form-control" id="name"
												placeholder="First and Last Name" /> 
											<form:errors path="name" class="control-label" />
										</div>
									</div>
								</spring:bind>
									<div class="form-group">
										<div class="col-lg-offset-2 col-lg-10">
											<button type="submit" class="btn btn-default">Sign
												Up</button>
										</div>
									</div>
									<div class="form-group">
										<div class="col-lg-offset-2 col-lg-10">
											<p>
												Already have an account? <a href="signin">Sign In</a>
											</p>
										</div>
									</div>
							</form:form>

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