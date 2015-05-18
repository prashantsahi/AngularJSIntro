var todo = angular.module('todo', ['ui.router']);

todo.config(['$stateProvider', '$locationProvider', function ($stateProvider, $locationProvider) {
    $stateProvider
        .state('homePage', {
            url: '/',
            templateUrl: "/display/homePage",
            controller: 'loginController'
        })
        .state('demoReview', {
            url: '/display/homePage',
            controller: 'TodoCtrl',
            templateUrl: "/display/demoReview"
        })
    $locationProvider.html5Mode(true);
}]);

/*
 todo.directive('color', function () {
 return {
 restrict: 'A',
 link: function (scope, element) {
 var colors = ['red', 'green', 'grey'];
 element.css('background-color', colors[Math.floor((Math.random() * 3))]);
 }
 }
 });
 */

todo.directive("color", function () {
    return {
        restrict: 'A',
        link: function (scope, element) {
            var colors = ['#10E8C6', '#D5FF48', '#FFFF7D', '#FFCFDD', '#FFD548', "#AEFAF8"];
            element.css('background-color', colors[Math.floor((Math.random() * 6))]);
        }
    }
});


todo.controller("TodoCtrl", ['$scope', '$http', '$rootScope', function ($scope, $http, $rootScope) {
//for selecting create_group and new task
    $scope.tab = 1;
    $scope.checkLink = function (setTab) {
        $scope.tab = setTab
    }

    $scope.selectLink = function (checkTab) {
        return $scope.tab === checkTab;
    }

    var userId = 2; 
//end of selection

    $http.get('http://localhost:8080/rest/api/todoUser/' + userId + '.json' + '?access_token=' + $rootScope.access_token).success(function (data) {
        $scope.group = data.todoGroups;
        console.log(JSON.stringify($scope.group));
    }).error(function () {
        console.log("data not fetched")
    });


    /* $scope.username = "Prashant Sahi";
     $http.get('http://localhost:8080/rest/api/group.json').success(function (data) {
     $scope.group = data;
     //console.log(JSON.stringify($scope.group));
     }).error(function () {
     console.log("data not fetched")
     });
     */


    $http.get('http://localhost:8080/rest/api/todo.json' + '?access_token=' + $rootScope.access_token).success(function (data) {
        $scope.store = data;
    }).error(function () {
        console.log("data not fetched")
    });

    $scope.addTodo = function (taskName, groupID) {
        //alert(groupID + "  TASK:  " + taskName);
        var dataObj = {task: taskName, collection: groupID/*,username:'admin',password:'secret'*/};
        /*  $http.get('http://localhost:8080/rest/api/todo.json').success(function (data) {
         $scope.store = data;
         }).error(function () {
         console.log("data not fetched")
         });

         for (i = 0; i < $scope.store.length; i++) {
         console.log("ID :  " + i);
         }*/
        $http.post('http://localhost:8080/rest/api/todo' + '?access_token=' + $rootScope.access_token, dataObj).success(function (data) {
            //$scope.store.push(data);
            for (var i = 0; i < $scope.group.length; i++) {
                if ($scope.group[i].id === groupID) {
                    $scope.group[i].todos.push(data);
                    //alert("data saved in group" + $scope.group[i].id);
                    //alert("data :  " + $scope.group[i].todos);
                    return;
                }
            }
        }).error(function () {
            console.log("data not saved");
        });
    }

    $scope.addTodoGroup = function (groupName) {
        //alert(groupName);
        var dataGrp = {name: groupName, todos: [], user: userId};

        $http.post('http://localhost:8080/rest/api/group' + '?access_token=' + $rootScope.access_token, dataGrp).success(function (data) {
            //alert(data);
            $scope.group.push(data);
            //alert("group created " + data.name);
        }).error(function () {
            console.log("group not created");
        });
    }


    $scope.removeTodo = function (value, groupValue) {

        //alert("value ID : " + value.id + "group : groupValue.name");
        $http.delete('http://localhost:8080/rest/api/todo/' + value.id + '.json' + '?access_token=' + $rootScope.access_token).success(function () {
            for (var i = 0; i < $scope.group.length; i++) {
                if ($scope.group[i].id == groupValue.id) {
                    console.log("delete from group " + groupValue.name);
                    $scope.group[i].todos.splice($scope.group[i].todos.indexOf(value), 1);
                    //alert($scope.group[i].todos);
                    console.log("data deleted");
                }
            }
        }).error(function () {
            console.log("data not deleted!!  some error occoured");
        });
    }

    $scope.removeTodoGroup = function (groupValue) {

        //alert(groupValue.name + "deleted");
        $http.delete('http://localhost:8080/rest/api/group/' + groupValue.id + '.json' + '?access_token=' + $rootScope.access_token).success(function () {
            $scope.group.splice($scope.group.indexOf(groupValue), 1);
            //alert(groupValue.name + "deleted after http");
        }).error(function () {
            console.log("data not deleted!!  some error occoured");
        });
    }


    $scope.selectedBox = function (todoObj) {
        console.log(todoObj.id);
        var dataObj = {completed: !(todoObj.completed)};
        $http.put('http://localhost:8080/rest/api/todo/' + todoObj.id, dataObj
        ).success(function (data) {
                console.log(todoObj.completed);
            }).error(function () {
                console.log("some error occoured");
            });
    }
}
]);

todo.controller("loginController", ['$scope', '$http', '$state', '$rootScope', function ($scope, $http, $state, $rootScope) {
    $scope.loginMethod = function (username, password) {
        var dataObj = {username: username, password: password};
        $http.post('http://localhost:8080/rest/login', dataObj).success(function (data) {
            console.log("from login !!!");
            console.log(data);
            $rootScope.access_token = data.access_token;
            console.log($rootScope.access_token);
            $http.get('http://localhost:8080/rest/api/todo' + '?access_token=' + $rootScope.access_token).success(function (data) {
                console.log("getting todos!!!!!");
                console.log(JSON.stringify(data));

                $state.go("demoReview");

            }).error(function () {
                console.log("error getting todos");
            });
        }).error(function () {
            console.log("error while login !!!!!!!!!!!!!!!!!!!")
        });

        /* $http.get('http://localhost:8080/rest/api/todo?access_token='+$scope.access_token).success(function (data) {
         console.log("getting todos!!!!!");
         console.log(JSON.stringify(data));
         }).error(function () {
         console.log("error getting todos");
         });*/
    }
}]);
