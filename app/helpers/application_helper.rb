module ApplicationHelper
  def serialize_type_of_operation(param)
    param == "contest" ? "of the contest" : "of the event"
  end

  def serialize_organizer(param)
    param == "Ubisoft" ? "collect and process" : "to collect and process"
  end

  def serialize_collected_data(param)
    param == "Directly" ? "your personal data" : "the following personal data"
  end

  def serialize_data_tag(param)
    param.split(',')
  end
end
