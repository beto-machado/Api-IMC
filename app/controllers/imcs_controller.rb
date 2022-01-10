class ImcsController < ApplicationController

  def calculate_imc
    weight = Float(params[:weight])
    height = Float(params[:height])
    @imc = weight/(height * height)

    if(@imc <= 18.5)
      mensagem = 'Baixo peso'
      obesity = '0'
    elsif((@imc > 18.5) && (@imc < 25))
      mensagem = 'Peso normal'
      obesity = '0'
    elsif((@imc > 24.9) && (@imc < 30))
      mensagem = 'Sobrepeso'
      obesity = '0'
    elsif((@imc > 29.9) && (@imc < 35))
      mensagem = 'Obesidade'
      obesity = 'Grau I'
    elsif((@imc > 34.9) && (@imc < 39.9))
      mensagem = 'Obesidade'
      obesity = 'Grau II'
    elsif(@imc >= 40)
      mensagem = 'Obesidade'
      obesity = 'Grau III'
    end

    render json: { imc: @imc.round(2), classification: mensagem, obesity: obesity }, status: :ok
  end

end
