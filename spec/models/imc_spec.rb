require 'rails_helper'

RSpec.describe Imc, type: :model do
  describe '.classify' do
    it 'returns "Low weight" for IMC <= 18.5' do
      result = Imc.classify(18.5)
      expect(result[:message]).to eq('Low weight')
      expect(result[:obesity]).to eq('0')
    end

    it 'returns "Normal weight" for IMC > 18.5 and <= 25' do
      result = Imc.classify(20.0)
      expect(result[:message]).to eq('Normal weight')
      expect(result[:obesity]).to eq('0')
    end

    it 'returns "Overweight" for IMC > 25 and <= 30' do
      result = Imc.classify(28.0)
      expect(result[:message]).to eq('Overweight')
      expect(result[:obesity]).to eq('0')
    end

    it 'returns "Obesity" with "Degree I" for IMC > 30 and <= 35' do
      result = Imc.classify(32.0)
      expect(result[:message]).to eq('Obesity')
      expect(result[:obesity]).to eq('Degree I')
    end

    it 'returns "Obesity" with "Degree II" for IMC > 35 and <= 40' do
      result = Imc.classify(37.0)
      expect(result[:message]).to eq('Obesity')
      expect(result[:obesity]).to eq('Degree II')
    end

    it 'returns "Obesity" with "Degree III" for IMC > 40' do
      result = Imc.classify(42.0)
      expect(result[:message]).to eq('Obesity')
      expect(result[:obesity]).to eq('Degree III')
    end
  end
end
