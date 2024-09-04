class Imc < ApplicationRecord
  belongs_to :client

  def self.classify(result)
    case result
    when 0..18.5
      { message: 'Low weight', obesity: '0' }
    when 18.5...25
      { message: 'Normal weight', obesity: '0' }
    when 25...30
      { message: 'Overweight', obesity: '0' }
    when 30...35
      { message: 'Obesity', obesity: 'Degree I' }
    when 35...40
      { message: 'Obesity', obesity: 'Degree II' }
    else
      { message: 'Obesity', obesity: 'Degree III' }
    end
  end
end
