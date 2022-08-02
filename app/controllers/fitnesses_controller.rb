class FitnessesController < ApplicationController
  def index
    @we = params.dig(:fitness, :weight).to_f
    @gr = params.dig(:fitness, :growth).to_f
    @wynik = (@we / (@gr**2))
    @result = converter
  end
   
  private 

  def converter
    if @wynik >= 1
      "Nadwaga"
    else
      "Waga w nomie"
    end
  end
end
