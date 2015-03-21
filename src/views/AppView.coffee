class window.AppView extends Backbone.View
  className: "game-container"

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html new GameView(model: @model.get 'game').el

