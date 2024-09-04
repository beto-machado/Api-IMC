class Client < ApplicationRecord
  has_one :imc, dependent: :destroy
  before_save :calculate_imc

  private

  def calculate_imc
    if height.present? && weight.present? && height > 0
      imc_value = (weight / (height ** 2)).round(2)
      imc_classification = Imc.classify(imc_value)
      if imc.present?
        imc.update(value: imc_value, message: imc_classification[:message], obesity_degree: imc_classification[:obesity])
      else
        build_imc(value: imc_value, message: imc_classification[:message], obesity_degree: imc_classification[:obesity])
      end
    else
      imc&.destroy
    end
  end
end
