class GameController
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
                setup()
            end
        end

        def setup
            @game_view.game_options
            input = gets.to_i
            case input
                when 1
                    single_player()
                when 2
                    two_player()
                when 3
                    resume_save()
                when 4
                    system('exit')
                else
                    puts "\nPlease enter a valid option."
                    setup()
            end
        end

        welcome()
    end
end