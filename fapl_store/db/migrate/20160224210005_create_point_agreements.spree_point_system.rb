# This migration comes from spree_point_system (originally 20160224192519)
class CreatePointAgreements < ActiveRecord::Migration
  def change
    create_table :point_agreements do |t|
      t.string :awarded_for
      t.decimal :cost_per_like

      t.timestamps null: false
    end
  end
end
