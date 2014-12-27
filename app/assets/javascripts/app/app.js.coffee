angular.module "app.controllers", []
angular.module "app.factories", []

app = angular.module("app", [
  "rails"
  "app.controllers"
  "app.factories"
  "ngRoute"
])

app.filter("reverse", () ->
  (input) ->
    console.log input
    input.split("").reverse().join("")
)


app.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

app.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode
    enabled: true
    requireBase: false

    $routeProvider.when("/",
      templateUrl: "/templates/landing.html"
      controller: "LandingCtrl"
    ).otherwise redirectTo: "/"

