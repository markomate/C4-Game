module Validators
  def self.validate_column(input)
    # convert input to integer
    num_input = input.to_i
    # if integer == 1..7 return true
    if num_input > 0 && num_input <= 7
      return true
    # else return false
    else
      return false
    end
  end

  def self.validate_option(input)
    # convert input to integer
    num_input = input.to_i
    # if integer == 1..5 return true
    if num_input > 0 && num_input <= 5
      return true
    # else return false
    else
      return false
    end
  end

end