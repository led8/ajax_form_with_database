class ChangeColumnNameToAnswer < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :hint, :modal_content
    rename_column :answers, :hint_header, :modal_header
    rename_column :answers, :hint_about_request, :modal_about_request
  end
end
