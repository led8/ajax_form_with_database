module ApplicationHelper
  def serialize_type_of_operation(param)
    param == "contest" ? "du jeu concours" : "l'évènement"
  end

  def serialize_organizer(param)
    param == "Ubisoft" ? "collecte et traite" : "de collecter et traiter"
  end

  def serialize_collected_data(param)
    param == "Directly" ? "vos données personnelles" : "les données personnelles suivantes"
  end

  def serialize_data_tag(param)
    param.split(',')
  end
end
