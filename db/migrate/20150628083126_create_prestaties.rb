class CreatePrestaties < ActiveRecord::Migration
  def change
    create_table :prestaties do |t|
      t.integer :user_id
      t.date :datum
      t.integer :persoon_id
      t.string :prestatie
      t.text :opmerking
      t.integer :soort_prestatie_id
      t.string :resultaat
      t.string :tijd
      t.integer :hr
	  t.integer :hr_avg

      t.timestamps
    end
  end
end
