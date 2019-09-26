class PrivacyNotice < ApplicationRecord
  serialize :collected_data, Array
  serialize :data_tag, Array
  serialize :reused_data, Array

  before_save :convert_type_of_operation
  before_save :convert_organizer
  before_save :convert_organizer_under_contract
  before_save :convert_agency_name
  before_save :convert_collected_data
  before_save :convert_environment
  before_save :convert_shared_data
  before_save :convert_reused_data

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
      self.agency_name = "a chargé #{@answer.where(value: '7'.split).last.label}"
    elsif self.agency_name == "8"
      self.agency_name = "a chargé '#{@answer.where(value: '7'.split).last.label}'"
    elsif self.agency_name == "9"
      self.agency_name = nil
    end
  end

  def convert_collected_data
    @answers = Answer.all
    if self.collected_data == "10"
      self.collected_data = "#{@answer.where(value: '10'.split).last.label}"
    elsif self.collected_data == "11"
      self.collected_data = "#{@answer.where(value: '11'.split).last.label}"
    elsif self.collected_data == "12"
      self.collected_data = "#{@answer.where(value: '12'.split).last.label}"
    end
  end

  def convert_environment
    @answers = Answer.all
    if self.environment == "14"
      self.environment = "#{@answer.where(value: '14'.split).last.label}"
    elsif self.environment == "15"
      self.environment = "#{@answer.where(value: '15'.split).last.label}"
    elsif self.environment == "16"
      self.environment = "#{@answer.where(value: '16'.split).last.label}"
    elsif self.environment == "17"
      self.environment = "#{@answer.where(value: '17'.split).last.label}"
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
    if self.reused_data == "20"
      self.reused_data = nil
    elsif self.reused_data == "21"
      self.reused_data = "à des fins promotionnelles et marketing / par les personnes destinataires des messages promotionnels ou marketing intégrant votre contenu".split('/')
    elsif self.reused_data == "22"
      self.resued_data = "vous envoyer des enquêtes des satisfaction / vous envoie des enquêtes de satisfaction".split('/')
    elsif self.reused_data == "23"
      self.reused_data == "pour élaborer des statistiques / réalise des statistiques".split('/')
    elsif self.reused_data == "24"
      self.reused_data = "des offres promotionnelles.".split('.')
    elsif self.reused_data == "25"
      self.reused_data = []
    end
  end

end
