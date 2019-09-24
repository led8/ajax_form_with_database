class AddValueColumnToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :value, :text
  end
end
