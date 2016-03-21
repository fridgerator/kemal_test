(function(){
	'use strict';

	var app = angular.module('kemalTest', ['ngRoute', 'ngResource']);

	app.value('baseUrl', 'http://localhost:3000');

	app.config(function($routeProvider){
		$routeProvider
		.when('/', {
			templateUrl: 'index.html'
		})
		.when('/posts', {
			templateUrl: 'posts.html',
			controller: 'PostsController as postsCtrl'
		});
	});

	app.factory('Post', function($resource, baseUrl){
		return $resource(baseUrl + '/posts/:id');
	});

	app.controller('PostsController', function($scope, Post){
		var vm = this;

		vm.posts = Post.query();
		vm.post = new Post;

		vm.submitPost = function(){
			vm.post.$save().then(function(post){
				vm.posts.push(post);
				vm.post = new Post;
			});
		}

		vm.deletePost = function(post){
			var index = vm.posts.indexOf(post);
			post.$delete({id: post.id}).then(function(response){
				vm.posts.splice(index, 1);
			});
		}
	});

})();


