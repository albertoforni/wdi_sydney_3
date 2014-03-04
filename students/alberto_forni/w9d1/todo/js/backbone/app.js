'use strict';
(function(){
  var App = {
    init: function(params) {
      // setParams
      var defaultParams = {
        $addButton: undefined,
        $listContainer: undefined,
        $completedItems: undefined,
        $newElementInput: undefined
      };

      params = $.extend(defaultParams, params);

      this._$addButton = params.$addButton;
      this._$listContainer = params.$listContainer;
      this._$completedItems = params.$completedItems;
      this._$newElementInput = params.$newElementInput;

      // handle click on add button
      this.handleClickOnButton();
      this.handleClickOnItemComplete();
    },

    handleClickOnButton: function() {
      var $container = this._$listContainer;
      var _this = this;

      this._$addButton.on('click', function(){
        //retrive value
        var newItemText = _this._$newElementInput.val();

        // crete the new backbone view with the element
        var date = new Date();
        var dateString = date.getDay() + "/" + date.getMonth() + "/" + date.getFullYear();
        var item = new ItemView({
          model: {
            body: newItemText,
            createdAt: dateString
          }
        });

        // append it to the list
        $container.append(item.render().el);
      });
    },

    handleClickOnItemComplete: function() {
      var _this = this;
      this._$listContainer.on('click', '.complete', function(e) {
        // move to completed list
        var $el = $(e.target).closest('li');
        $el.addClass('completed').appendTo(_this._$completedItems).find('.complete').hide();
        $el.find('.rollback').show();
      });

      this._$completedItems.on('click', '.rollback', function(e) {
        // move to pending list
        var $el = $(e.target).closest('li');
        $el.removeClass('completed').appendTo(_this._$listContainer).find('.rollback').hide();
        $el.find('.complete').show();
      });
    }
  };

  var ItemView = Backbone.View.extend({
    tagName: 'li',
    className: 'list-group-item',
    template: _.template($('#itemTemplate').html()),

    events: {
      'click .close': 'deleteItem'
    },

    render: function(){
      this.$el.html(this.template(this.model));
      return this;
    },

    deleteItem: function() {
      this.$el.remove();
    }
  });

  App.init({
    $addButton: $('#newElementButton'),
    $listContainer: $('#items'),
    $completedItems: $('#completedItems'),
    $newElementInput: $('#newElementInput')
  });
})();
