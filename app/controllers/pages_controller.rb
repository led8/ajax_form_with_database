class PagesController < ApplicationController
  def home
    @privacy_notice = PrivacyNotice.new
  end

  def test
    @privacy_notice = PrivacyNotice.new
    @questions = Question.all
    @answers = Answer.all
    gon.questions = @questions
    gon.answers = @answers
    render :test
  end
end
