class CreateProducten < ActiveRecord::Migration
  def change
    create_table :producten do |t|
      t.integer :user_id
      t.string :naam
      t.string :soort
		t.integer :score
      t.string :land
      t.string :winkel
      t.decimal :prijs
      t.string :eenheid
      t.text :opmerking
      t.string :seizoen

      t.timestamps
    end
  end
end
