
class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'loseOrWin', false
    console.log @get('playerHand')
    @get('playerHand').on 'hit', => @get('playerHand').checkForOver()
    @get('playerHand').on 'stand', => @get('dealerHand').dealerPlay()
    @get('playerHand').on 'handLose', => @trigger 'playerLose'
    @get('dealerHand').on 'handLose', => @trigger 'playerWin'
  # 
    # this.get('dealerHand').on('handLose', function(hand){
    #   this.lose(hand);
    # }, this)
  # checkForOver: ->
  # 	score = @get('playerHand').scores()[0]
  # 	if score > 21
  # 		@get('dealerHand').showHand()
  # 		@trigger('playerLose')

  # lose: (hand) ->
  # 	if @get('playerHand') == hand
  # 		@trigger 'playerLose'
  # 	else
  # 		@trigger 'playerWin'
