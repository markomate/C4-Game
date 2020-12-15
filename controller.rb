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
        @player1 = Player.new("Player 1", :R, @board)
        @player2 = Player.new("Player 2", :Y, @board)

        run
    end
    
    def run
        @board.render
    end
end
