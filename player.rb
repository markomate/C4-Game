class Player
  attr_accessor :name, :piece, :board

  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end

  # method for asking for a move, validating it is an option then returning user input
  def ask_move
    puts "\n#{@name} please enter a move:"
    input = gets.to_i
    input_valid = Validators.validate_column(input)
    if !input_valid
      puts 'Invalid input, try again!'
      ask_move
    else input
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
