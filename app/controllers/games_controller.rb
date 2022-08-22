class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
     @letters << [*'a'..'z'].sample
    end
  end

  def score
   word = params[:word]
   letters = JSON.parse(params[:letters])
   guess_letters = word.chars
   @count = guess_letters.all? {|letter| word.count(letter) <= letters.count(letter) }
   if @count
    valid_word_check = URI.open("https://wagond-dictionary.herokuapp.com/#{word}")
     is_valid = JSON.parse(valid_word_check) ["found"]
     if is_valid
        @result = "Horray you picked a vlaid word"
     else
        @result = "sorry, #{word} is not an english word"
     end
   else
     @result = "sorry you can't build #{word} with these letters"
   end
  end
end
