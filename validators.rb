require 'rspec'

module Validators
  def self.validate_column(input)
    # check input for exit command
    check_input = input.to_s
    num_input = input.to_i
    if check_input == 'E'
      $loop_break = 1
      true
    elsif num_input > 0 && num_input <= 7
      true
    end
  end

  def self.validate_colour(input)
    if %w[red green yellow blue magenta cyan white light_red light_green light_yellow
          light_blue light_magenta light_cyan light_white].include?(input)
      true
    elsif input == ''
      true
    end
  end
end
