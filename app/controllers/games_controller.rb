class GamesController < ApplicationController
  def new
    random_letters = []
    all_letters = ('a'..'z').to_a
    10.times { random_letters << all_letters.sample }
    @letters = random_letters
  end

  def score
    @answer = params[:answer]
    @letters = params[:letters]
    @word_test = check_letters(@letters, @answer)
  end

  def check_letters(ten_letters, answer)
    answer_letters = answer.chars
    answer_letters.all? { |letter| answer_letters.count(letter) <= ten_letters.count(letter) }
  end
end
