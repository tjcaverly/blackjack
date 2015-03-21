
class window.Game extends Backbone.Model

  initialize: ->
    @set 'gameOver' , false
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('dealerHand').on 'determineWinner', => 
      if @get('dealerHand').score() > @get('playerHand').score()
        @trigger 'playerLose'
      else if @get('dealerHand').score() < @get('playerHand').score()
        @trigger 'playerWin'
      else
        @trigger 'playerTie'
      

    @get('playerHand').on 'hit', => 
      if @get('playerHand').checkForOver()
        @trigger 'playerLose'

    @get('playerHand').on 'stand', => @get('dealerHand').dealerPlay()
    @get('playerHand').on 'handLose', => 
      @trigger 'playerLose'

    @get('dealerHand').on 'handLose', => 
      @trigger 'playerWin'
