<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
				
<div class="row-fluid">
	<div class="span12">
	
		<div class="widget black">
           	<div class="widget-title">
               	<h4><i class="icon-user"></i> Roles</h4>
               	<span class="tools">
               		<div class="btn-group pull-right">
						<button id="editable-sample_new" data-ng-click="addNewRole()" title="Add New Role" class="btn-green">
						<i class="icon-plus"></i> 
						Add Role
						</button>	
					</div>
				</span>
			</div>
            <div class="widget-body">
				
					<table data-datatable="" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>Role ID</th>
								<th>Name</th>
								<th>Description</th>
								<th>Accounts</th>
								<th style="text-align:center; width:30%">Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${roles}" var="role">
								<tr>
									<td>${role.id}</td>
									<td>${role.name}</td>
									<td>${role.description}</td>
									<td>${roleAccounts[role.id]}</td>
									<td style="text-align:center">
										<spring:url value="/roles/${role.id}/delete" var="deleteUrl" />
										
										<button class="btn btn-default">
											<span class="icon-eye-open"></span> View
										</button>
										
										<button class="btn btn-danger" onclick="$('#deleteForm${role.id}').submit();">
											<span class="icon-trash"></span> Delete
										</button>
										
										<form style="visibility: hidden" id="deleteForm${role.id}" method="post" action="${deleteUrl}">
                        					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        				</form>
										
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->