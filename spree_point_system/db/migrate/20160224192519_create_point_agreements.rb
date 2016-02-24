class CreatePointAgreements < ActiveRecord::Migration
  def change
    create_table :point_agreements do |t|
      t.string :awarded_for
      t.decimal :cost_per_point

      t.timestamps null: false
    end
  end
end
