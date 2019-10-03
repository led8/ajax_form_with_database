class PagesController < ApplicationController
  def home
    @privacy_notice = PrivacyNotice.new
  end

  def test
    @questions = Question.all
    gon.questions = @questions
    render :test
  end
end
