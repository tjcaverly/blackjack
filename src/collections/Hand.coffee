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

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  checkForOver: =>
    score = @scores()[0]
    if score > 21
      # @get('dealerHand').showHand()
      @trigger('handLose')

  dealerPlay: ->
    @showHand()
    while @scores()[0] < 17
      # debugger
      @hit()

    @checkForOver()