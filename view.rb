require 'colorize'
require 'artii'

class GameView
  def welcome_text
    c4_text = Artii::Base.new font: 'slant'
    puts c4_text.asciify('WELCOME TO C4 !').colorize(:blue)
    puts 'Press ENTER to CONTINUE or -h for HELP!'.blink
  end

  def game_options
    puts "\nSelect from the following options:"
    puts "\n1. Single Player"
    puts '2. Two Player (2P)'
    puts '3. Colour Selection'
    puts '4. Exit'
  end

  def game_help
    puts 'How to play:'
  end

  def error_msg
    puts 'Please enter a valid option!'
  end

  def colour_options
    puts "\nYou may pick a colour by typing it's name - Black, Red, Green, Yellow, Blue, Magenta, Cyan and White."
    puts "All the colours have a light variant, which you can choose by adding light_ infront of a colour, e.g. light_red"
  end
end
