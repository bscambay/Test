/**
 * Controller for the profile view
 */
app.controller('profileController', profile)
	
role.$inject=['$scope', '$http', '$location', '$route', '$templateCache', 'pageService', 'csrfService']

function profile($scope, $http, $location, $route, $templateCache, pageService, csrfService) {
	if ($route.current.templateUrl === "profile") {
		pageService.setPageTitle("My Profile");
		pageService.setPageTitleIcon("user");
		pageService.setBreadcrumbData([ {
			text : "Home",
			href : "#",
			active : false
		}, {
			text : "My Profile",
			href : "#profile",
			active : true
		} ]);
	} else if ($route.current.templateUrl === "edit_profile") {
		pageService.setPageTitle("Edit Profile");
		pageService.setPageTitleIcon("edit");
		pageService.setBreadcrumbData([ {
			text : "Home",
			href : "#",
			active : false
		}, {
			text : "My Profile",
			href : "#profile",
			active : false
		}, {
			text : "Edit Profile",
			href : "#edit_profile",
			active : true
		} ]);
	}
	
	/* Handles the Edit Profile button click on My Profile page */
	$scope.editProfile = function() {
		$location.path('/edit_profile');
	};
	
};