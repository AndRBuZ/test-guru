class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0, null: false
      t.references :category_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
