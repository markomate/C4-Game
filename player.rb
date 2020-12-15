class Player
  attr_accessor :board, :name, :piece
    def initialize(name, piece, board)
      @name = name
      @piece = piece
      @board = board
    end
end