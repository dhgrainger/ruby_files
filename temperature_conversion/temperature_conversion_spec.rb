require 'rspec'
require_relative 'temperature_conversion'

describe TemperatureConversion do
  it 'converts between Fahrenheit and Celsius' do
    expect(TemperatureConversion.new(0).convert_to_fahrenheit).to eq(32)
  end

  it 'converts between fahrenheit and celsius' do
  	expect(TemperatureConversion.new(100).convert_to_fahrenheit).to eq(212)
  end

  it 'converts from Fahrenheit freezing to Celsius freezing' do
    expect(TemperatureConversion.new(32).convert_to_celsius).to eq(0)
  end
end