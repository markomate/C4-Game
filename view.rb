require 'colorize'
require 'artii'

class GameView
  def welcome_text
    c4_text = Artii::Base.new font: 'slant'
    puts c4_text.asciify('WELCOME TO C4 !').colorize(:blue)
    puts 'Press ENTER to CONTINUE or -h for HELP!'.blink
  end

  def options_text
    c4_text = Artii::Base.new font: 'slant'
    puts c4_text.asciify('OPTIONS').colorize(:blue)
    puts "\nSelect from the following options:"
    puts "\n1. Name change"
    puts '2. Colour selector'
    puts '3. Back'
  end

  def game_setup
    puts "\nSelect from the following options:"
    puts "\n1. Single Player"
    puts '2. Two Player (2P)'
    puts '3. Options'
    puts '4. Exit'
  end

  def game_help
    puts 'How to play:'
    puts 'Players take turns placing a piece down a column by typing 1-7.'
    puts 'The aim of the game is to connect four pieces, either in a row, column or diagonally.'
    puts "That's really all there is to it, enjoy :)!"
  end

  def error_msg
    puts 'Please enter a valid option!'
  end

  def colour_options
    puts "\nYou may pick from the following colours by typing it's name:"
    print "\nRed, ".colorize(:red)
    print 'Green, '.colorize(:green)
    print 'Yellow, '.colorize(:yellow)
    print 'Blue, '.colorize(:blue)
    print 'Magenta, '.colorize(:magenta)
    print 'Cyan '.colorize(:cyan)
    print '& White.'.colorize(:white)
    puts "\nAll the colours have a light variant, which you can select by adding light_ infront of a colour, e.g. light_red"
  end
end
