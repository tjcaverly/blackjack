
class window.Game extends Backbone.Model

  initialize: ->
    @set 'gameOver' , false
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    console.log @get('playerHand')

    @get('dealerHand').on 'determineWinner', => 
      # debugger
      if (@get 'dealerHand').scores[0] > (@get 'playerHand').scores[0]
        @trigger 'playerLose'
      else if (@get 'dealerHand').scores[0] < (@get 'playerHand').scores[0]
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



