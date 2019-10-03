class AddColumnToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :modal, :boolean, default: false
  end
end
