class AddRuleParameterToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule_parameter, :integer, null: false
  end
end
