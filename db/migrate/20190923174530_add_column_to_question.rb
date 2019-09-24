class AddColumnToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :hint, :text
  end
end
