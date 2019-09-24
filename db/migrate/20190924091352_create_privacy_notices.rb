class CreatePrivacyNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :privacy_notices do |t|
      t.string :type_of_operation
      t.string :organizer
      t.text :collected_data
      t.string :environment
      t.string :shared_data
      t.text :reused_data
    end
  end
end
