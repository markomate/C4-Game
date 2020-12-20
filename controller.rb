require './validators'
require 'tty-prompt'

# default name and colour
$colour1 = :red
$colour2 = :yellow
$name1 = 'Player 1'
$name2 = 'Player 2'
# saved name and colour
$name1 = File.read('saves/name1.txt')
$name2 = File.read('saves/name2.txt')
$colour1 = File.read('saves/colour1.txt').to_sym
$colour2 = File.read('saves/colour2.txt').to_sym


class MainMenu
  def initialize(game_view)
    @game_view = game_view
  end

  def run
    def welcome
      system('clear')
      @game_view.welcome_text
      input = gets.chomp.to_s
      if input == '-h'
        @game_view.game_help
        game_setup
      else
        game_setup
      end
    end

    def game_setup
      prompt = TTY::Prompt.new
      @setup_prompt = [
        { 'Single Player' => -> do $game_type = 1 end },
        { 'Two Player (2P)' => -> do $game_type = 2 end },
        { 'Load saved game' => -> do game_check end },
        { 'Options' => -> do game_options end },
        { 'Exit' => -> do exit end }
      ]
      prompt.select("\nSelect from the following options:\n", @setup_prompt)
    end

    def game_options
      system('clear')
      prompt = TTY::Prompt.new
      @options_prompt = [
        { 'Name changer' => -> do name_options end },
        { 'Colour selector' => -> do colour_selector end },
        { 'Back' => -> do game_setup end },
        { 'Exit' => -> do exit end }
      ]
      prompt.select(@game_view.options_text.to_s, @options_prompt)
    end

    def game_check
      game_state = File.read('saves/game_state.txt').to_i
      # if the previous game isn't a win/draw
      if game_state == 0
        $game_type = 3
        
      else
        puts "\nThere is no saved game to load! Please press ENTER to return to menu"
        gets
        game_setup
      end
    end

    def name_options
      print "\nEnter Player 1's name: "
      $name1 = gets.chomp
      File.write('saves/name1.txt', $name1)
      print "\nEnter Player 2's name: "
      $name2 = gets.chomp
      File.write('saves/name2.txt', $name2)
      game_options
    end

    def colour_selector
      @game_view.colour_options
      print "\nPlease enter a colour for Player 1: "
      colour1 = gets.chomp.downcase
      input_valid = Validators.validate_colour(colour1)
      unless input_valid
        @game_view.error_msg
        colour_selector
      end
      print 'Please enter a colour for Player 2: '
      colour2 = gets.chomp.downcase
      input_valid = Validators.validate_colour(colour2)
      unless input_valid
        @game_view.error_msg
        colour_selector
      end
      $colour1 = colour1.to_sym
      $colour2 = colour2.to_sym
      # if nothing is entered, reset to default colour
      $colour1 = :red if colour1 == ''
      $colour2 = :yellow if colour2 == ''
      # save to txt file for save/load feature
      File.write('saves/colour1.txt', $colour1)
      File.write('saves/colour2.txt', $colour2)
      game_options
    end
    welcome
  end
end

class C4Game
  def initialize
    # creates a new board with chosen piece colours
    @board = Board.new($colour1, $colour2)
    # single player mode
    if $game_type == 1
      @player1 = Player.new($name1, '1', @board, $colour1)
      @player2 = CPU.new('Computer', '2', @board, $colour2)
      @current_player = @player2
      File.write('saves/game_type.txt', 1)
    # two player mode
    elsif $game_type == 2
      @player1 = Player.new($name1, '1', @board, $colour1)
      @player2 = Player.new($name2, '2', @board, $colour2)
      @current_player = @player1
      File.write('saves/game_type.txt', 2)
    # load previous save
    elsif $game_type == 3
        # get the game type and current player from last game as well as their name and colour
        game_type = File.read('saves/game_type.txt').to_i
        player = File.read('saves/player.txt').to_i

        if game_type == 1
          @player1 = Player.new($name1, '1', @board, $colour1)
          @player2 = CPU.new('Computer', '2', @board, $colour2)
          @current_player = if player == 1
                              @player1
                            else
                              @player2
                            end
        elsif game_type == 2
          @player1 = Player.new($name1, '1', @board, $colour1)
          @player2 = Player.new($name2, '2', @board, $colour2)
          @current_player = if player == 1
                              @player1
                            else
                              @player2
                            end
        end
    end
  end

  # method containing the game loop
  def run
    loop do
      # game state variable for the save feature
      File.write('saves/game_state.txt', 0)
      # display the board
      @board.render
      # get a move from the current player
      @current_player.get_move
      # check if move is a win and display a win message if it is
      display_win if @board.win?(@current_player.piece)
      # check if move is a draw and display a draw message if it is
      display_draw if @board.draw?
      # change current player
      change_turn(@current_player)
      # break the loop if there's a win or draw
      game_state = File.read('saves/game_state.txt').to_i
      break if game_state == 1 || $loop_break == 1
    end
  end

  # method for alternating players turn
  def change_turn(current_player)
    if current_player == @player1
      @current_player = @player2
      # player variable for the save feature
      File.write('saves/player.txt', 1)
    elsif current_player == @player2
      @current_player = @player1
      File.write('saves/player.txt', 2)
    end
  end

  def display_draw
    # game state variable for the save feature
    File.write('saves/game_state.txt', 1)
    @board.render
    puts ""
    puts "\nIt's a draw!"
    puts 'Press ENTER to return to menu!'
    gets
  end

  def display_win
    # game state variable for the save feature
    File.write('saves/game_state.txt', 1)
    @board.render
    puts ""
    print "\n#{@current_player.name} ".colorize(@current_player.colour)
    print 'WINS!'
    puts "\nPress ENTER to return to menu!"
    gets
  end
end
