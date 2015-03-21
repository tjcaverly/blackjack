
class window.Game extends Backbone.Model

  initialize: ->
    @set 'gameOver' , false
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('dealerHand').on 'determineWinner', => 
      #debugger
      debugger
      console.log(@);
      console.log(@get('dealerHand'))
      if @get('dealerHand').scores()[0] > @get('playerHand').scores()[0]
        @trigger 'playerLose'
      else if @get('dealerHand').scores()[0] < @get('playerHand').scores()[0]
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



