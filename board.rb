class Board
  attr_accessor :board

  def initialize
    @board = empty_board
  end

  # setting up the game board
  def empty_board
    Array[
      %w[O O O O O O O],
      %w[O O O O O O O],
      %w[O O O O O O O],
      %w[O O O O O O O],
      %w[O O O O O O O],
      %w[O O O O O O O],
    ]
  end

  def render
    system('clear')
    puts ' _____________'
    @board.each do |x|
      print '|'
      # Loop over each cell in the row.
      x.each do |cell|
        print cell
        print '|'
      end
      # End of row.
      print "\n"
    end
    puts '-1-2-3-4-5-6-7-'
  end

  def drop_piece(coulmn, piece)
    x = coulmn
    if @board[5][x] == "O"
       @board[5][x] = piece
    elsif @board[4][x] == "O"
      @board[4][x] = piece
    elsif @board[3][x] == "O"
      @board[3][x] = piece
    elsif @board[2][x] == "O"
      @board[2][x] = piece
    elsif @board[1][x] == "O"
      @board[1][x] = piece
    elsif @board[0][x] == "O"
      @board[0][x] = piece
    else
      puts "Enter a valid column"
    end
  end

end
