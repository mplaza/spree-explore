# This migration comes from spree_point_system (originally 20160225002048)
class CreatePointCategories < ActiveRecord::Migration
  def change
    create_table :point_categories do |t|
      t.string :category

      t.timestamps null: false
    end
  end
end
