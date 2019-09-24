class PagesController < ApplicationController
  def home
    @privacy_notice = PrivacyNotice.new
  end
end
