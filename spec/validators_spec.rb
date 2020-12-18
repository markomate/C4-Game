require '../validators'

describe 'Validators.validate_option' do
  it 'checks if input is valid' do
    expect(Validators.validate_option("1")).to eq(true)
    expect(Validators.validate_option("2")).to eq(true)
    expect(Validators.validate_option("3")).to eq(true)
    expect(Validators.validate_option("4")).to eq(true)

    expect(Validators.validate_option("6")).to eq(false)
  end
end