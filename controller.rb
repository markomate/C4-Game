class MainMenu
  def initialize(game_view)
    @game_view = game_view
  end

  def run
    def welcome
      @game_view.welcome_text
      input = gets.chomp
      if input == '-h'
        @game_view.game_help
      else
        puts "\nSelect from the following options:"
        @game_view.game_options
        setup
      end
    end

    def setup
      input = gets.to_i
      case input
      when 1
        return
      when 2
        two_player
      when 3
        resume_save
      when 4
        system('exit')
      else
        puts "\nPlease enter a valid option."
        setup
      end
    end

    def single_player
      puts "\nPlease enter your name:"
      input = gets.chomp.to_s
    end

    def two_player; end

    def resume_save; end

    welcome
  end
end

class C4Game
    def initialize
        @board = Board.new
        @player1 = Player.new("Player 1", :●, @board)
        @player2 = Player.new("Player 2", :○, @board)
        @current_player = @player1

        run
    end
    # method for running the game which is a loop
    def run
        loop do
            # display the board
            @board.render
            # get a move from the current player
            @current_player.get_move
            # check if move is a win and display a win message if it is
            # check if move is a draw and display a draw message if it is
            # change current player
            change_turn(@current_player)
        end
    end

    def change_turn(current_player)
        if current_player == @player1
            @current_player = @player2
        elsif current_player == @player2
            @current_player = @player1
        end
      end

end
