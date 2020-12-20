#!/usr/bin/env ruby

require_relative 'view'
require_relative 'controller'
require_relative 'player'
require_relative 'board'
require_relative 'validators'

if ARGV.length.positive?
  # help command line argument
  if ARGV[0] == '-h' || ARGV[0] == '--help'
    # prints help menu
    puts 'Please check out the README file for dependancies and system requirements.'
    puts "\nFor game help, check out the help menu in game by entering -h at the welcome screen"
  end
else
  # run the code
  loop do
    $loop_break = 0
    game_view = GameView.new
    main_menu = MainMenu.new(game_view)
    main_menu.run

    game_start = C4Game.new
    game_start.run
  end
end
