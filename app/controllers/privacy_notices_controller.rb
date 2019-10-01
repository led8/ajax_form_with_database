class PrivacyNoticesController < ApplicationController
  before_action :set_privacy_notice, only: [:show]

  def show
  end

  def new
    @privacy_notice = PrivacyNotice.new
    @questions = Question.all
  end

  def create
    @privacy_notice = PrivacyNotice.new(privacy_notice_params)
    puts params
    respond_to do |format|
      if @privacy_notice.save
        format.html { redirect_to @privacy_notice, notice: "Privacy Notice was successfully created." }
        format.json { render :show, status: :created, location: @privacy_notice }
      else
        format.html { redirect_to root_path, notice: "Nothing created." }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  private

  def privacy_notice_params
    params.permit(:type_of_operation, :organizer, :collected_data, :environment, :shared_data, :agency_name, data_tag:[], reused_data:[])
  end

  def set_privacy_notice
    @privacy_notice = PrivacyNotice.find(params[:id])
  end
end

# PrivacyNotice.last.reused_data.each{|data| p data[:survey] if data.has_key?(:survey)}
