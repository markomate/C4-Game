require_relative 'view'
require_relative 'controller'
require_relative 'player'


if ARGV.length > 0
    # handle command line arguments
    if ARGV[0] == '-h' || ARGV[0] == '--help'
      # print the help menu
      puts "you asked for help"
    end
else
    game_view = GameView.new
    game_controller = GameController.new(game_view)
    game_controller.run()
end