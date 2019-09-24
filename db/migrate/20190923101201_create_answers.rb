class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :text
      t.text :hint
      t.string :hint_header
      t.string :answer_type
      t.integer :order
      t.references :question, foreign_key: true
    end
  end
end
