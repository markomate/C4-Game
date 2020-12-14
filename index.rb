require_relative 'view'
require_relative 'controller'
require_relative 'player'

def run
    game_view = GameView.new
    game_controller = GameController.new(game_view)
    game_controller.run()
end

run()