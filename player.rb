require 'colorize'

class Player
  attr_accessor :name, :piece, :board, :colour

  def initialize(name, piece, board, colour)
    @name = name
    @piece = piece
    @board = board
    @colour = colour
  end

  # method for asking for a move, validating it is an option then returning user input
  def ask_move
    puts ""
    print "\n#{@name}".colorize(@colour)
    print " please enter a move: "
    input = gets.chomp
    input_valid = Validators.validate_column(input)
    if !input_valid
      puts 'Invalid input, try again!'
      ask_move
    elsif input == "E"
      $loop_break = 1
    else input.to_i
    end
  end

  # method with a loop that breaks after checking the move with the board class
  def get_move(column = nil)
    loop do
      column = ask_move
      break if @board.check_move(column, @piece)
    end
  end
end

# Computer class which inherits stuff from the Player class
class CPU < Player
  # method to randomly generate a move for now
  def generate_move
    rand(1..7)
  end

  def ask_move
    generate_move
  end
end
