class AddNewColumnsToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :modal_request, :boolean, default: false
    add_column :answers, :modal_request_header, :string
  end
end
