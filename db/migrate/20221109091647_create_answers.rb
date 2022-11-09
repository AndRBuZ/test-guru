class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :text, null: false
      t.boolean :correct, default: false
      t.references :question_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
