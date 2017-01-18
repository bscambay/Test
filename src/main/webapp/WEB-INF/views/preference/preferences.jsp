<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- BEGIN BLANK PAGE PORTLET-->
<div class="widget profile">
	<div class="widget-title" id="de-header">
		<h4>
			<i class="icon-cog"></i> My Settings
		</h4>
		<span class="tools"> <a href="javascript:;"
			class="icon-chevron-down"></a> <a href="javascript:;"
			class="icon-remove"></a>
		</span>
	</div>
	<div class="widget-body">

		<div class="row-fluid">
			<div class="span12">


				<div class="table-responsive">

					<table class="table table-striped table-bordered table-hover"
						id="preftable">
						<thead>
							<tr>
								<!--							<th>Preference ID</th>
										<th>Account Pin</th> -->
								<th>Background Color</th>
								<th>Font Color</th>
								<th>Font Size</th>
								<th>Font Family</th>
								<th>508 Compliance</th>
								<th> </th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${preferences}" var="preference">
								<c:if
									test="${ preference.accountPin == pageContext.request.userPrincipal.name}">
									<tr>
										<!--  								<td>${preference.preferenceId}</td>
											<td>${preference.accountPin}</td> -->
										<td>${preference.findColor(preference.backgroundColor)}</td>
										<td>${preference.findColor(preference.fontColor)}</td>
										<td>${preference.findSize(preference.fontSize)}</td>
										<td>${preference.findFamily(preference.fontFamily)}</td>
										<td>${preference.compliance508}</td>
										<!--  							<td><input type="submit" data-ng-click="applyBackgroundStyle(${preference.backgroundColor});" name="theme" value="Test Background" id="apply">
											<td><input type="submit" data-ng-click="applyFontStyle(${preference.fontColor});applyFontSize(${preference.fontSize});applyFontFamily(${preference.fontFamily})" name="theme2" value="Test Font" id="apply2"> -->
										<td><input type="submit"
											data-ng-click="applyFontStyle(${preference.fontColor});applyFontSize(${preference.fontSize});applyFontFamily(${preference.fontFamily});applyBackgroundStyle(${preference.backgroundColor});"
											name="theme2" value="Test Settings" id="apply3">
										<td><input type="submit"
											data-ng-click="applyFontStyleGlobally(${preference.fontColor});applyFontSizeGlobally(${preference.fontSize});applyFontFamilyGlobally(${preference.fontFamily});applyBackgroundStyleGlobally(${preference.backgroundColor});"
											name="theme2" value="Apply Globally" id="apply3">
										<td style="text-align: center"><spring:url
												value="/preferences/${preference.preferenceId}/delete"
												var="deleteUrl" />

											<button class="btn btn-danger"
												onclick="$('#deleteForm${preference.preferenceId}').submit();">
												<i class="icon-trash"></i> Delete
											</button>

											<form style="visibility: hidden"
												id="deleteForm${preference.preferenceId}" method="post"
												action="${deleteUrl}">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
											</form></td>

									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="space15"></div>

				<button class="btn btn-success" data-ng-click="addNewPreference()">
					<i class="icon-plus"></i> Configure Preference
				</button>
				<button class="btn btn-danger"
					data-ng-click="applyFontStyle(0);applyBackgroundStyle(1);applyFontSize(14);applyFontFamily(0);">
					<i class="icon-reply"></i> Reset Test
				</button>
				<button class="btn btn-danger"
					data-ng-click="applyFontStyle(0);applyBackgroundStyle(1);applyFontSize(14);applyFontFamily(0);applyFontStyleGlobally(0);applyBackgroundStyleGlobally(1);applyFontSizeGlobally(14);applyFontFamilyGlobally(0)">
					<i class="icon-reply-all"></i> Reset All
				</button>

				<div class="space15"></div>




				<!-- Expandable/Collapsable form for adding new preferences -->
				<div class="widget profile" id="preferenceForm">
					<div class="widget-title" id="de-header">
						<h4>
							<i class="icon-plus"></i> New Preference
						</h4>
						<span class="tools"> <a href="javascript:;"
							class="icon-chevron-down"></a> <a href="javascript:;"
							class="icon-remove"></a>
						</span>
					</div>
					<div class="widget-body">

						<form role="form" id="preferenceSetter">

							<div class="form-group">
								<label>Background Color</label> <select
									data-ng-model="preference.backgroundColor"
									data-ng-init="preference.backgroundColor = '1'">
									<option value="1">White</option>
									<option value="0">Black</option>
									<option value="2">Blue</option>
									<option value="3">Yellow</option>
									<option value="4">Red</option>
									<option value="5">Green</option>
									<option value="6">Purple</option>
									<option value="7">Orange</option>
									<option value="8">Grey</option>
									<option value="9">Gold</option>

								</select>
							</div>

							<div class="form-group">
								<label>Font Color</label> <select
									data-ng-model="preference.fontColor"
									data-ng-init="preference.fontColor = '0'">
									<option value="0">Black</option>
									<option value="1">White</option>
									<option value="2">Blue</option>
									<option value="3">Yellow</option>
									<option value="4">Red</option>
									<option value="5">Green</option>
									<option value="6">Purple</option>
									<option value="7">Orange</option>
									<option value="8">Grey</option>
									<option value="9">Gold</option>

								</select>
							</div>

							<div class="form-group">
								<label>Font Size</label> <select
									data-ng-model="preference.fontSize"
									data-ng-init="preference.fontSize = '14'">
									<option value="12">Small</option>
									<option value="14">Medium</option>
									<option value="22">Large</option>
									<option value="30">Extra Large</option>
								</select>
							</div>

							<div class="form-group">
								<label>Font Family</label> <select
									data-ng-model="preference.fontFamily"
									data-ng-init="preference.fontFamily = '0'">
									<option value="0">Helvetica Neue</option>
									<option value="1">Times New Roman</option>
									<option value="2">Georgia</option>
									<option value="3">Arial</option>
									<option value="4">Arial Black</option>
									<option value="5">Comic Sans MS</option>
									<option value="6">Impact</option>
									<option value="7">Verdana</option>
									<option value="8">Courier New</option>
									<option value="9">Lucida Console</option>

								</select>
							</div>
							
							<div class="form-group">
								<label>
									<input type="checkbox" data-ng-model="preference.compliance508" data-ng-value="true">
								508 Compliance
								</label>
							</div>


							<div class="form-group">
								<button class="btn btn-success"
									data-ng-click="saveNewPreference(${pageContext.request.userPrincipal.name})">
									<i class="icon-save"></i> Save Preferences
								</button>
								<button class="btn btn-danger"
									data-ng-click="cancelNewPreference()">
									<i class="icon-remove"></i> Cancel
								</button>
								<button class="btn btn-success"
									data-ng-click="applyFontStyleNow();applyBackgroundStyleNow();applyFontSizeNow();applyFontFamilyNow()"><i class="icon-ok"></i> Test
									Now</button>
								<button class="btn btn-danger" data-ng-click="setterReset()"><i class="icon-reply"></i> Reset</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

	</div>
</div>
<!-- END BLANK PAGE PORTLET-->