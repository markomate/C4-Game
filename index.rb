require_relative 'view'
require_relative 'controller'
require_relative 'player'
require_relative 'board'

if ARGV.length.positive?
  # help command line argument
  if ARGV[0] == '-h' || ARGV[0] == '--help'
    # prints help menu
    puts 'you asked for help'
  end
else
  # run the code
  loop do
    game_view = GameView.new
    main_menu = MainMenu.new(game_view)
    main_menu.run

    game_start = C4Game.new
    game_start.run
  end
end
