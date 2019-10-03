class PrivacyNotice < ApplicationRecord
  #serialize :data_tag, Array
  serialize :reused_data, Array

  before_save :convert_type_of_operation
  before_save :convert_organizer
  before_save :convert_organizer_under_contract
  before_save :convert_agency_name
  before_save :convert_collected_data
  before_save :convert_environment
  before_save :convert_shared_data
  before_save :convert_reused_data
  before_save :convert_data_tag

  private

  def convert_type_of_operation
    if self.type_of_operation == "1"
      self.type_of_operation = "du jeu concours"
    elsif self.type_of_operation == "2"
      self.type_of_operation = "de l'évènement"
    end
  end

  def convert_organizer
    if self.organizer == "3"
      self.organizer = "collecte et traite vos données personnelles"
    elsif self.organizer == "4"
      self.organizer = "de collecter et traiter les données personnelles suivantes"
    end
  end

  def convert_organizer_under_contract
    if self.organizer_under_contract == "5"
      self.convert_organizer_under_contract = true
    elsif self.organizer_under_contract == "6"
      self.convert_organizer_under_contract = false
    end
  end

  def convert_agency_name
    @answers = Answer.all
    if self.agency_name == "7"
      self.agency_name = "a chargé #{@answers.where(value: '7'.split).last.label}"
    elsif self.agency_name == "8"
      self.agency_name = "a chargé '#{@answers.where(value: '7'.split).last.label}'"
    elsif self.agency_name == "9"
      self.agency_name = nil
    end
  end

  def convert_collected_data
    @answers = Answer.all
    if self.collected_data == "10"
      self.collected_data = "#{@answers.where(value: '10'.split).last.label}"
    elsif self.collected_data == "11"
      self.collected_data = "#{@answers.where(value: '11'.split).last.label}"
    elsif self.collected_data == "12"
      self.collected_data = "#{@answers.where(value: '12'.split).last.label}"
    end
  end

  def convert_environment
    @answers = Answer.all
    if self.environment == "14"
      self.environment = "#{@answers.where(value: '14'.split).last.label}"
    elsif self.environment == "15"
      self.environment = "#{@answers.where(value: '15'.split).last.label}"
    elsif self.environment == "16"
      self.environment = "#{@answers.where(value: '16'.split).last.label}"
    elsif self.environment == "17"
      self.environment = "#{@answers.where(value: '17'.split).last.label}"
    end
  end

  def convert_shared_data
    if self.shared_data == "18"
      self.shared_data = "partager le contenu que vous publierez"
    elsif self.shared_data == "19"
      self.shared_data = nil
    end
  end

  def convert_reused_data
    if self.reused_data.include? "20"
      self.reused_data.delete "20"
      self.reused_data << { in_game: nil }
    end
    if self.reused_data.include? "21"
      self.reused_data.delete "21"
      self.reused_data << { marketing: "à des fins promotionnelles et marketing/par les personnes destinataires des messages promotionn ou marketing intégrant votre contenu".split('/') }
    end
    if self.reused_data.include? "22"
      self.reused_data.delete "22"
      self.reused_data << { survey: "vous envoyer des enquêtes des satisfaction/vous envoie des enquêtes de satisfaction".split('/') }
    end
    if self.reused_data.include? "23"
      self.reused_data.delete "23"
      self.reused_data << { stats: "pour élaborer des statistiques/réalise des statistiques".split('/') }
    end
    if self.reused_data.include? "24"
      self.reused_data.delete "24"
      self.reused_data << { promotional: "des offres promotionnelles.".split('.') }
    end
    if self.reused_data.include? "25"
      self.reused_data.delete "25"
      self.reused_data << { other: nil }
    end
  end

  def convert_data_tag
    if self.data_tag
      #self.data_tag.gsub('[', '').gsub(']', '').gsub('{"value":', '').gsub('}', '').gsub('"', '').split(',')
      self.data_tag = self.data_tag.gsub('[', '').gsub(']', '').gsub('{"value":', '').gsub('}', '').gsub('"', '')
    end
  end
end
