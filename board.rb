require 'colorize'

class Board
  attr_accessor :board

  def initialize(colour1, colour2)
    @board = empty_board
    @colour1 = colour1
    @colour2 = colour2
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
    puts ' _____________'.colorize(:blue)
    @board.each do |x|
      print '|'.colorize(:blue)
      # Loop over each cell in the row.
      x.each do |cell|
        if cell == :'1'
          print "●".colorize(@colour1)
          print '|'.colorize(:blue)
        elsif cell == :'2'
          print "●".colorize(@colour2)
          print '|'.colorize(:blue)
        else
        print "○".colorize(:blue)
        print '|'.colorize(:blue)
        end
      end
      # End of row.
      print "\n"
    end
    
    i = 1
    loop do
      print "-".colorize(:blue)
      print "#{i}"
      i += 1
      if i == 8
        print "-".colorize(:blue)
        break
      end
    end
  end

  def drop_piece(coulmn, piece)
    x = coulmn
    x -= 1
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
    end
  end

  def check_room?(column)
    x = column
    x -= 1
    @board[0][x] == "O" ? true : false
  end

  def check_move(column, piece)
      if check_room?(column)
        drop_piece(column, piece)
        true
      else
        puts "That column is full!"
        false
      end
  end
end
