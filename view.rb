require 'colorize'
require 'artii'

class GameView
  def welcome_text
    c4_text = Artii::Base.new font: 'slant'
    puts c4_text.asciify('WELCOME TO C4 !').colorize(:blue)
    puts 'Press ENTER to CONTINUE or -h for HELP!'.blink
  end

  def game_options
    puts "\n1. Single Player"
    puts '2. Two Player (2P)'
    puts '3. Resume from save'
    puts '4. Exit'
  end

  def game_help
    puts 'How to play:'
  end
end
