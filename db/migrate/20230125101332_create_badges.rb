class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :img_name, null: false
      t.index :title, unique: true

      t.timestamps
    end
  end
end
