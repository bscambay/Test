/**
 * Develop Controller provides Angular support for develop screens
 */
app.controller('developController', function($scope, $http, $location, $templateCache, $route, $routeParams, pageService, csrfService, responseService) {
	
	pageService.setPageTitle("Development");
	pageService.setPageTitleIcon("edit");

	pageService.setBreadcrumbData([{
		text:"Home", href:"#", active:false
	}, {
		text:"Packages", href:"#packages", active:true
	}]
);

	
	if ($routeParams.packageId && $routeParams.action)
	{
		$scope.templateUrl = 'packages/' + $routeParams.action + '/' + $routeParams.packageId;
	}
	
	$scope.savePackage = function() {
		$http.post('packages/save', $scope._package, csrfService.getHeader())
			.then(function(response) {
				if (!responseService.errorResponse(response))
				{
					$location.path('/packages');
					$templateCache.remove('packages');
					$route.reload();
				}
			}, function (response) {
				alert(response.status);
		});
	};
	
	/**
	 * Handle cancel button on edit package form
	 */
	$scope.cancelEditPackage = function() {
		$location.path('/packages');
	};
	
	/**
	 * Handle delete button click event
	 */
	$scope.deletePackage = function(packageId) {
		if (confirm("Are you sure you want to delete this package?"))
		{
			$http.post('packages/delete/' + packageId, {}, csrfService.getHeader())
				.then(function(response) {
					if (!responseService.errorResponse(response))
					{
						$location.path('/packages');
						$templateCache.remove('packages');
						$route.reload();
					}
				}, function(response) {
					alert(response.status);
				});
		}
	};
	
	$scope._package = {
			id: null,
			name: null,
			description: null
	};

});