class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :naam
      t.text :beschrijving
      t.datetime :start_datum
      t.datetime :stop_datum
      t.integer :user_id

      t.timestamps
    end
  end
end
