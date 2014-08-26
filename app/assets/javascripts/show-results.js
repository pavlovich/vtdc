
	angular.module("results",[])
		.controller("ttResults", function($scope){
			$.getJSON('data/data.json', function(data) {

			var rawEntries = data.data;

			var byActivity = _.groupBy(rawEntries, function(entry){ return entry.activity });
			
			var newList = [];
			 _.map(byActivity, function(activityEntries, activity, list){
				var groupedActivities = _.groupBy(activityEntries, function(entry){
					var sex = (entry.gender == 'male' ? " Dog" : "Bitch");
					return entry.class + " - " + sex;
				});
				var classes = [];
				_.map(groupedActivities, function(groupedEntries, group, list){
					var anEntry = groupedEntries[0];
					var groupOrder = anEntry.catalogOrder; 
					var sexCode = group.match(/Dog$/) ? 'a' : 'b'
					groupOrder = groupOrder + sexCode;
					classes.push({"name": group, "order": groupOrder, "entries": groupedEntries});
				});
				newList.push({"name": activity, "classes": classes});
			});
			$scope.activities = newList;
		});
	});