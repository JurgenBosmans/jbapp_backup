class CreateAankopen < ActiveRecord::Migration
  def change
    create_table :aankopen do |t|
      t.integer :user_id
      t.string :artikel
      t.date :aankoopdatum
      t.string :winkel
      t.decimal :prijs
      t.integer :garantie_maanden
      t.string :soort
      t.text :opmerking

      t.timestamps
    end
  end
end
