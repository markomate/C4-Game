require '../validators.rb'
require_relative 'validators'

describe 'Validators.validate_column' do
  it 'checks if input is valid' do
    expect(Validators.validate_column(1)).to eq(true)
    expect(Validators.validate_column(2)).to eq(true)
    expect(Validators.validate_column(3)).to eq(true)
    expect(Validators.validate_column(4)).to eq(true)

    expect(Validators.validate_column(8)).to eq(false)
  end
end
