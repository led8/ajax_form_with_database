class AddTwoColumnToPrivacyNotice < ActiveRecord::Migration[5.2]
  def change
    add_column :privacy_notices, :accessible_data, :text
    add_column :privacy_notices, :retained_data, :text
  end
end
