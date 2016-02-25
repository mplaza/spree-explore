# This migration comes from spree_point_system (originally 20160225003718)
class CreatePointAgreements < ActiveRecord::Migration
  def change
    create_table :point_agreements do |t|
      t.references :point_category, index: true, foreign_key: true
      t.decimal :cost_per_point, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
