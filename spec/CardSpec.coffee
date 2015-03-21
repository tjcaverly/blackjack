assert = chai.assert

describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52

describe "imageName", ->
  it "should give correct name for card", ->
    card = new Card({rank: 0, suit: 1})
    assert.strictEqual card.get('imageName'), 'img/cards/king-diamonds.png'