assert = chai.assert

describe 'game', ->
  game = null
  gameView = null

  beforeEach ->
    window.alert = -> console.log('alert called')
    game = new Game()
    gameView = new GameView(model: game)

  describe 'playerHandWin', ->
    it 'should end game when playerHandWin called', ->
      assert.strictEqual game.get('gameOver'), false
      gameView.playerHandWin()
      assert.strictEqual game.get('gameOver'), true
