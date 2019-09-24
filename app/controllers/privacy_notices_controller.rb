class PrivacyNoticesController < ApplicationController
  def new
    @privacy_notice = PrivacyNotice.new
  end

  def create
    @privacy_notice = PrivacyNotice.new(privacy_notice_params)
    respond_to do |format|
      if @privacy_notice.save
        format.html { redirect_to root_path, notice: 'User profil was successfully created.' }
        format.js
      else
        format.html { redirect_to root_path, notice: 'Nothing created' }
        format.js
      end
    end
  end

  private

  def privacy_notice_params
    params.require(:user_profil).permit(:gender, :age, :size, :weight, :sport_frequencies, :sport_interests,
                                        :home_address, :work_address, :avatar, :confirmation_informations,
                                        :first_name, :last_name)
  end
end
