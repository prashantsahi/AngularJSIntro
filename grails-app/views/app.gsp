<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="layout" content="main"/>
    <title>Dashboard</title>
    <style>
    .strikethrough {
        text-decoration: line-through
    }
    </style>
</head>

<body>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1>"username" TODO's
                <small>A Blank Slate</small>
            </h1>
        </div>
    </div>


    <div class="row">
        <div class="col-lg-6">
            <form name="createTodo">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">I need to...</h3>
                    </div>

                    <div class="panel-body">
                        <div class="form-group">
                            <input name="task" class="form-control" placeholder="Enter text">
                        </div>
                        <input type="submit" class="btn btn-success" value="Create"/>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-lg-6">
            <ul class="list-group">
                <li class="list-group-item">
                    <span style="float: right"><input type="checkbox"/></span>
                    <span style="float:right; margin-right:10px">
                        <input type="button" value="DELETE" class="btn btn-xs btn-danger">
                    </span>
                </li>
            </ul>
        </div>
    </div>
</div><!-- /#page-wrapper -->

</body>
</html>


%{--TODO APP GSP file--}%

%{--
<!doctype html>
<html>
<head>
    <asset:stylesheet src="bootstrap.css"/>

    <!-- Add custom CSS here -->
    <asset:stylesheet src="sb-admin.css"/>
    <asset:stylesheet src="font-awesome.min.css"/>
    <!-- JavaScript -->
    <asset:javascript src="jquery-1.10.2.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="angular-1.2.16.js"/>
    <asset:javascript src="todo.js"/>

    <style>.ng-invalid.ng-dirty {
        border-color: #FA787E;
    }

    .ng-valid.ng-dirty {
        border-color: #78FA89;
    }

    .strikeThrough {
        text-decoration: line-through;
    }

    </style>

</head>

<body ng-app="todo">
<h1>DEMO</h1>

<div ng-controller="TodoCtrl">
    --}%
%{--{{store}}--}%%{--

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1>{{username}} TODO's
                    <small>A Blank Slate</small>
                </h1>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-6">
                <form name="createTodo"
                      ng-submit="createTodo.$valid && addTodo(value.task)">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">I need to...</h3>
                        </div>

                        <div class="panel-body">
                            <div class="form-group">
                                <input name="task" required class="form-control" placeholder="Enter text"
                                       ng-model="value.task">
                            </div>

                            <p>{{value.task}}</p>
                            <input type="submit" class="btn btn-success" value="Create"/>
                        </div>
                    </div>
                </form>
            </div>

            <div class="col-lg-6">
                <ul class="list-group">
                    --}%
%{--{{store}}--}%%{--

                    <li class="list-group-item " ng-repeat="value in store|orderBy:'completed'"
                        style="background:cornflowerblue;">
                        <div ng-class="{strikeThrough:value.completed}">
                            --}%
%{--{{value.completed}}--}%%{--

                            <span><input type="checkbox" ng-model="value.completed"
                                         ng-click="selectedBox(value)"/>{{(store.indexOf(value))+1}}.</span>
                            <span>{{value.task}}</span>
                            <span style="float:right; margin-right:10px">
                                <input type="button" value="DELETE" ng-click="removeTodo(value)"
                                       class="btn btn-xs btn-danger">
                            </span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div><!-- /#page-wrapper -->
</div>
</body>

</html>
--}%

%{--GSP file ends--}%





%{--TODO JS FILE--}%

%{--
var todo = angular.module('todo', []);

/*todo.directive('randomColor', function() {
 return  {
 link: function(scope, element) {
 var colors = ['red', 'green', 'blue'];
 element.css('background-color',
 colors[Math.floor((Math.random()*3)+1)]);				}
 }
 });*/


todo.controller("TodoCtrl", ['$scope', '$http', function ($scope, $http) {
    $scope.username = "Prashant Sahi";

    //var store = $scope;
    $http.get('http://localhost:8080/api/todo.json').success(function (data) {
        $scope.store = data;
    }).error(function () {
        console.log("data not fetched")
    });

    $scope.addTodo = function (taskName) {
        var dataObj = {task: taskName};


/*        $http.get('http://localhost:8080/api/todo.json').success(function (data) {
            $scope.store = data;
        }).error(function () {
            console.log("data not fetched")
        });

        for (i = 0; i < $scope.store.length; i++) {

        }*/


        $http.post('http://localhost:8080/api/todo', dataObj).success(function (data) {
            $scope.store.push(data);
            console.log(taskName);
        }).error(function () {
            console.log("data not saved");
        });
    }

    $scope.removeTodo = function (value) {
        console.log("delete " + value.task + "   ID   :" + value.id);
        //var delTodo=$scope.source[taskId]
        //console.log('http://localhost:8080/api/todo/'+taskId+'.json');
        $http.delete('http://localhost:8080/api/todo/' + value.id + '.json').success(function () {
            $scope.store.splice($scope.store.indexOf(value), 1);
            //alert($scope.store.indexOf(value));
            console.log("data deleted", $scope.store);
        }).error(function () {
            console.log("data not deleted!!  some error occoured");
        });
    }

    $scope.selectedBox = function (todoObj) {
        console.log(todoObj.id);
        var dataObj = {completed: !(todoObj.completed)};
        $http.put('http://localhost:8080/api/todo/' + todoObj.id, dataObj
        ).success(function (data) {
                console.log(todoObj.completed);
            }).error(function () {
                console.log("some error occoured");
            });
    }
}]);
--}%

%{--GSP file ends--}%


