class AddHintIconColumnToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :hint_icon, :string
  end
end
