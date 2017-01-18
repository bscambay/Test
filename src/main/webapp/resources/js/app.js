/**
 * Initializes Angular app, sets templates and controllers to their routes (views)
 */

var app = angular.module("myApp", ["ngRoute", "datatables"]);

app.factory('pageService', function() {
	
	var data = {
			pageTitle: "[No Page Title]",
			pageTitleIcon: "certificate",
			breadcrumbData: [{
				text:"Home", href:"#", active:false
			}, {
				text:"Dashboard", href:"#dashboard", active:true
			}]
	};
	
	var setPageTitle = function(pageTitle) {
		data.pageTitle = pageTitle;
	};
	
	var setPageTitleIcon = function(pageTitleIcon) {
		data.pageTitleIcon = pageTitleIcon;
	};
	
	var setBreadcrumbData = function(breadcrumbData) {
		data.breadcrumbData = breadcrumbData;
	};
	
	return {
		setPageTitle: setPageTitle,
		setPageTitleIcon: setPageTitleIcon,
		setBreadcrumbData: setBreadcrumbData,
		pageData: data
	};
});

app.factory('responseService', function() {
	
	var errorResponse = function(response) {
		if (response && response.data && response.data.result == "success")
		{
			return false;
		}
		else
		{
			if (response && response.data)
			{
				alert("There was an error " + response.data.action + ": " + response.data.result);
			}
			else
			{
				alert("There was an error with a background call - no response was received from the server");
			}
			
			return true;
		}
	};
	
	return {
		errorResponse: errorResponse
	};
});

app.factory('csrfService', function() {
	
	var getCsrfHeader = function() {
		return $("meta[name='_csrf_header']").attr('content');
	};
	
	var getCsrfToken = function() {
		return $("meta[name='_csrf']").attr('content');
	};
	
	return {
		getHeader: function() {
			var hdr = {};
			hdr[getCsrfHeader()] = getCsrfToken();
			return {
				headers: hdr
			};
		},
		getCsrfHeader: getCsrfHeader,
		getCsrfToken: getCsrfToken
	};
});

app.controller("goldController", function($scope, pageService) {

	$scope.pageData = pageService.pageData;
});

app.config(function($routeProvider) {
	$routeProvider.when('/workflow', {
		templateUrl : "workflow",
		controller: "workflowController",
		activetab: 'addWorkflow'
	}).when('/workflows', {
    	templateUrl: "workflows",
    	controller: "workflowController",
    	activetab: 'listWorkflows'
    }).when('/roles', {
    	templateUrl: "roles",
    	controller: "roleController",
    	activetab: 'listRoles'
    }).when('/newRole', {
    	templateUrl: "roles/new",
    	controller: "roleController",
    	activetab: 'addRole'
    }).when('/preference', {
    	templateUrl: "preference",
    	controller: "preferenceController",
    	activetab: 'preference'
    }).when('/preferences', {
    	templateUrl: "preferences",
    	controller: "preferenceController",
    	activetab: 'preferences'
    }).when('/profile', {
    	templateUrl: "profile",
    	controller: "profileController"
    }).when("/edit_profile", {
    	templateUrl: "edit_profile",
    	controller: "profileController"
    }).when('/menus', {
    	templateUrl: "menus",
    	controller: "developController",
    	activetab: 'menus'
    }).when('/packages', {
    	templateUrl: "packages",
    	controller: "developController",
    	activetab: 'packages'
    }).when('/newPackage', {
    	templateUrl: "packages/new",
    	controller: "developController",
    	activetab: 'packages'
    }).when('/packages/:action/:packageId', {
    	templateUrl: "resources/templates/urlRouter.html",
    	controller: "developController",
    	activetab: 'packages'
    }).when('/dashboard', {
    	templateUrl: "dashboard",
    	controller: "dashboardController",
    	activetab: 'dashboard'
    }).otherwise({
    	templateUrl: "dashboard",
    	controller: 'dashboardController',
    	activetab: 'dashboard'
    });
});







