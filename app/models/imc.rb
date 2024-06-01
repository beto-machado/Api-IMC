class Imc < ApplicationRecord

  before_save :calculate

  def calculate
    result = (weight / (height * height)).round(2)
    self.imc_value = result.to_f

    message_result = message(result.to_f)
    self.message = message_result[:message]
    self.obesity = message_result[:obesity]
  end

  private

  def message(result)
    case result
    when 0..18.5
      message = 'Low weight'
      obesity = '0'
    when 18.5...25
      message = 'Normal weight'
      obesity = '0'
    when 25...30
      message = 'Overweight'
      obesity = '0'
    when 30...35
      message = 'Obesity'
      obesity = 'Degree I'
    when 35...40
      message = 'Obesity'
      obesity = 'Degree II'
    else
      message = 'Obesity'
      obesity = 'Degree III'
    end
    { message: message, obesity: obesity }
  end
end
