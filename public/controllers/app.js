// Export the controller
var myApp = angular.module('myApp', []);

// Defining wrapper Routes for our API
myApp.controller('appCtrl', function appCtrl($scope, $http) {
        $scope.getItems = () => {
            $http.get('/items')
            .success(function(data) {
                $scope.items = data;   
            })
            .error(function(data) {
                console.log("Error: " + data);
            });
	}
});
