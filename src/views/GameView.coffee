class window.GameView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> 
      if not @model.get('gameOver')
        @model.get('playerHand').hit()
    'click .stand-button': -> 
      if not @model.get('gameOver')
        @model.get('playerHand').stand()

  initialize: ->
    @render()
    @model.on 'playerLose', => @playerHandLoss()
    @model.on 'playerWin', => @playerHandWin()
    @model.on 'playerTie', => @playerTie()

  playerHandLoss: ->
    @model.set 'gameOver', true
    @endAlert("YOU LOSE")
    # alert "YOU LOSE"

  playerHandWin: ->
    @model.set 'gameOver', true
    @endAlert("YOU WIN")

  playerTie: ->
    @model.set 'gameOver', true
    @endAlert("TIE GAME")

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  endAlert: (message) ->
    setTimeout((-> alert message), 50)

