assert = chai.assert

describe 'hand', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = new Hand([], deck)

  describe 'checkForOver', ->
    it 'should return true when score above 21', ->
      hand.add(new Card({rank: 10, suit: 1}))
      hand.add(new Card({rank: 10, suit: 2}))
      assert.strictEqual hand.checkForOver(), false
      hand.add(new Card({rank: 5, suit: 3}))
      assert.strictEqual hand.checkForOver(), true

  describe 'score', ->
    it 'should return 18 when hand is 7 and ace', ->
      hand.add(new Card({rank: 7, suit: 1}))
      hand.add(new Card({rank: 1, suit: 1}))
      assert.strictEqual hand.score(), 18