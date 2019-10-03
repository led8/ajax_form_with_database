module ApplicationHelper
  def serialize_data_tag(param)
    param.split(',')
  end
end
