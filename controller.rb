require './validators'

# default colours for pieces
$colour1 = :red
$colour2 = :yellow

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
        setup
      else
        setup
      end
    end

    def setup
        @game_view.game_options
        input = gets.to_i
        input_valid = Validators.validate_option(input)
        if !input_valid
            @game_view.error_msg
            setup
        end
        if input == 1
            $game_type = input
        end
        if input == 2
            $game_type = input
        end
        if input == 3
            colour_selector
        end
        if input == 4
            exit
        end
    end

    def colour_selector
        @game_view.colour_options
        print "\nPlease enter a colour for Player 1: "
        colour1 = gets.chomp
        print "Please enter a colour for Player 2: "
        colour2 = gets.chomp
        $colour1 = colour1.to_sym
        $colour2 = colour2.to_sym
        setup
    end

    welcome
  end
end

class C4Game
    def initialize
        @board = Board.new($colour1, $colour2)

        if $game_type == 1
            @player1 = Player.new("Player 1", :'1', @board)
            @player2 = CPU.new("Computer", :'2', @board)
            @current_player = @player2
        
        else
            @player1 = Player.new("Player 1", :'1', @board)
            @player2 = Player.new("Player 2", :'2', @board)
            @current_player = @player1
        end
    end

    # method for running the game, which is a loop
    def run
        loop do
            # display the board
            @board.render
            # get a move from the current player
            @current_player.get_move
            # check if move is a win and display a win message if it is
            # check if move is a draw and display a draw message if it is
            display_draw if @board.draw?
            # change current player
            change_turn(@current_player)
        end
    end

    # method for alternating players turn
    def change_turn(current_player)
        if current_player == @player1
            @current_player = @player2
        elsif current_player == @player2
            @current_player = @player1
        end
    end

    def display_draw
        @board.render
        puts "\nIt's a draw!"
        puts "Press any key to EXIT"
        gets
        exit
    end
end