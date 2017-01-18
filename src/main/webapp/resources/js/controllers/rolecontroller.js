/**
 * Controller for the roles dialogs
 */
app.controller('roleController', role)

role.$inject = [ '$scope', '$http', '$location', '$route', '$templateCache',
		'pageService', 'csrfService' ]

function role($scope, $http, $location, $route, $templateCache, pageService,
		csrfService) {
	if ($route.current.templateUrl === "roles") {
		pageService.setPageTitle("Roles");
		pageService.setPageTitleIcon("group");
		pageService.setBreadcrumbData([ {
			text : "Home",
			href : "#",
			active : false
		}, {
			text : "Roles",
			href : "#roles",
			active : true
		} ]);
	} else if ($route.current.templateUrl === "roles/new") {
		pageService.setPageTitle("Roles");
		pageService.setPageTitleIcon("group");
		pageService.setBreadcrumbData([ {
			text : "Home",
			href : "#",
			active : false
		}, {
			text : "Roles",
			href : "#roles",
			active : false
		}, {
			text : "Create New Role",
			href : "#newRole",
			active : true
		} ]);
	}
	/* Handles the Save button click */
	$scope.saveNewRole = function() {

		$http.post('roles/saveNew', $scope.role, csrfService.getHeader()).then(
				function(response) {
					$location.path('/roles');
					$templateCache.remove('roles');
					$route.reload();
				}, function(response) {
					alert(response.statusText);
				});
	};

	/* Handles the Cancel button click */
	$scope.cancelNewRole = function() {
		$location.path('/roles');
	};

	/* Model for the role */
	$scope.role = {
		name : null,
		description : null
	};

	/* Handles the Add New Role button click */
	$scope.addNewRole = function() {
		$location.path('/newRole');
	};

};