class ChangeHintIconColumnFromAnswer < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :hint_icon, :modal_request_icon
  end
end
