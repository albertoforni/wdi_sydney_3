todoList.controller('todoListCtrl', function($scope){
  $scope.pendingList = []; // {body: '', createdAt: ''}
  $scope.completedList = []; // {body: '', createdAt: ''}

  $scope.newItem = ''; // updated by input

  $scope.createItem = function() {
    var date = new Date();
    var dateString = date.getDay() + "/" + date.getMonth() + "/" + date.getFullYear();
    $scope.pendingList.push({body: $scope.newItem, createdAt: dateString});
  };

  $scope.moveToCompleted = function(item) {
    $scope.completedList.push(item);
    $scope.removeItemFromPending(item);
  };

  $scope.moveToPending = function(item) {
    $scope.pendingList.push(item);
    $scope.removeItemFromCompleted(item);
  };

  $scope.removeItemFromPending = function(item) {
    $scope.pendingList = _.reject($scope.pendingList, function(el){ return item.$$hashKey == el.$$hashKey; });
  };

  $scope.removeItemFromCompleted = function(item) {
    $scope.completedList = _.reject($scope.completedList, function(el){ return item.$$hashKey == el.$$hashKey; });
  };

});