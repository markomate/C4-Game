class Player
  attr_accessor :name, :piece, :board

  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end

  def ask_move
    puts "Enter a number between 1-7:"
    gets.to_i
  end
end
