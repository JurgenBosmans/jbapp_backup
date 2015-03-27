class CreateOnderhouden < ActiveRecord::Migration
  def change
    create_table :onderhouden do |t|
      t.integer :aankoop_id
      t.integer :user_id
      t.date :datum_onderhoud
      t.date :volgende_onderhoud
      t.text :opmerking
      t.decimal :prijs
      t.integer :teller
      t.string :teller_eh

      t.timestamps
    end
  end
end
