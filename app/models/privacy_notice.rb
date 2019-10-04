class PrivacyNotice < ApplicationRecord
  #serialize :data_tag, Array
  serialize :reused_data, Array
  serialize :accessible_data, Array
  serialize :retained_data, Array

  before_save :convert_type_of_operation
  before_save :convert_organizer
  before_save :convert_organizer_under_contract
  before_save :convert_agency_name
  before_save :convert_collected_data
  before_save :convert_environment
  before_save :convert_shared_data
  before_save :convert_accessible_data
  before_save :convert_retained_data
  before_save :convert_reused_data
  before_save :convert_data_tag

  private

  def convert_type_of_operation
    if self.type_of_operation == "1"
      self.type_of_operation = "contest"
    elsif self.type_of_operation == "2"
      self.type_of_operation = "event"
    end
  end

  def convert_organizer
    if self.organizer == "3"
      self.organizer = "Ubisoft"
    elsif self.organizer == "4"
      self.organizer = "External agency"
    end
  end

  def convert_organizer_under_contract
    if self.organizer_under_contract == "5"
      self.organizer_under_contract = true
    elsif self.organizer_under_contract == "6"
      self.organizer_under_contract = false
    end
  end

  def convert_agency_name
    @answers = Answer.all
    if self.agency_name == "7"
      self.agency_name = "#{@answers.where(value: '7'.split).last.label}"
    elsif self.agency_name == "8"
      self.agency_name = "#{@answers.where(value: '7'.split).last.label}"
    elsif self.agency_name == "9"
      self.agency_name = nil
    end
  end

  def convert_collected_data
    @answers = Answer.all
    if self.collected_data == "10"
      self.collected_data = "Directly"
    elsif self.collected_data == "11"
      self.collected_data = "Indirectly"
    elsif self.collected_data == "12"
      self.collected_data = "Both"
    end
  end

  def convert_environment
    @answers = Answer.all
    if self.environment == "14"
      self.environment = "Ubisoft"
    elsif self.environment == "15"
      self.environment = "In-game"
    elsif self.environment == "16"
      self.environment = "Third party"
    elsif self.environment == "17"
      self.environment = "Social Network"
    end
  end

  def convert_shared_data
    if self.shared_data == "18"
      self.shared_data = true
    elsif self.shared_data == "19"
      self.shared_data = false
    end
  end

  def convert_reused_data
    if self.reused_data.include? "20"
      self.reused_data.delete "20"
      self.reused_data << "to create in-game content"
    end
    if self.reused_data.include? "21"
      self.reused_data.delete "21"
      self.reused_data << "to create promotional and marketing content"
    end
    if self.reused_data.include? "22"
      self.reused_data.delete "22"
      self.reused_data << "to send customer satisfaction survey"
    end
    if self.reused_data.include? "23"
      self.reused_data.delete "23"
      self.reused_data << "to conduct analytics about user experience"
    end
    if self.reused_data.include? "24"
      self.reused_data.delete "24"
      self.reused_data << "to send promotional offers"
    end
    if self.reused_data.include? "25"
      self.reused_data.delete "25"
      self.reused_data << "other"
    end
  end

  def convert_accessible_data
    self.accessible_data << "by recipients of promotional or marketing messages" if self.reused_data.include? "21"
  end

  def convert_retained_data
    self.retained_data << "to send you satisfaction survey" if self.reused_data.include? "22"
    self.retained_data << "manage analytics" if self.reused_data.include? "23"
    self.retained_data << "to send you promotional offers" if self.reused_data.include? "24"
  end

  def convert_data_tag
    if self.data_tag
      self.data_tag = self.data_tag.gsub('[', '').gsub(']', '').gsub('{"value":', '').gsub('}', '').gsub('"', '')
    end
  end
end
