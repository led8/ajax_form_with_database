class PrivacyNoticesController < ApplicationController
  before_action :set_privacy_notice, only: [:show]
  respond_to :docx

  def index
    render :index
  end

  def show
  end

  def new
    @privacy_notice = PrivacyNotice.new
    @questions = Question.all
    @answers = Answer.all
  end

  def create
    @privacy_notice = PrivacyNotice.new(privacy_notice_params)
    respond_to do |format|
      if @privacy_notice.save
        format.html { redirect_to @privacy_notice, notice: "Privacy Notice was successfully created." }
        format.json { render :show, status: :created, location: @privacy_notice }
      else
        format.html { redirect_to root_path, notice: "An error occured please contact IT" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def template_one
    @privacy_notice = PrivacyNotice.find(params[:privacy_notice_id])
    respond_to do |format|
      if @privacy_notice.data_tag.empty? == false
        format.docx do
          render docx: 'template_one', filename: 'privacy_notice.docx'
        end
      else
        redirect_to root_path
      end
    end
  end

  def template_two
    @privacy_notice = PrivacyNotice.find(params[:privacy_notice_id])
    respond_to do |format|
      if @privacy_notice.data_tag.empty?
        format.docx do
          render docx: 'template_two', filename: 'privacy_notice.docx'
        end
      else
        redirect_to root_path
      end
    end
  end

  private

  def privacy_notice_params
    params.permit(:type_of_operation, :organizer, :collected_data, :environment, :shared_data, :agency_name, :data_tag, reused_data:[])
  end

  def set_privacy_notice
    @privacy_notice = PrivacyNotice.find(params[:id])
  end
end
