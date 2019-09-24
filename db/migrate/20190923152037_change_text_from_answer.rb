class ChangeTextFromAnswer < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :text, :label
  end
end
