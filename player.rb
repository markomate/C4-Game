class Player
  attr_accessor :name, :piece, :board

  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end

  def ask_move
    puts "#{@name} please enter the number of the column:"
    input = gets.to_i
    input_valid = Validators.validate_column(input)
    if !input_valid
      puts "Invalid input, try again!"
      ask_move
    else return input
    end
  end

  def get_move(column = nil)
    loop do
      column = ask_move
      if @board.check_move(column, @piece)
        break
      end
    end
  end
end


class CPU < Player
  # method to randomly generate a move for now
  def generate_move
    return rand(1..7)
  end

  def ask_move
    generate_move
  end
end