<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="preferenceHeader.jsp" %>
				
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				Preferences
			</div>
			<div class="panel-body">
			
				<form role="form" id="preftable">
					
					<div class="form-group">
						<label>Background Color</label>
                       <select data-ng-model="preference.backgroundColor" data-ng-init="preference.backgroundColor = '1'">
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
                        <label>Font Color</label>
                        <select data-ng-model="preference.fontColor" data-ng-init="preference.fontColor = '0'">
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
                        <label>Font Size</label>
                        <select data-ng-model="preference.fontSize" data-ng-init="preference.fontSize = '14'">
                       <option value="12">Small</option>
                       <option value="14">Medium</option>
                       <option value="22">Large</option>
                       <option value="30">Extra Large</option>
                       </select>
                    </div>
                    
                    <div class="form-group">
                        <label>Font Family</label>
                        <select data-ng-model="preference.fontFamily" data-ng-init="preference.fontFamily = '0'">
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
                    	<button class="btn btn-primary" data-ng-click="saveNewPreference(${pageContext.request.userPrincipal.name})"><i class="fa fa-check"></i>Save Preferences</button>
                    	<button class="btn btn-danger" data-ng-click="cancelNewPreference()"><i class="fa fa-times"></i> Cancel</button>
                    	<button class="btn btn-primary" data-ng-click="applyFontStyleNow();applyBackgroundStyleNow();applyFontSizeNow();applyFontFamilyNow()">Apply Now</button> 
                    	<button class="btn btn-danger" data-ng-click="applyFontStyle(0);applyBackgroundStyle(1);applyFontSize(14);applyFontFamily(0)">Reset</button>
                    </div>
					
				</form>
				
			</div>
		</div>
	</div>
</div>
<!-- /.row -->