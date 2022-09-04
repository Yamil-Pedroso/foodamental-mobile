class CreatePlannings < ActiveRecord::Migration[7.0]
  def change
    create_table :plannings do |t|
      t.string :name
      t.string :week_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
