class window.CardView extends Backbone.View
  className: 'cardContainer'

  template: _.template '<div class="card" style="background-image: url(\'<%= imageName %>\')"></div>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
