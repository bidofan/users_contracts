class CreateConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :conditions do |t|
      t.integer :type
      t.boolean :trusted
      t.references :contract, null: false, foreign_key: true

      t.timestamps
    end
  end
end
