class Board
  attr_accessor :board

  def initialize
    @board = empty_board
  end
  # setting up the game board
  def empty_board
    c4board = Array[
      ['O', 'O', 'O', 'O', 'O', 'O', 'O'],
      ['O', 'O', 'O', 'O', 'O', 'O', 'O'],
      ['O', 'O', 'O', 'O', 'O', 'O', 'O'],
      ['O', 'O', 'O', 'O', 'O', 'O', 'O'],
      ['O', 'O', 'O', 'O', 'O', 'O', 'O'],
      ['O', 'O', 'O', 'O', 'O', 'O', 'O'],
    ]
    return c4board
  end

  def render
    puts " _____________"
    @board.each do |x|
      print "|"
      # Loop over each cell in the row.
      x.each do |cell|
          print cell
          print "|"
      end
  
      # End of row.
      print "\n"
    end
    puts "-1-2-3-4-5-6-7-"
  end

end