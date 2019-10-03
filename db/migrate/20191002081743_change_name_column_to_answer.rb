class ChangeNameColumnToAnswer < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :modal_about_request, :modal_request_content
  end
end
