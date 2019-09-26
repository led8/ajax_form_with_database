class AddParamColumnToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :parameter, :string
  end
end
