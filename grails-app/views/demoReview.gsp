<!doctype html>
<html>
<head>
    %{--<meta name="layout" content="main"/>--}%
    <title>Dashboard</title>

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
<script>
   var userId= ${sec.loggedInUserInfo(field:'id')}
</script>
<div>
    <g:link name="logout" method="post" uri='/j_spring_security_logout'>Logout</g:link>
</div>

<h1>DEMO</h1>

<div ng-controller="TodoCtrl">
    %{--{{store}}--}%
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1><sec:loggedInUserInfo field="username"/> TODO's
                    <small>A Blank Slate</small>
                </h1>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <a href ng-click="checkLink(2)" style="text-decoration: none">createGroup+</a>
                            <a href ng-click="checkLink(1)" style="float: right;text-decoration: none">addTask+</a>
                        </h3>
                    </div>

                    <form name="createTodo"
                          ng-submit="createTodo.$valid && addTodo(value.task,groupName)">
                        <div class="panel-body" ng-show="selectLink(1)">
                            <div class="form-group">
                                <input name="task" required class="form-control" placeholder="Enter text"
                                       ng-model="value.task">
                            </div>

                            <p>{{value.task}}</p>


                            <select ng-model="groupName"
                                    ng-options="groupObj.id as groupObj.name for groupObj in group">
                                <option value="">-- Select Group --</option>
                            </select><br>
                            {{groupName}}
                            <br><input type="submit" class="btn btn-success" value="Create"/>
                        </div>

                    </form>


                    <div class="panel-body" ng-show="selectLink(2)">
                        <form name="createGroup" ng-submit="createGroup.$valid && addTodoGroup(groupValue.name)">

                            <input name="group" required class="form-control" placeholder="Group Name"
                                   ng-model="groupValue.name" required>
                            <br><input type="submit" class="btn btn-success" value="Create Group"/>
                        </form>
                    </div>
                </div>
            </div>

            <div ng-repeat="groupValue in group">
                <div class="col-lg-6">
                    <div class="panel panel-primary" color>{{groupValue.name}}
                        <button %{--value="DeleteGroup"--}% ng-click="removeTodoGroup(groupValue)"
                                                            class="btn btn-xs btn-danger"
                                                            style="float: right;">DeleteGroup</button>
                        <ul class="list-group">
                            <li class="list-group-item "
                                ng-repeat="value in groupValue.todos%{--|orderBy:'completed'--}%"
                                style="background:cornflowerblue;" ng-show="value.completed==false">
                                <div ng-class="{strikeThrough:value.completed}">
                                    %{--{{value.completed}}--}%
                                    %{--{{value.collection}}--}%
                                    <span><input type="checkbox" ng-model="value.completed"
                                                 ng-click="selectedBox(value)"/>{{(store.indexOf(value))+1}}.</span>
                                    <span>{{value.task}}</span>
                                    <span style="float:right; margin-right:10px">
                                        <input type="button" value="DELETE" ng-click="removeTodo(value,groupValue)"
                                               class="btn btn-xs btn-danger">
                                    </span>
                                </div>
                            </li>
                        </ul>


                        <ul class="list-group">
                            <div %{--ng-show="value.completed==false"--}%>ticked</div>

                            <li class="list-group-item "
                                ng-repeat="value in groupValue.todos|orderBy:'completed'"
                                style="background:cornflowerblue;" ng-show="value.completed==true">
                                <div ng-class="{strikeThrough:value.completed}">
                                    %{--{{value.completed}}--}%
                                    %{--{{value.collection}}--}%
                                    <span><input type="checkbox" ng-model="value.completed"
                                                 ng-click="selectedBox(value)"/>{{(store.indexOf(value))+1}}.</span>
                                    <span>{{value.task}}</span>
                                    <span style="float:right; margin-right:10px">
                                        <input type="button" value="DELETE" ng-click="removeTodo(value,groupValue)"
                                               class="btn btn-xs btn-danger">
                                    </span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /#page-wrapper -->
</div>
</body>

</html>

