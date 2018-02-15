// Export the controller
var myApp = angular.module('myApp', []);

// Defining wrapper Routes for our API
myApp.controller('appCtrl', function appCtrl($scope, $http) {
        $scope.getItems = () => {
            var itemsMap = {};
            $http.get('/items')
            .success(function(data) {
                for(var i = 0; i < data.length; i++) {
                    if(data[i].name in itemsMap) {
                        itemsMap[data[i].name].push(data[i].size_name);
                    } else {
                        itemsMap[data[i].name] = [data[i].size_name];
                    }
                    
                }
                $scope.items = itemsMap;
                console.log(itemsMap);
                console.log(data);
            })
            .error(function(data) {
                console.log("Error: " + data);
            });
	}
});
