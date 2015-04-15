<!doctype html>
<html xmlns:ng="">
<head>
    <asset:stylesheet src="bootstrap.css"/>

    <!-- Add custom CSS here -->
    <asset:stylesheet src="sb-admin.css"/>
    <asset:stylesheet src="font-awesome.min.css"/>
    <!-- JavaScript -->
    <asset:javascript src="jquery-1.10.2.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="angular-1.2.16.js"/>
    <asset:javascript src="main.js"/>
    %{--<meta name="layout" content="main"/>--}%
</head>

<body ng-app="myApp">
<h1>DEMO</h1>

%{--<div ng-controller="demoCtrl as myApp">
    <div ng-repeat="product in myApp.products|orderBy:'-name' ">

        <section ng-controller="PanelController">
            <ul class="nav nav-pills">
                <li ng-class="{active:isSelected(1)}"><a href ng-click="selectTab(1)">Description</a></li>
                <li ng-class="{active:isSelected(2)}"><a href ng-click="selectTab(2)">Specifications</a></li>
                <li ng-class="{active:isSelected(3)}"><a href ng-click="selectTab(3)">Reviews</a></li>

            </ul>

            <div class="panel" ng-show="isSelected(1)">
                <h4>Description</h4>

                <p>{{product.name}}</p>
            </div>

            <div class="panel" ng-show="isSelected(2)">
                <h4>Specifications</h4>
                <blockquote>None yet</blockquote>
            </div>

            <div class="panel" ng-show="isSelected(3)">
                <h4>Reviews</h4>
                <blockquote>None yet {{product.salary}}</blockquote>
            </div>
        </section>
        <br>



        Name : {{product.name}}--}%%{--<input type="text" ng-model="demo.name"/>--}%%{--
        Salary : {{product.salary}}--}%%{--<input type="text" ng-model="demo.salary"/>--}%%{--
        <br/><input type="button" value="ADD to cart Show" ng-show="product.show"/>
        <br/><input type="button" value="ADD to cart Hide" ng-hide="product.hide"/>
        <br>DATE : {{'1388123412323' | date:'MM/dd/yyyy @ h:mma'}}
        <br>{{"Prashant sahi"|uppercase|limitTo:8}}
        <br>{{"Prashant sahi"|limitTo:8}}
        <br><img ng-src="{{product.images.full}}"/>
    </div>
</div>--}%


<div ng-controller="demoCtrl as myApp">
    <div ng-repeat="product in myApp.products|orderBy">
        <h1 ng-include="'/includeTemp.html'"></h1>
        <section ng-controller="PanelController">
            <ul class="nav nav-pills">
                <li ng-class="{active:isSelected(1)}"><a href ng-click="selectTab(1)">Description</a></li>
                <li ng-class="{active:isSelected(2)}"><a href ng-click="selectTab(2)">Specifications</a></li>
                <li ng-class="{active:isSelected(3)}"><a href ng-click="selectTab(3)">Reviews</a></li>

            </ul>

            <div class="panel" ng-show="isSelected(1)">
                <h4>Description</h4>

                <p>{{product.name}}</p>
            </div>

            <div class="panel" ng-show="isSelected(2)">
                <h4>Specifications</h4>
                <blockquote>None yet</blockquote>
            </div>

            <div class="panel" ng-show="isSelected(3)">
                <h4>Reviews</h4>
                <blockquote>None yet {{product.salary}}</blockquote>
                <blockquote ng-repeat="review in product.reviews">
                    <b>Stars: {{review.stars}}</b>
                    {{review.body}}
                    <cite>by: {{review.author}}</cite>

                </blockquote>

                <form name="reviewForm" ng-controller="ReviewController"
                      ng-submit="reviewForm.$valid && addReview(product)">
                    <blockquote>
                        <b>Stars: {{review.stars}}</b>
                        {{review.body}}
                        <cite>by: {{review.author}}</cite>
                    </blockquote>
                    <select ng-model="review.stars" required><br>
                        <option value="1">1 star</option>
                        <option value="2">2 stars</option>
                        <option value="3">3 stars</option>
                        <option value="4">4 stars</option>
                        <option value="5">5 stars</option>
                        . . .
                    </select>
                    <h5>Submit a Review :</h5>
                    <textarea ng-model="review.body" required></textarea><br>
                    <label>by:</label><br>
                    <input name="author" ng-model="review.author" type="email"
                           required/><br>

                    <div>Review From is {{reviewForm.$valid}}</div>
                    <input type="submit" value="Submit"/>
                </form>
            </div>
        </section>
        <br>

        Name : {{product.name}}<input type="text" ng-model="demo.name"/>
        Salary : {{product.salary}}<input type="text" ng-model="demo.salary"/>
        <br/><input type="button" value="ADD to cart Show" ng-show="product.show"/>
        <br/><input type="button" value="ADD to cart Hide" ng-hide="product.hide"/>
        <br>DATE : {{'10' | date:'MM/dd/yyyy @ h:mma'}}
        <br>{{"Prashant sahi"|uppercase|limitTo:8}}
        <br>{{"Prashant sahi"|limitTo:8}}
        <br><img ng-src="{{product.images.full}}"/>
    </div>
</div>

</body>

</html>