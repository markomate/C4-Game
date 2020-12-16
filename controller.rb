require './validators'

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
      else
        puts "\nSelect from the following options:"
        @game_view.game_options
      end
    end
    welcome
  end
end

class C4Game
    def initialize
        @board = Board.new

        if game_option == 1
            @player1 = Player.new("Player 1", :●, @board)
            @player2 = CPU.new("Player 2", :○, @board)
            @current_player = @player2
        
        else
            @player1 = Player.new("Player 1", :●, @board)
            @player2 = Player.new("Player 2", :○, @board)
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
            # change current player
            change_turn(@current_player)
        end
    end
    # method for determining which game type or to resume from save
    def game_option
        # prompt to start games and generate player/cpu
        begin
          input = gets.strip.to_i
        end until input == 1 || input == 2
        return input
    end

    # method for alternating players turn
    def change_turn(current_player)
        if current_player == @player1
            @current_player = @player2
        elsif current_player == @player2
            @current_player = @player1
        end
      end

end