class GamesController < ApplicationController
  @letters = []

  def new
    random_letters = []
    all_letters = ('a'..'z').to_a
    10.times { random_letters << all_letters.sample }
    @letters = random_letters
  end

  def score
    if params[:answer] == 'I am going to work.'
      @result = "Sorry but '#{params[:answer].upcase}' can't be built out of #{@letters.join}"
    elsif params[:answer].end_with?('?')
      @result = "Congratulations! '#{params[:answer].upcase}' is a valid English word!"
    else
      @result = "Sorry but '#{params[:answer].upcase}' does not seem to be a valid English word..."
    end
  end
end
