class PagesController < ApplicationController
  def home
    @privacy_notice = PrivacyNotice.new
  end

  def test
    @questions = Question.all
    @privacy_notice = PrivacyNotice.find(params[:privacy_notice_id])
    render :test
  end
end
