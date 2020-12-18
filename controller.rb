require './validators'
require 'tty-prompt'

# default colours for pieces
$colour1 = :red
$colour2 = :yellow
# default names
$name1 = 'Player 1'
$name2 = 'Player 2'

class MainMenu
  def initialize(game_view)
    @game_view = game_view
  end

  def run
    def welcome
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
        {"Single Player" => -> do $game_type = 1 end},
        {"Two Player (2P)" => -> do $game_type = 2 end}, 
        {"Load saved game" => -> do $game_type = 3 end}, 
        {"Options" => -> do game_options end}, 
        {"Exit" => -> do exit end}
      ]
      prompt.select("Select from the following options:\n", @setup_prompt)
    end

    def game_options
      prompt = TTY::Prompt.new
      @options_prompt = [
        {"Name changer" => -> do name_options end},
        {"Colour selector" => -> do colour_selector end}, 
        {"Back" => -> do game_setup end}, 
        {"Exit" => -> do exit end}
      ]
      prompt.select("#{@game_view.options_text}", @options_prompt)
    end

    def name_options
      print "\nEnter Player 1's name: "
      $name1 = gets.chomp
      print "\nEnter Player 2's name: "
      $name2 = gets.chomp
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
      if colour1 == ''
        $colour1 = :red
      end
      if colour2 == ''
        $colour2 = :yellow
      end
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
      @player1 = Player.new($name1, "1", @board, $colour1)
      @player2 = CPU.new('Computer', "2", @board, $colour2)
      @current_player = @player2
      File.write('game.txt', 1)
    # two player mode
    elsif $game_type == 2
      @player1 = Player.new($name1, "1", @board, $colour1)
      @player2 = Player.new($name2, "2", @board, $colour2)
      @current_player = @player1
      File.write('game.txt', 2)
    # load previous save
    elsif $game_type == 3
      # if the previous game isn't a win/draw
      if $reset_game == 0
        # get the game type and current player from last game
        game_val = File.read("game.txt").to_i
        player_val = File.read("player.txt").to_i

        if game_val == 1
            @player1 = Player.new($name1, "1", @board, $colour1)
            @player2 = CPU.new('Computer', "2", @board, $colour2)
            if player_val == 1
                @current_player = @player1
            else
                @current_player = @player2
            end
        elsif game_val == 2
            @player1 = Player.new($name1, "1", @board, $colour1)
            @player2 = Player.new($name2, "2", @board, $colour2)
            if player_val == 1
                @current_player = @player1
            else
                @current_player = @player2
            end
        end
        # else start new game
      else 
        puts "There is no saved game to load."
        print "\nStarting new game! Would you like to play single or 2P mode?(1-2): "
        gets
      end
    end
  end

  # method for running the game, which is a loop
  def run
    loop do
      $reset_game = 0
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
      break if $loop_break == 1
    end
  end

  # method for alternating players turn
  def change_turn(current_player)
    if current_player == @player1
      @current_player = @player2
      File.write('player.txt', 2)
    elsif current_player == @player2
      @current_player = @player1
      File.write('player.txt', 1)
    end
  end

  def display_draw
    @board.render
    puts "\nIt's a draw!"
    puts 'Press ENTER to return to menu!'
    gets
    $loop_break = 1
    $reset_game = 1
  end

  def display_win
    @board.render
    print "\n#{@current_player.name} ".colorize(@current_player.colour)
    print  "WINS!"
    puts "\nPress ENTER to return to menu!"
    gets
    $loop_break = 1
    $reset_game = 1
  end

  def game_reset
    C4Game.new
  end
end
