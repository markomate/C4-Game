class GameController
    def initialize(game_view)
        @game_view = game_view
    end

    def run
        @game_view.welcome_text
    end
end