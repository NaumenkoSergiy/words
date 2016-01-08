class DashboardController < ApplicationController
  def index
    if params[:answer]
      word_by_answer
    else
      @word = Word.find(rand(1..words_length)).send(translate_version) if words_length != 0
    end
  end

  private

  def words_length
    @words_length ||= Word.count
  end

  def translate_version
    rand(0..1) == 0 ? 'english' : 'ukraine'
  end

  def word_by_answer
    @word = Word.find_by(english: params[:answer]).try(:ukraine)
    @word = Word.find_by(ukraine: params[:answer]).english unless @word
  end
end
