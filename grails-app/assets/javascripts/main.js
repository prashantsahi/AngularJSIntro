var myApp = angular.module('myApp', []);

var gems =
    [
        {
            name: "Prashant",
            salary: 50,
            show: true,
            hide: true,
            images: {
                full: '/assets/favicon.ico',
                thumb: '/assets/spinner.gif'
            },
            reviews: [
                {
                    stars: 5,
                    body: "I love this product!",
                    author: "joe@thomas.com"
                },
                {
                    stars: 1,
                    body: "This product sucks",
                    author: "tim@hater.com"
                }
            ]
        },
        {
            name: "sahi",
            salary: 80,
            show: true,
            hide: false,
            images: {
                full: '/assets/favicon.ico',
                thumb: '/assets/spinner.gif'
            },
            reviews: [
                {
                    stars: 3,
                    body: "From product2------>> I love this product!",
                    author: "joe@thomas.com"
                },
                {
                    stars: 4,
                    body: "From product2------>>This product sucks",
                    author: "tim@hater.com"
                }
            ]

        },
        {
            name: "Ajay",
            salary: 50,
            show: true,
            hide: true,
            images: {
                full: '/assets/favicon.ico',
                thumb: '/assets/spinner.gif'
            },
            reviews: [
                {
                    stars: 5,
                    body: "I love this product!",
                    author: "joe@thomas.com"
                },
                {
                    stars: 1,
                    body: "This product sucks",
                    author: "tim@hater.com"
                }
            ]
        }

    ];


myApp.factory('Data', function () {
    return {message: "I m data from a service "}
})

function FirstCtrl($scope, Data) {
    $scope.data = Data;
    $scope.val = {message: "First controller"}
}
function SecondCtrl($scope, Data) {
    $scope.data = Data;
    $scope.val = {message: "Second controller"}
}


myApp.controller("demoCtrl", function () {

    this.products = gems;
});


myApp.controller("PanelController", function ($scope) {

    $scope.tab = 1;

    $scope.selectTab = function (setTab) {
        $scope.tab = setTab
    }

    $scope.isSelected = function (checkTab) {
        return $scope.tab === checkTab;
    }
});

myApp.controller("ReviewController", ['$scope','$http',function ($scope,$http) {
    $scope.review = {};

    $scope.addReview = function (product) {
        product.reviews.push($scope.review);
        alert("review Added successfully")
        $scope.review = {};
    };
    $http.get('/api/todo.json').success(function(data){
        var dummyData=data.task;
        alert(dummyData);
    });
}]);

myApp.directive("al", function () {
    return {
        restrict: 'E',
        link: function () {
            alert("custom directive");
        }
    }
});
