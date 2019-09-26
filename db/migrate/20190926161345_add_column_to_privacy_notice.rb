class AddColumnToPrivacyNotice < ActiveRecord::Migration[5.2]
  def change
    add_column :privacy_notices, :organizer_under_contract, :boolean, default: false
    add_column :privacy_notices, :agency_name, :string
    add_column :privacy_notices, :data_tag, :text
  end
end
