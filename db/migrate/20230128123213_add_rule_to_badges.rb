class AddRuleToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule, :string, null: false
  end
end
