require 'colorize'
require 'artii'

class GameView
    def welcome_text
        c4_text = Artii::Base.new :font => 'slant'
        puts c4_text.asciify('WELCOME TO C4 !').colorize(:blue)
        puts "Press ENTER to continue or -h for HELP!"
    end
end