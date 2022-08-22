class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.shuffle.take(10)
  end

  def score
   #raise
  end
end
