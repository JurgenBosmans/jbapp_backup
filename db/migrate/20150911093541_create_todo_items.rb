class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :item
      t.integer :todo_id
      t.datetime :afgewerkt

      t.timestamps
    end
  end
end
