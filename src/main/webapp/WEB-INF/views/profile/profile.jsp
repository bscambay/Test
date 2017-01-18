<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- BEGIN BLANK PAGE PORTLET-->
<div class="profile">
	<div class="profile-head" id="de-header">
		<div class="span4">
			<h1>${user.name}</h1>
			<p>${user.jobTitle}</p>
		</div>

		<div class="span4">
			<ul class="social-link-pf">
				<li><a href="#"> <i class="icon-skype"></i>
				</a></li>
				<li><a href="#"> <i class="icon-bitbucket"></i>
				</a></li>
				<li><a href="mailto:${user.emailAddress}"> <i
						class="icon-envelope-alt"></i>
				</a></li>
			</ul>
		</div>

		<div class="span4">
			<a data-ng-click="editProfile()"
				class="btn btn-edit btn-large pull-right mtop20"> Edit Profile </a>
		</div>
	</div>
</div>

<div class="widget">
	<div class="widget-body bio">

		<!-- DISPLAY CURRENT USER DATA STORED IN DATABASE -->
		<p><label>Name </label>: ${user.name}</p>
		<p><label>PIN </label>: ${user.pin}</p>
		<p><label>Roles</label>
		
			<c:forEach items="${user.roles}" var="role">
				&bull; ${role.name}&mdash;${role.description} <br><label></label>
			</c:forEach>
		
		</p>
		<p><label>Desk Phone </label>: ${user.deskPhone}</p>
		<p><label>Email Address </label>: ${user.emailAddress}</p>
		<p><label>Job Title </label>: ${user.jobTitle}</p>
		<p><label>Division </label>: ${user.division}</p>
		<p><label>Branch </label>: ${user.branch}</p>
		<p><label>Location </label>: ${user.physicalLocation}</p>

	</div>
	<!-- END WIDGET BODY -->
</div>
<!-- END BLANK PAGE PORTLET -->