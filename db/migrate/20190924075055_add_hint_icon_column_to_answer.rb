class AddHintIconColumnToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :hint_icon, :string
  end
end
