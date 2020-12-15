class Player
  attr_accessor :name, :piece, :board

  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end
end
