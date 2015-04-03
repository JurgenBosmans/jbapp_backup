class CreateMeterstanden < ActiveRecord::Migration
  def change
    create_table :meterstanden do |t|
      t.integer :user_id
      t.string :meter
      t.date :datum
      t.decimal :stand
      t.decimal :verbruik

      t.timestamps
    end
  end
end
