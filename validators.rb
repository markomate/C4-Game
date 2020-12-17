require 'rspec'

module Validators
  def self.validate_column(input)
    # convert input to integer
    num_input = input.to_i
    # if integer == 1..7 return true
    if num_input > 0 && num_input <= 7
      true
    # else return false
    else
      false
    end
  end

  def self.validate_option(input)
    # convert input to integer
    num_input = input.to_i
    # if integer == 1..5 return true
    if num_input > 0 && num_input <= 5
      true
    # else return false
    else
      false
    end
  end

  def self.validate_colour(input)
    if %w[red green yellow blue magenta cyan white light_red light_green light_yellow
          light_blue light_magenta light_cyan light_white].include?(input)
      true
    elsif input == ''
      true
    # else return false
    else
      false
    end
  end
end
