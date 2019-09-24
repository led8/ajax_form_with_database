class ChangeValueFromAnswer < ActiveRecord::Migration[5.2]
  def change
    change_column :answers, :value, :text, array: true, default: [], using: "(string_to_array(value, ','))"
  end
end
