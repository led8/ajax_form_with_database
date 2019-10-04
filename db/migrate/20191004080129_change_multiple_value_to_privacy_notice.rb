class ChangeMultipleValueToPrivacyNotice < ActiveRecord::Migration[5.2]
  def change
    change_column :privacy_notices, :collected_data, :string
    change_column :privacy_notices, :collected_data, :string
    change_column :privacy_notices, :shared_data, :boolean, default: false, using: "shared_data::boolean"
  end
end
