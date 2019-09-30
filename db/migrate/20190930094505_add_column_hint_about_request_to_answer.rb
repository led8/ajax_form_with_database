class AddColumnHintAboutRequestToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :hint_about_request, :text
  end
end
