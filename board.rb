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

  # method for displaying the board to the player/s
  def render
    # clears the screen before rendering
    system('clear')
    # iterates through every variable in the array
    puts ' _____________'.colorize(:blue)
    @board.each do |x|
      print '|'.colorize(:blue)
      x.each do |cell|
        if cell == :'1'
          print '●'.colorize(@colour1)
          print '|'.colorize(:blue)
        elsif cell == :'2'
          print '●'.colorize(@colour2)
          print '|'.colorize(:blue)
        else
          print '○'.colorize(:blue)
          print '|'.colorize(:blue)
        end
      end
      # end of row
      print "\n"
    end
    # loop for printing column numbers at the bottom
    i = 1
    loop do
      print '-'.colorize(:blue)
      print i.to_s
      i += 1
      if i == 8
        print '-'.colorize(:blue)
        break
      end
    end
  end

  # method for detecting the bottom empty slot and placing a piece
  def drop_piece(coulmn, piece)
    x = coulmn
    x -= 1
    if @board[5][x] == 'O'
      @board[5][x] = piece
    elsif @board[4][x] == 'O'
      @board[4][x] = piece
    elsif @board[3][x] == 'O'
      @board[3][x] = piece
    elsif @board[2][x] == 'O'
      @board[2][x] = piece
    elsif @board[1][x] == 'O'
      @board[1][x] = piece
    elsif @board[0][x] == 'O'
      @board[0][x] = piece
    end
  end

  # checks if there is room in the column
  def check_room?(column)
    x = column
    x -= 1
    @board[0][x] == 'O'
  end

  # method to place piece after confirming it is empty, returns true if placed or false if unable
  def check_move(column, piece)
    if check_room?(column)
      drop_piece(column, piece)
      true
    else
      draw?
      puts 'That column is full!'
      false
    end
  end

  def draw?
    # checks board if there are any empty slots and returns true if board is full
    if @board[0][0] != 'O' && @board[0][1] != 'O' && @board[0][2] != 'O' && @board[0][3] != 'O' && @board[0][4] != 'O' && @board[0][5] != 'O' && @board[0][6] != 'O'
      true
    else
      false
    end
  end

  # method which contains all possible win methods
  def win?(piece)
    return true if four_in_row(piece)
    return true if four_in_column(piece)
    return true if four_acending_left(piece)
    return true if four_acending_right(piece)
  end

  def four_in_row(piece)
    @board.each do |x|
      count = 0
      x.each do |cell|
        if cell == piece
          count += 1
        else
          count = 0
        end
        return true if count == 4
      end
    end
    false
  end

  def four_in_column(piece)
    (0..6).each do |i|
      count = 0
      @board.each_with_index do |_value, index|
        if @board[index][i] == piece
          count += 1
        else
          count = 0
        end
        return true if count == 4
      end
    end
    false
  end

  def four_acending_left(piece)
    row = 5
    column = 6
    piece_count = 0
    while row < @board.size && row >= 0 && column < @board[row].size && column >= 0
      if @board[row][column] == piece
        piece_count += 1
        column -= 1
        row -= 1
      else
        piece_count = 0
        column -= 1
        if column < 3
          row -= 1
          column = 6
        end
      end
      return true if piece_count == 4
    end
  end

  def four_acending_right(piece)
    row = 5
    column = 0
    count = 0
    while row < @board.size && row >= 0 && column < @board[row].size && column >= 0
      if @board[row][column] == piece
        count += 1
        column += 1
        row -= 1
      else
        count = 0
        column += 1
        if column > 3
          row -= 1
          column = 0
        end
      end
      return true if count == 4
    end
  end
end
