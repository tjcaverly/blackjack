class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    @trigger 'hit'

  stand: ->
    @trigger 'stand'

  showHand: ->
    @at(0).flip()

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  score: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.

    if @minScore() + 10 * @hasAce() <= 21 then @minScore() + 10 * @hasAce() else @minScore()


  checkForOver: =>
    score = @score()
    score > 21


  dealerPlay: ->

    delayedPlay = => 
      if @score() < 17
        @hit()

      if @score() < 17
        setTimeout(delayedPlay, 1000)
      else
        if @checkForOver()
          @trigger 'handLose'
        else
          @trigger 'determineWinner' 
      
    @showHand()
    if @score() < 17
      setTimeout(delayedPlay, 1000)
    else
      delayedPlay()