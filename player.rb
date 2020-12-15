class Player
  attr_accessor :name, :piece, :board

  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end

  def ask_move
    puts "Enter the number of the column:"
    gets.to_i
  end

  def get_move(column = nil)
    loop do
      column = ask_move
      @board.check_move(column, @piece)
      puts "this worked"
      break
    end
  end

end
