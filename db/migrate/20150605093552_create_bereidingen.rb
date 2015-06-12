class CreateBereidingen < ActiveRecord::Migration
  def change
    create_table :bereidingen do |t|
		t.integer :user_id
		t.integer :recept_id
      	t.date :datum
      	t.text :opmerking
      	t.integer :score
      	t.timestamps
    end
  end
end
