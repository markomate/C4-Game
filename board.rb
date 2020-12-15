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
end
