# This migration comes from spree_point_system (originally 20160225002342)
class CreatePointActions < ActiveRecord::Migration
  def change
    create_table :point_actions do |t|
      t.references :point_category, index: true, foreign_key: true
      t.integer :user_id
      t.integer :pictorial_id

      t.timestamps null: false
    end
  end
end
