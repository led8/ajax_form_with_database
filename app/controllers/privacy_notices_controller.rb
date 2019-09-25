class PrivacyNoticesController < ApplicationController
  def new
    @privacy_notice = PrivacyNotice.new
    @questions = Question.all
  end

  def create
    @privacy_notice = PrivacyNotice.new(privacy_notice_params)
    respond_to do |format|
      if @privacy_notice.save
        format.html { redirect_to root_path, notice: "Privacy Notice was successfully created." }
      else
        format.html { redirect_to root_path, notice: "Nothing created." }
      end
      format.js
    end
  end

  private

  def privacy_notice_params
    params.require(:privacy_notice).permit(:type_of_operation, :organizer, :collected_data, :environment, :shared_data, :reused_data)
  end
end
