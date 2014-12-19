class CreateNotities < ActiveRecord::Migration
  def change
    create_table :notities do |t|
      t.integer :user_id
      t.string :notitie
      t.boolean :belangrijk

      t.timestamps
    end
  end
end
